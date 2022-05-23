#!/bin/sh

[ -x /etc/wifi/trucrux-wifi ] || exit 0

case $1 in

"suspend")
        /etc/wifi/trucrux-wifi stop
        ;;
"resume")
        /etc/wifi/trucrux-wifi start
        if [ -f /etc/init.d/connman ]; then
                killall -9 wpa_supplicant
                /etc/init.d/connman restart
        fi
        if [ -f /etc/systemd/system/multi-user.target.wants/connman.service ]; then
                killall -9 wpa_supplicant
                systemctl restart connman.service
        fi
        ;;
esac

