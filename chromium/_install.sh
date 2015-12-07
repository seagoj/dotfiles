#!/bin/bash

if ! which chromium > /dev/null; then
    osinstall chromium

    # Set as default browser
    xdg-mime default chromium.desktop x-scheme-handler/http
    xdg-mime default chromium.desktop x-scheme-handler/https
    xdg-mime default chromium.desktop text/html
fi
