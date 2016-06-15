if ! which pomo &>/dev/null; then
    dotfiles::update_repo https://github.com/rukshn/pomodoro pomodoro
    popd
fi
