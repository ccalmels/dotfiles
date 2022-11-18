#!/bin/sh

case $1 in
    lock)
	sleep .5
	exec systemctl suspend
	;;
    pass)
	exec passmenu
	;;
    startup)
	. $HOME/.fehbg
	;;
esac
