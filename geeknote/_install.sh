installMac() {
    dotfiles::bootstrap python
    dotfiles::update_repo git://github.com/VitaliyRodnenko/geeknote.git geeknote &&\
        sudo python setup.py install
    popd
}

installArch() {
    dotfiles::bootstrap python
    dotfiles::update_repo git://github.com/VitaliyRodnenko/geeknote.git geeknote &&\
        osinstall python2-setuptools &&\
        sudo python2 setup.py install
    popd
}

dotfiles::install geeknote
