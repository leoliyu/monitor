#!/bin/bash

# run on the 10.0.1.146
# */3 * * * * (/usr/local/admin/scripts/xmlfeed3.sh) &> /dev/null

/usr/bin/rsync -az 192.168.10.30:/home/om/OddsMatrixProd/xmlfeed/feed.tar /var/www/xmlfeed/feed.tar;
sleep 19 ;
cd /var/www/xmlfeed/ ;
tar -xvf /var/www/xmlfeed/feed.tar
mv /var/www/xmlfeed/index.xml.gz /var/www/xmlfeed/index.xml.gz.1;
gunzip -f /var/www/xmlfeed/*.gz;
mv /var/www/xmlfeed/index.xml.gz.1 /var/www/xmlfeed/index.xml.gz;
gunzip -f /var/www/xmlfeed/index.xml.gz;
find /var/www/xmlfeed -type f -mmin +60 -exec rm -f {} \;
