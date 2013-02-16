#!/bin/sh

DATE=$(date -d "today" +"%Y-%m-%d_%H:%M:%S")
LOGFILE=/root/admin/ztdsline.log
SYSTEM_P=`ping stage.zt906.com -w 2 |grep loss |awk '{print $4}'` 
#SYSTEM_H=`curl -m 30 -s -G http://www.zt906.com/about/contact.html |grep /body`
SYSTEM_H=` curl -o /dev/null -s -w %{http_code} http://www.zt906.com/about/contact.html`

if [ "$SYSTEM_H" = "200" ]; then
	echo " website online  $DATE" >> $LOGFILE
	echo "--------" >> $LOGFILE

	elif [ "$SYSTEM_P" = "2" ]; then
		echo "ztds 100M DX line is ok , but website is offline ; Date :  $DATE" >> $LOGFILE
		echo "ztds 100M DX line is ok , but website is offline ; time is $DATE . " | mail -s " Line is ok , but website is down. " 15874090151@139.com  15874820176@139.com
		echo "------------------" >> $LOGFILE
	else
		echo  " ztds 100M DX line is warning , Please take action , tell: 1183259; time is $DATE  . " | mail -s " ztds 100M DX line is warning " 15874090151@139.com  15874820176@139.com
	       	echo  " ztds 100M DX line is warning , Please take action , tell: 1183259; time is $DATE  . " >> $LOGFILE
		echo "-----------------------" >> $LOGFILE

fi
exit 0
