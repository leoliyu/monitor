#!/bin/sh

# chech disk .

HOSTNAME=`hostname`
DATE=`date`
LOGFILE=/usr/local/admin/scripts/disks/disks.log
MAX=85

echo "Check date : $DATE" >> $LOGFILE
    USAGE=`df -hT /dev/mapper/VolGroup00-LogVol00 | awk 'NR==3 {print $5}' | cut -d% -f1`

        if [ "$USAGE" -gt "$MAX" ]; then
        echo " Disk / has more de $MAX% disk usage. Current usage is $USAGE%. ---ALERT---" >> $LOGFILE
        echo "On $HOSTNAME the disk / has more than $MAX% usage. Current usage is $USAGE% " | mail -s "Disk usage alert on $HOSTNAME" alerts@betbrain.com
                                    else
        echo " Disk / has  $USAGE% disk usage" >> $LOGFILE
        fi
        echo "------------------------" >> $LOGFILE
        echo "                        " >> $LOGFILE
