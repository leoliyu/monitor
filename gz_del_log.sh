#!/bin/sh

# 10.0.1.143
# 01 */12 * * * (/usr/local/scripts/opclog.sh)

DATE=$(date -d "today" +"%Y-%m-%d_%H:%M")
cd /usr/local/opc/logs/

gzip -f opc.log.*
mkdir "$DATE"
mv opc*.gz /usr/local/opc/logs/"$DATE"
find /usr/local/opc/logs/ -type d -mtime +6 -exec rm -rf {} \;
#find /usr/local/opc/logs/ -type f -mtime +2 -exec rm -rf {} \;
