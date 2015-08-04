#!/bin/sh

# declare -i LOGTAB
# LOGTAB=$1

source $FUNCTIONS/split.tmux

function tailLogs {
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

    # tmux new-window -t $PROJECT:$LOGTAB -n "$DESC"
    tmux new-window -t $PROJECT -n "$DESC"
    tmux send-keys "$SSHCOMMAND 'tail -f $ERRORLOG'" C-m
    split v
    tmux send-keys "$SSHCOMMAND 'tail -f $DEBUGLOG'" C-m
    # LOGTAB=$LOGTAB+1
}
