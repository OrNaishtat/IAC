#! /bin/bash
#################
# Author: New Light.
# Bello Script - Will say "Hello $USER# if there is no argument it will use $USER.
# If the user is root, the bello will say "Not allowed to use bello script"
#################
function check_root() {
if [ $EUID == 0 ]; then
	echo "Bello script can not be run as root! "
	sleep 2
	exit 1
fi
}
trigger=0
function say_hi() {
if [[  $@ != '' ]] ; then
	echo "Hi $@ "
	exit 1
else
	trigger=1
fi
}
check_root
say_hi $@

# Main #
#####################################
if [[ $trigger == 1 ]] ; then
	echo Hello $USER
fi
####################################
