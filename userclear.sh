USERRS='ap cdp av sdm mab tli jh wf lch wxx zzs mxx rm et bbg os kh rap tj njh'
SYSUSER="root bin dbus daemon adm lp sync shutdown halt mail news uucp operator games nobody rpm vcsa messagebus sshd jss ntp mailnull smmsp mysql xfs ftp rpc rpcuser data cactiuser named feed-robot collectorapp roboserver exim sybase tomcat  hacluster nscd squid gopher lighttpd webalizer"
USERRS="$USERRS $SYSUSER"

OLDUSER=`cat /etc/passwd|cut -d: -f1`

#echo $OLDUSER
KKKKK=$OLDUSER

for TEMP1 in $USERRS
do
	DDDDDD=$KKKKK
	KKKKK=`echo "$DDDDDD" |grep -v $TEMP1`
done

for TEMP2 in  $KKKKK
do
	userdel -r $TEMP2
done

echo $KKKKK
