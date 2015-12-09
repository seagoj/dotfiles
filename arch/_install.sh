#!/bin/bash

if [[ ! -f /usr/share/kbd/consolefonts/ter-212n.psf.gz ]]; then
    osinstall terminus-font
fi

echo "FONT=ter-212n" | sudo tee /etc/vconsole.conf
echo "FONT_MAP=8859-2" | sudo tee -a /etc/vconsole.conf
