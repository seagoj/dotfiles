if ! which pomo &>/dev/null; then
    dotfiles::updateRepo https://github.com/rukshn/pomodoro pomodoro
    popd
fi
