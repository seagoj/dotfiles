config=/etc/X11/xorg.conf.d/20-thinkpad.conf

if [[ ! -f $config ]]; then
    echo "Section \"InputClass\"" | sudo tee $config
    echo "    Identifier 	\"Trackpoint Wheel Emulation\"" | sudo tee -a $config
    echo "    MatchProduct 	\"TPPS/2 IBM TrackPoint|DualPoint Stick|Synaptics Inc. Composite TouchPad / TrackPoint|ThinkPad USB Keyboard with TrackPoint|USB TrackPoint pointing device|Composite TouchPad / TrackPoint\"" | sudo tee -a $config
    echo "    MatchDevicePath \"/dev/input/event*\"" | sudo tee -a $config
    echo "    Option 		\"EmulateWheel\" 		\"true\"" | sudo tee -a $config
    echo "    Option 		\"EmulateWheelButton\" 	\"2\"" | sudo tee -a $config
    echo "    Option 		\"Emulate3Buttons\" 	\"false\"" | sudo tee -a $config
    echo "    Option 		\"XAxismapping\" 		\"6 7\"" | sudo tee -a $config
    echo "    Option 		\"YAxisMapping\" 		\"4 5\"" | sudo tee -a $config
    echo "EndSection" | sudo tee -a $config
fi

if ! which acpi &>/dev/null; then
    osinstall acpi acpid
fi

if [[ ! -f /etc/modules-load.d/thinkpad-acpi.conf ]]; then
    echo "thinkpad-acpi" | sudo tee /etc/modules-load.d/thinkpad-acpi.conf
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
