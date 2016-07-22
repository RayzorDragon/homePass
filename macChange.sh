#!/bin/sh
if [ "$1" != "" ]; then
	NEWMAC=$1
else
	NEWMAC="4E:53:50:4F:4F:46"
fi

echo 'Changing Mac Clone Address to ' $NEWMAC

ifconfig eth1 down
ifconfig eth1 hw ether $NEWMAC
ifconfig eth1 up

nvram set w10_hwaddr=$NEWMAC
nvram set def_whwaddr=$NEWMAC

stopservice wan
startservice wan

