#!/bin/sh

# Synchronization time .
(/usr/sbin/ntpdate -u 0.europe.pool.ntp.org && /sbin/hwclock --systohc) > /dev/null 2>&1
/usr/sbin/ntpdate -u 0.europe.pool.ntp.org  && /sbin/hwclock --systohc
*/30 * * * * (/usr/sbin/ntpdate -u 0.europe.pool.ntp.org && /usr/sbin/hwclock --systohc) &> /dev/null
