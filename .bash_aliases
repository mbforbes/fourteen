# General purpose
alias rebash='source ~/.bashrc'
alias ea='emacs ~/.bash_aliases'
alias erc='emacs ~/.bashrc'
alias gits='git status'
alias gitb='git branch'
alias gita='git add .'
alias gitc='git commit -m'
alias gpom='git push origin master'
alias gcheck='python ~/repos/git-checker/checker.py'
alias n='nautilus'
alias rm='rm -i'
alias u='cd ..' #thanks, justin

# PbD
alias realrobot='unset ROBOT; unset ROS_HOSTNAME; export ROS_MASTER_URI=http://c1:11311; export ROS_IP=$MY_IP'
alias dashboard='realrobot; rosrun rqt_pr2_dashboard rqt_pr2_dashboard'
alias pbd='cd ~/rosbuild_ws/pr2_pbd/'
alias int='pbd; cd pr2_pbd_interaction/src'
alias data='pbd; cd pr2_pbd_interaction/data'
alias anl='data; cd experimentAnalysis'
alias gotest='data; cd experimentTesting'
alias gui='pbd; cd pr2_pbd_gui'
alias java8='/usr/lib/jvm/jdk1.8.0_05/bin/java'
alias hfp='cd ~/repos/hfpbd-parser;'
alias hfpw='hfp; python parser/web/web_interface.py'
alias hfps='hfp; python parser/core/frontends.py ros'

# SIM robot
alias r1='roslaunch pr2_pbd_interaction simulated_robot.launch'

# SIM PbD backend
alias r2='roslaunch pr2_pbd_interaction pbd_backend.launch sim:=true'

# SIM | REALROBOT PbD frontend
alias r3='roslaunch pr2_pbd_interaction pbd_frontend.launch'

# For NLP folks (this is the 'original' system, using
# sphinx w/ old words) SIM | REALROBOT PbD frontend.
alias r4='roslaunch pr2_pbd_interaction pbd_demo_desktop_sphinx.launch'


# The following are for running interactive manipulation (IM).
# backend (sim)
alias im_be='roslaunch pr2_interactive_manipulation pr2_interactive_manipulation_robot.launch sim:=true reactive_grasping:=true'
# frontend (sim)
alias im_fe='roslaunch pr2_interactive_manipulation_frontend pr2_interactive_manipulation_desktop.launch sim:=true'
# frontend (real robot)
alias im_ferr='roslaunch pr2_interactive_manipulation_frontend pr2_interactive_manipulation_desktop.launch'

# New launch: sim stack
alias sim='roslaunch pr2_pbd_interaction pbd_simulation_stack.launch'

# Connect to rostest maseter
alias testip='export ROS_MASTER_URI=http://localhost:22422'
