## ! DO NOT MANUALLY INVOKE THIS setup.py, USE CATKIN INSTEAD. OTHERWISE
## YOUR HEAD WILL BE SET ON FIRE AND THE ANGRY ROS GODS WILL SMITE YOU
## AND EVERYTHING YOU ONCE HELD DEAR. 
##
## Also, it might confuse Ubuntu.

from distutils.core import setup
from catkin_pkg.python_setup import generate_distutils_setup

# fetch vals from package.xml
setup_args = generate_distutils_setup(
	packages=['rqt_mypkg'],
    package_dir={'': 'src'},
    requires=['rqt_gui', 'rqt_gui_py', 'rospy', 'sound_play']
)

setup(**setup_args)