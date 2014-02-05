#!/usr/bin/env python

import roslib
roslib.load_manifest('sound_play')
roslib.load_manifest('rospy')

from subprocess import call
import rospy
from qt_gui.plugin import Plugin
from python_qt_binding import QtGui,QtCore
from python_qt_binding.QtGui import QWidget, QFrame
from python_qt_binding.QtGui import QGroupBox
from python_qt_binding.QtCore import QSignalMapper, qWarning, Signal
from sound_play.msg import SoundRequest
from sound_play.libsoundplay import SoundClient


class SimpleGUI(Plugin):

    # This is a static variable (avoids creating multiple Signal objects)
    sound_sig = Signal(SoundRequest)

    def __init__(self, context):
        # First setup
        # ######################################################################
        # Initialize with super
        super(SimpleGUI, self).__init__(context)

        # Publish the name of this object and create underlying widget.
        self.setObjectName('SimpleGUI')
        self._widget = QWidget()
        
        # Create underlying sound client
        self._sound_client = SoundClient()

        # Register to receive sound (and actaully play it).
        #
        # For more info, check out API here:
        # http://docs.ros.org/api/rospy/html/rospy.topics.Subscriber-class.html
        #
        # rospy.Subscriber( name [graph resource name of topic],
        #                   data_class [data type class to use for messages],
        #                   callback [function to call when data is received,
        #                   ... [see ])
        rospy.Subscriber('robotsound', SoundRequest, self.sound_cb)

        # Set font for tool tip...
        QtGui.QToolTip.setFont(QtGui.QFont('SansSerif', 10))

        # Use the static sound_sig instance, connects to the sound signal
        # callback function (below).
        self.sound_sig.connect(self.sound_sig_cb)


        # Large box
        # ######################################################################
        # Create the overall box in the GUI
        large_box = QtGui.QVBoxLayout()


        # Button (command_cb) box
        # ######################################################################
        # Create a box layout and then add a button that says "Say something".
        button_box = QtGui.QHBoxLayout()
        button_box.addWidget(self.create_button('Say something'))
        button_box.addStretch(1)

        # Now, add this box layout (with button widget) to large box.
        large_box.addLayout(button_box)
        large_box.addItem(QtGui.QSpacerItem(100,20))
        
        # Speech box
        # ######################################################################
        # Create another box layout, this time with a label in it. Turn blue.
        speech_box = QtGui.QHBoxLayout()
        self.speech_label = QtGui.QLabel('Robot has not spoken yet')
        palette = QtGui.QPalette()
        palette.setColor(QtGui.QPalette.Foreground,QtCore.Qt.blue)
        self.speech_label.setPalette(palette)
        speech_box.addWidget(self.speech_label)

        # Now, add this box layout (with label) to the large box.
        large_box.addLayout(speech_box)
        large_box.addStretch(1)

        # Base movement
        # ######################################################################
        

        # Final publishing
        # ######################################################################
        # No we name our underlying widget. Did we need to do this AND the
        # naming of ourselves at the beginning?
        self._widget.setObjectName('SimpleGUI')

        # This presumably sets the overall layout to the large box.
        self._widget.setLayout(large_box)

        # I don't know if the context is the overall QT GUI window; probably.
        # Regardless, we add our widget to it.
        context.add_widget(self._widget)
        
    def sound_cb(self, sound_request):
        '''Callback: Play the sound'''
        qWarning('Received sound.')
        self.sound_sig.emit(sound_request)
        
    def create_button(self, name):
        '''Macro for creating a button that links to the command callback
        function "command_cb"'''
        btn = QtGui.QPushButton(name, self._widget)
        btn.clicked.connect(self.command_cb)
        return btn

    def sound_sig_cb(self, sound_request):
        '''This sound signal receiver; some difference between sound_cb.'''
        qWarning('Received sound signal.')
        #if (sound_request.command == SoundRequest.SAY):
        qWarning('Robot said: ' + sound_request.arg)
        self.speech_label.setText('Robot said: ' + sound_request.arg)

    def command_cb(self):
        '''What happens when you press the button'''
        button_name = self._widget.sender().text()
        if (button_name == 'Say something'):
            qWarning('Robot will say: something')
            self._sound_client.say('something')
            
    def shutdown_plugin(self):
        # TODO unregister all publishers here
        pass

    def save_settings(self, plugin_settings, instance_settings):
        # TODO save intrinsic configuration, usually using:
        # instance_settings.set_value(k, v)
        pass

    def restore_settings(self, plugin_settings, instance_settings):
        # TODO restore intrinsic configuration, usually using:
        # v = instance_settings.value(k)
        pass

