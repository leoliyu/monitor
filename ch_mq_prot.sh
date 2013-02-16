#!/bin/sh
DATE=$(date -d "today" +"%Y-%m-%d_%H:%M:%S")
LOGFILE=/usr/local/admin/scripts/MQ/log.log
STAG2A=`/usr/bin/curl -m 30 -s -G http://192.168.10.12:8161/ |grep 2005-2007|awk '{print $4}'`
STAG2B=`/usr/bin/curl -m 30 -s -G http://192.168.10.22:8161/ |grep 2005-2007|awk '{print $4}'`
if [ "$STAG2A" = "Apache" ] ; then 
echo " Stage2a's ActiveMQ is working . Date :  $DATE" >> $LOGFILE 
echo "------" >> $LOGFILE
else
echo  "ActiveMQ is WARNING , stag2a at 8161 . Please take action, time is $DATE  . " | mail -s " Stage2a's ActiveMQ usage ."  ec@oddsmatrix.com  ly@betbrain.com
echo " ActiveMQ is WARNING , stag2a at 8161 . Please take action, time is $DATE " >> $LOGFILE
echo "----------------------" >> $LOGFILE
fi

if [ "$STAG2B" = "Apache" ] ; then
echo " Stage2b's ActiveMQ is working . Date :  $DATE" >> $LOGFILE
echo "------" >> $LOGFILE
else
echo  "ActiveMQ is WARNING , stag2b at 8161 . Please take action, time is $DATE  . " | mail -s " stage2b's ActiveMQ usage ."  ec@oddsmatrix.com ly@betbrain.com
echo " ActiveMQ is WARNING , stag2b at 8161 . Please take action, time is $DATE " >> $LOGFILE
echo "----------------------" >> $LOGFILE
fi
