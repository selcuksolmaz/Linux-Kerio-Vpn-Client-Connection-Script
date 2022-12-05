#!/bin/bash

Connect () {
echo "" > /var/log/kerio-kvc/debug.log

sudo /etc/init.d/kerio-kvc start

sleep 5

xdg-open http://gateway.albasec.com.tr:4080//nonauth/totpVerify.cs

sudo /bin/sh -c "cat /var/log/kerio-kvc/debug.log | grep MAC | tail -1 | tr - : |rev|cut -d' '  -f 1|rev| xargs -I {} ip link set kvnet addr {}"

}

Disconnect () {
sudo /etc/init.d/kerio-kvc stop
}

while true; do
	echo "What action do you want to do for Kerio Vpn Client?"
	echo "1 - Connect"
	echo "2 - Disconnect"
	read color;
	case $color in
  	1) Connect 
  	break
  	;;
  	2) Disconnect 
  	break
  	;;
  	*) echo "Wrong Number Please Enter Again!";; 
	esac
done
