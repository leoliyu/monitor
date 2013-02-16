#!/bin/sh
DATE=$(date -d "today" +"%Y-%m-%d_%H:%M:%S")
COMMAND=`ls -l /root/top3.txt |awk '{print $5}'`
B=2000
if [ "$COMMAND" -gt "$B" ] ; then
echo " file= $COMMAND > 1000 , log clear"
/bin/echo " top of 5 pc" |mutt -s " Warning, some pc" -a /root/top3.txt 258106510@qq.com
/bin/echo > /root/top3.txt
/bin/echo "---------------------+++$DATE" >> /root/top3.txt
else
echo " logfile < 1000 "
echo " tcpdump start"
/usr/sbin/tcpdump -n -l arp |egrep 'arp who-has' |head -100 | awk '{ print $NF }' |sort | uniq -c |sort -n |tail -5  >> /root/top3.txt
# sleep 60
/bin/echo "------------------------$DATE" >> /root/top3.txt
#/bin/echo " top of 5 pc" |mutt -s " Warning, some pc" -a /root/top3.txt 258106510@qq.com
fi
