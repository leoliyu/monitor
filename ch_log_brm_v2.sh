#!/bin/sh
DATE=$(date -d "today" +"%Y-%m-%d_%H:%M:%S")
LOGFILE=/home/yx/ch_brm_log
WORD="java.lang.OutOfMemoryError"
COMAND=`grep $WORD /usr/local/brm/logs/brm.log |sed -n '1p'|awk '{print $3}'`
if [ -z "$COMAND" ] ; then
echo "BRM is working  $DATE" >> $LOGFILE
echo "-------------------" >> $LOGFILE
else
echo "BRM is broken  $DATE" >> $LOGFILE
echo "+++++++++++++++++++" >> $LOGFILE
echo "Warning, BRM don't work, Date: $DATE . " | mail -s "Pls check BRM (10.0.4.249), log is "java.lang.OutOfMemoryError" ." yx@everymatrix.com ly@betbrain.com ec@everymatrix.com
fi
