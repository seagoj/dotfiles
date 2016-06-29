. $HOME/functions/ssh.sh

if ! which ssh >/dev/null; then
    osinstall ssh
fi

if ! which ssh-copy-id >/dev/null; then
    osinstall ssh-copy-id
fi

ssh::reset_permissions

git remote rm origin &&\
    git remote add origin git@github.com:seagoj/dotfiles.git &&\
    git submodule update --recursive --init
