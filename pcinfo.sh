#!/bin/sh
#DATE=$(date -d "today" +"%Y-%m-%d_%H:%M")
PATH=/usr/kerberos/sbin:/usr/kerberos/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin
FILE=$(uname -a |awk '{print $2}')
echo > $FILE.info
echo > $FILE.cvs
# start  Collection of server's information 
hostname > $FILE
ifconfig -a |grep  "inet addr:" |grep -v '127.0.0.1' |awk '{print $2} '|sed 's/^addr://g' | awk 'BEGIN{ORS=";"}{print $0}'| awk 'BEGIN{ORS=","}{print $0}' >> $FILE
ifconfig -a |grep 'HWaddr'|awk '{print  $5}'  | awk 'BEGIN{ORS=";"}{print $0}' | awk 'BEGIN{ORS=","}{print $0}' >> $FILE
cat /proc/cpuinfo | grep name | cut -f2 -d: |head -n 1 >> $FILE
dmidecode |grep -A16 "System Information$" |grep "Product Name:" |grep -v 'System'|awk '{print $3}'|head -n 1 >> $FILE
dmidecode |grep -A16 "System Information$" |grep "Manufacturer:" |grep -v 'System'|awk '{print $2}' >> $FILE
dmidecode |grep 'Range Size:'|head -n 1 | awk '{print $3,$4}' >> $FILE
dmidecode |grep 'Speed:' |grep -v 'Unknown'  |awk '{print $2}'|grep -v 'Speed:' | awk 'BEGIN{ORS=";"}{print $0}' | awk 'BEGIN{ORS=","}{print $0}'  >> $FILE
smartctl -a /dev/sda |grep 'Device Model:' |sed 's/^Device Model:     //g' >> $FILE
cat /etc/issue |head -n 1 >> $FILE
date -d "today" +"%Y-%m-%d_%H:%M:%S" >> $FILE
#tr '\n' ',' < $FILE
awk 'BEGIN{ORS=","}{print $0}' $FILE >> $FILE.cvs
mv $FILE  $FILE.info
cat $FILE.cvs
