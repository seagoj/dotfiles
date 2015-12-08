$HOME/bin/resetSshPermissions
git remote rm origin &&\
    git remote add origin git@github.com:seagoj/dotfiles.git &&\
    git submodule update
