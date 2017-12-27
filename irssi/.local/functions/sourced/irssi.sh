irssi() {
    run-dockerized \
        --repo jess/irssi \
        --container irssi \
        -v /etc/localtime:/etc/localtime \
        -v ${HOME}/.irssi:/home/user/.irssi \
        --arguments "${@}"
}
