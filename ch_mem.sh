#!/bin/bash

# use on 10.0.1.159

PID=`ps -ef | grep java | grep npa | awk '{print $2}'`
MEM_USED=`cat /proc/$PID/status | grep VmHWM | awk '{print $2}'`
MEM_LIMIT="11000000"
LOG=/usr/local/admin/scripts/npa/logs/act.log
if [ "$MEM_USED" -gt "$MEM_LIMIT" ] ; then
        echo "Memory usage of the npa is higher than 11 Gb . Usage : $MEM_USED . Please take action . Date : $date" >> $LOG
        echo "Memory usage of the npa is higher than 11 Gb . Please take action . Date : $date" | mail -s "NPA memory usage" systeam@betbrain.com  wxx@betbrain.com tl@betbrain.com
                                else
        echo "Memory usage of the npa is lower than 11 Gb . Usage : $MEM_USED . Usage : $MEM_USED : $date" >> $LOG
fi
