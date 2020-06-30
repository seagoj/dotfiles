# vim: filetype=sh:

tmux_newWindow() {
    local window="${1:-window}"
    local layout="${2:-default}"
    if [ -z "$(tmux list-windows | grep $PROJECT)" ]; then
        echo "creating new session..."
        tmux -2 new-session -d -s $PROJECT -n "${window}"
    else
        echo "creating new window in session..."
        tmux new-window -n "${window}"
    fi
    if [ "${2}" != "--no-layout" ]; then
        . "${HOME}"/.tmux/layouts/"${layout}"
    fi
}

tmux_startSession() {
    # Select first window.first pane
    tmux select-window -t $PROJECT:1
    tmux select-pane -t 1

    # Attach to session
    tmux -2 attach-session -t $PROJECT
}

tmux_split() {
    if [[ "$1" == "v" ]]; then
        tmux split-window -v
    elif [[ "$1" == "h" ]]; then
        tmux split-window -h
    else
        tmux new-window -t $PROJECT
    fi
}

tmux_archey() {
    tmux_split "$1"
    tmux send-keys "archey3" C-m
}

tmux_status() {
    tmux_split "$1"
    case $OS_TYPE in
    Arch)
        tmux send-keys "${FETCHER} && wwwtxt" C-m
        ;;
    Darwin | Mac)
        tmux send-keys "macInfo -c && wwwtxt" C-m
        ;;
    *)
        echo "$OS_TYPE"
        ;;
    esac
}

tmux_irssi() {
    tmux_split "$1"
    tmux send-keys 'irssi' C-m
}

tmux_karma() {
    tmux_split "$1"
    tmux send-keys "karma start" C-m
}

tmux_ncmpcpp() {
    tmux_split "$1"
    # tmux resize-pane -L 20
    tmux send-keys "mpd; ncmpcpp" C-m
}

tmux_gulp() {
    tmux_split "$1"
    tmux send-keys "gulp" C-m
}

tmux_tail_logs() {
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
    tmux_split v
    tmux send-keys "$SSHCOMMAND 'tail -f $DEBUGLOG'" C-m
}
