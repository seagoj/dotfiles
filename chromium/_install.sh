if ! which chromium &>/dev/null; then
    osinstall chromium chromium-pepper-flash chromium-widevine

    # Set as default browser
    # xdg-mime default chromium.desktop x-scheme-handler/http
    # xdg-mime default chromium.desktop x-scheme-handler/https
    # xdg-mime default chromium.desktop text/html
fi
