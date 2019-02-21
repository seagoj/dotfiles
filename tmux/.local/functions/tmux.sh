tmux::split() {
    if [[ "$1" == "v" ]]; then
        tmux split-window -v
    elif [[ "$1" == "h" ]]; then
        tmux split-window -h
    else
        tmux new-window -t $PROJECT
    fi
}

tmux::archey() {
    tmux::split "$1"
    tmux send-keys "archey3" C-m
}

tmux::status() {
    tmux::split "$1"
    if which archey3 &>/dev/null; then
        tmux send-keys "archey3" C-m
    elif which macInfo &>/dev/null; then
        tmux send-keys "macInfo -c" C-m
    elif
        which neofetch &>/dev/null; then
        tmux send-keys "neofetch" C-m
    fi

    if which wwwtxt &>/dev/null; then
        tmux send-keys "wwwtxt" C-m
    fi
}

tmux::irssi() {
    tmux::split "$1"
    tmux send-keys 'irssi' C-m
}

tmux::karma() {
    tmux::split "$1"
    tmux send-keys "karma start" C-m
}

tmux::ncmpcpp() {
    tmux::split "$1"
    # tmux resize-pane -L 20
    tmux send-keys "mpd; ncmpcpp" C-m
}

tmux::gulp() {
    tmux::split "$1"
    tmux send-keys "gulp" C-m
}

tmux::tail_logs() {
    if [[ "$1" == "vagrant" ]]; then
        SSHCOMMAND='vagrant ssh -c';
    else
        SSHCOMMAND="ssh $1";
    fi

    if [[ $# -eq 2 ]]; then
        DESC="$2";
    else
        DESC="$1";
    fi

    tmux new-window -t $PROJECT -n "$DESC"
    tmux send-keys "$SSHCOMMAND 'tail -f $ERRORLOG'" C-m
    tmux::split v
    tmux send-keys "$SSHCOMMAND 'tail -f $DEBUGLOG'" C-m
}
