#!/bin/sh
DATE=$(date -d "today" +"%Y-%m-%d_%H:%M:%S")
LOGFILE=/home/ly/vpnline.log
SYSTEM_P=`ping 192.168.10.30 -w 2 |grep loss |awk '{print $4}'` 
SYSTEM_H=`curl -m 30 -s -G http://dh.chinabong.com/onlinetest.txt`

if [ "$SYSTEM_P" = "2" ] ; then
echo "Malta's VPN connection is ok ,  Date :  $DATE" >> $LOGFILE
echo "--------" >> $LOGFILE
else
	if [ $SYSTEM = "online" ] ; then 
	echo " website online  $DATE" >> $LOGFILE 
	echo "------------------" >> $LOGFILE
	else
	echo  "www.chinabong.com is offline, time is $DATE  . " | mail -s "chinabong offline" 13087318425@wo.com.cn

	echo "Malta's VPN connection is warning , Please take action , time is $DATE  . " | mail -s "VPN's  usage ."  13087318425@wo.com.cn alerts@betbrain.com
	echo "Malta's VPN connection is warning , Please take action , Date: $DATE" >> $LOGFILE
        fi
echo "-----------------------" >> $LOGFILE
fi
