function delete_remote_merged_branches() {
    git fetch origin
    git remote prune origin

    for BRANCH in `git branch -r --merged origin/master |\
        egrep "^\s*origin/"                  |\
        grep -v master                       |\
        cut -d/ -f2-`
    do
        git push origin :$BRANCH
    done
}

function weekly_summary() {
    LAST_WEEK=$(date -v-7d +%m/%d)

    STATS=$(
        git log --since=1.week --oneline |
            tail -n 1                        |
            awk '{ print $1 }'               |
            xargs git diff --shortstat
    )

    FEATURES=$(
        git log --since=1.week --oneline |
        egrep "Merge (pull|branch) "
    )

    FEATURES_COUNT=$(
        echo "$FEATURES" |
            sed '/^\s*$/d'   |
            wc -l            |
            awk '{ print $1 }'
    )

    echo "Stats ($LAST_WEEK - Today)"
    echo "---------------------"
    echo "$STATS"
    echo
    echo "Features ($FEATURES_COUNT)"
    echo "-------------"
    echo "$FEATURES"
}

git::clone() {
    echo dirname $!
    local remoteRepo="${1}"
    local localRepo="${2:-/tmp/}"

    if [ ! -d "${localRepo}" ]; then
        mkdir -p "${localRepo}"
    fi
    git clone --recurse-submodules "${remoteRepo}" "${localRepo}"
}
