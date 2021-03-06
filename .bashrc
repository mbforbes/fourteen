# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# For ROS (distro & build system config)
# --------------------------------------
# Catkin
# Call with `setros groovy` or `setros hydro`
function setros() {
    source /opt/ros/$1/setup.bash
    source ~/catkin_$1_ws/devel/setup.bash
    export ROS_PACKAGE_PATH=~/catkin_$1_ws/src/:/opt/ros/$1/share:/opt/ros/$1/stacks
    echo "ROS env:    ${1}, catkin"
}

# ROSbuild
# Call to switch to rosbuild (and groovy)
function setrosbuild() {
    source /opt/ros/groovy/setup.bash
    source ~/rosbuild_ws/setup.bash
    export ROS_PACKAGE_PATH=~/rosbuild_ws/:/opt/ros/groovy/share:/opt/ros/groovy/stacks
    echo "ROS env:    groovy, rosbuild"
}

# Pick our default ROS to use here.
#setros hydro # hydro + catkin
#setros groovy # groovy + catkin
setrosbuild # groovy + rosbuild

# Grabing IP for ROS_IP
# --------------------------------------------------------
function my_ip() # Get IP adress on ethernet.
{
	MY_IP=$(/sbin/ifconfig eth0 | awk '/inet/ { print $2 } ' |
  	sed -e s/addr://)
	#echo ${MY_IP:-"Not connected"}
}
my_ip
echo "Current IP: ${MY_IP}"

# General ROS exports
# --------------------------------------------------------
export ROS_HOSTNAME=localhost
export ROS_MASTER_URI=http://localhost:11311
export ROBOT=sim

# See bash_aliases for realrobot command (changes above vars
# for "real" robot usage).

# Python things
export PYTHONPATH=~/repos/beautyplot:$PYTHONPATH
export PYTHONPATH=~/repos/hfpbd-parser:$PYTHONPATH

# Java things
# prev working
#export JAVA_HOME=/usr/lib/jvm/java-6-openjdk-amd64

# new: try java8 just untarred from oracle
export JAVA_HOME=/usr/lib/jvm/jdk1.8.0_05

# For Dan's oflow
export PATH=~/repos/oflow:$PATH

# Format console output.
export ROSCONSOLE_FORMAT='[${severity}] [${node}@${function}:${line}]: ${message}'

# So yeah
export EDITOR='subl'
