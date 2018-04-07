config=/etc/X11/xorg.conf.d/20-thinkpad.conf

if [[ ! -f $config ]]; then
    general::sudo $(tee $config <<< 'Section \"InputClass\"')
    general::sudo $(tee -a $config <<< '    Identifier  \"Trackpoint Wheel Emulation\"')
    general::sudo $(tee -a $config <<< '    MatchProduct    \"TPPS/2 IBM TrackPoint|DualPoint Stick|Synaptics Inc. Composite TouchPad / TrackPoint|ThinkPad USB Keyboard with TrackPoint|USB TrackPoint pointing device|Composite TouchPad / TrackPoint\"')
    general::sudo $(tee -a $config <<< '    MatchDevicePath \"/dev/input/event*\"')
    general::sudo $(tee -a $config <<< '    Option      \"EmulateWheel\"        \"true\"')
    general::sudo $(tee -a $config <<< '    Option      \"EmulateWheelButton\"  \"2\"')
    general::sudo $(tee -a $config <<< '    Option      \"Emulate3Buttons\"     \"false\"')
    general::sudo $(tee -a $config <<< '    Option      \"XAxismapping\"        \"6 7\"')
    general::sudo $(tee -a $config <<< '    Option      \"YAxisMapping\"        \"4 5\"')
    general::sudo $(tee -a $config <<< 'EndSection')
fi

if ! which acpi &>/dev/null; then
    osinstall acpi acpid
fi

if [[ ! -f /etc/modules-load.d/thinkpad-acpi.conf ]]; then
    general::sudo $(tee /etc/modules-load.d/thinkpad-acpi.conf <<< 'thinkpad-acpi')
fi

if ! which bluetoothctl &>/dev/null; then
    osinstall bluez bluez-utils
fi

if ! which notify-send &>/dev/null; then
    osinstall libnotify
fi

if ! which bashmount &>/dev/null; then
    osinstall bashmount
fi

if ! which rar &>/dev/null; then
    osinstall rar
fi

if ! which baobab &>/dev/null; then
    osinstall baobab
fi

if ! which unzip &>/dev/null; then
    osinstall unzip
fi

if ! which setxkbmap &>/dev/null; then
    osinstall setxkbmap
fi
