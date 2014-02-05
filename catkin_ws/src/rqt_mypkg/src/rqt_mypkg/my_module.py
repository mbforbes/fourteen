#!/usr/bin/env python

import os
import rospy

from qt_gui.plugin import plugin
from python_qt_binding import loadUi
from python_qt_binding.QtGui import QWidget

class MyPlugin(Plugin):

	def __init__(self, context):
    super(MyPlugin, self).__init__(context)

    # Give QObjects reasonable names
    self.setObjectName('MyPlugin')

    # Process standalone plugin command-line arguments
    from argparse import ArgumentParser
    parser = ArgumentParser()

    # Add arguments(s) to the parser
    parser.add_argument("-q", "--quiet",
      action="store_true",
      dest="quiet",
      help="Put plugin in silent mode")
    args, unknowns = parser.parse_known_args(context.argv())
    if not args.quiet:
      print 'arguments:', args
      print 'unknowns:', unknowns

    # Create QWidget
    self._widget = QWidget()

    # Get path to UI file which is a sibling of this file; in this example, the
    # .ui and .py files are in the same folder.
    #
    # NOTE(max): I don't have a UI file and don't want to go through the throws
    #            of learning the language and making one right now. As such, this
    #            plugin just uses Maya's pre-built module (thier_module.py) so as
    #            to avoid this whole UI business.
    #
    ui_file = os.path.join(os.path.dirname(os.path.realpath(__file__)),
      "MyPlugin.ui")

    # Extend the widget with all attributes and children from UI file
    loadUi(ui_file, self._widget)

    # Give QObjects reasonable names
    self._widget.setObjectName('MyPluginUi')

    # Show _widget.windowTitle on left-top of each plugin (when it's set in
    # _widget). This is useful when you open multiple plugins at once. Also, if
    # you open multiple instances of your plugin at once, these lines add
    # numbers to make it easy to tell from pane to pane.
    if context.serial_number() > 1:
      self._widget.setWindowTitle(self._widget.windowTitle() +
        (' (%d)' % context.serial_number()))

    # Add widget to the user interface
    context.add_widget(self._widget)

  def shutdown_plugin(self):
    # Here we should:
    # - stop timers
    # - stop publishers
    # - unregister all publishers (is this the same as "stop publishers"?)
    # - unsubscribe from Topics (is this the same as the last two?)
    # - etc.
    pass

  def save_settings(self, plugin_settings, instance_settings):
    # TODO save intrinsic configuration, usually using:
    # instance_settings.set_value(k, v)
    pass

  def restore_settings(self, plugin_settings, instance_settings):
    # TODO restore intrinsic configuration, usually using:
    # v = instance_settings.value(k)
    pass

  # Uncomment the following to signal that the plugin has a way to be
  # configured; this will enable a setting button (gear icon) in each dock
  # widget title bar; usually used to open a modal configuration dialog.
  # def trigger_configuration(self):
  #   pass
