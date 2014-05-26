# General purpose
alias rebash='source ~/.bashrc'
alias ea='emacs ~/.bash_aliases'
alias erc='emacs ~/.bashrc'
alias gits='git status'
alias gitb='git branch'
alias gita='git add .'
alias gitc='git commit -m'
alias gpom='git push origin master'
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
