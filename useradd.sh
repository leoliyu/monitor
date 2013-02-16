#!/bin/sh

#this script was written by Tomas and used for add user to the servers.

#username was given by the first argument
UNAME=$1

if [ -z $UNAME ]; then
        echo "USAGE:  $0 username"
        exit 1
fi

#default password for new users
DPASS='brainn.565'

#creat on which servers(need rsa-key or other comfirm method, or you need to enter the password one by one for each server)
#SERVERS='www1 www2 www3 frontend oddsdb oddsdb2 oddsdb3 stage testjava ads arbitrage backup banner1 banner2 banner3 banner4 bannerdb bannertest bmoc moc core-oc1 core-oc2 db failover frontend2 frontendbanner frontendbanner2 mail mail2 monitor util util2'

#SERVERS=`seq 220 253`
SERVERS=`seq 23`
#SERVERS=fw

#if [ -z $SERVERS ]; then
#       echo "ERROR: please edit this file and fill the servers"
#       exit 1
#fi




# inactive days, if you don't want user to change their password, please un-comment this line
#INACT='-f 3'

for VAR in  $SERVERS
do
        echo oc${VAR}
        ssh oc${VAR} "/usr/sbin/useradd -G staff $INACT $UNAME && echo $DPASS |passwd --stdin $UNAME &&  chage -d 0 $UNAME"
done

ssh util "/usr/sbin/useradd -G staff $INACT $UNAME && echo $DPASS |passwd --stdin $UNAME &&  chage -d 0 $UNAME"
