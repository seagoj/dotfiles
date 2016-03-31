#!/bin/zsh

if ! which pomo &>/dev/null; then
    autoload updateRepo; updateRepo https://github.com/rukshn/pomodoro pomodoro
    popd
fi
