#!/bin/sh
for i in `seq 18`; do echo "sec$i:" ; echo "----->"  ; ssh sec$i $1; echo "<-----"; done
