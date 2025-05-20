#!/bin/bash

echo "=== Locale Detection Test ==="
echo "Current value of LANG: $LANG"
echo "Contents of /etc/locale.conf (if exists):"
if [ -f /etc/locale.conf ]; then
    cat /etc/locale.conf
else
    echo "File does not exist"
fi

echo -e "\nlocalectl status output:"
localectl status 

echo -e "\nScript detection result:"
/home/amrl/.config/waybar/script/locale-switcher.sh get

echo -e "\nLocale command outputs:"
echo "locale: $(locale)"
echo "locale -a | grep pt: $(locale -a | grep pt)"

echo -e "\nCheck debug log:"
echo "tail -n 5 /tmp/locale-debug.log"
tail -n 5 /tmp/locale-debug.log

echo -e "\nDone!" 