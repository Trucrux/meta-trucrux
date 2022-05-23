#!/bin/sh

[ -x /etc/bluetooth/trucrux-bt ] || exit 0

case $1 in

"suspend")
        /etc/bluetooth/trucrux-bt stop
        ;;
"resume")
        /etc/bluetooth/trucrux-bt start
        ;;
esac
