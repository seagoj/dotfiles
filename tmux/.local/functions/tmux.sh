# vim: filetype=sh:

tmux_commandWeather='wego 2 || weather'
tmux_commandMotd="${FETCHER} && wwwtxt"

tmux_attachOrCreate() {
    if tmux has-session -t "$PROJECT" >/dev/null; then
        tmux -u attach -d -t "${PROJECT}"
    else
        tmux_createFromScript
    fi
}

tmux_createFromScript() {
    local script_dir="${TMUX_SCRIPT_HOME:-$HOME/.tmux/projects}"
    local script_default="${TMUX_SCRIPT_DEFAULT:-general}"
    local script="${PROJECT:-$script_default}"

    source_or_default "$script_dir"/"$script" "$script_dir"/"$script_default"
}

tmux_window() {
    if ! tmux has-session -t "$PROJECT" >/dev/null; then
        tmux -2 new-session -d -s "$PROJECT" -n "$1"
    else
        tmux new-window -n "$1"
    fi
}

tmux_createSession() {
    echo "creating new session..."
    tmux -2 new-session -d -s "$1"
}

tmux_layout() {
    local layout_dir="${TMUX_LAYOUT_HOME:-$HOME/.tmux/layouts}"
    local layout_default="${TMUX_LAYOUT_DEFAULT:-default}"
    local layout="${1:-$layout_default}"

    source_or_default "$layout_dir"/"$layout" "$layout_dir"/"$layout_default"
}

source_or_default() {
    if [ -f "$1" ]; then
        source "$1"
    else
        source "$2"
    fi
}

tmux_attachSession() {
    # Select first window.first pane
    tmux select-window -t $PROJECT:1
    tmux select-pane -t 1

    # Attach to session
    tmux -2 attach-session -t $PROJECT
}
