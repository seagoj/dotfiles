#!/bin/bash

# run `hcitool scan` to get valid mac address
# MACADDRESS = 23:E4:87:4C:B3:A1

sudo apt-get update
# s/KeyboardDisplay/DiplayYesNo/g in /usr/bin/bluez-simple-agent
bluez-simple-agent hci0 $MACADDRESS
bluez-test-device trusted $MACADDRESS yes
bluez-test-input connect $MACADDRESS yes
