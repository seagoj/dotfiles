. $HOME/.local/functions/general.sh
. "${HOME}"/.local/functions/sourced/osinstall.sh

GPG="gpg"

dotfiles::package_append() {
    if [[ -f $1 ]]; then
        while IFS=\= read var value; do
            PACKAGES+=($var)
            values+=($value)
        done < $1
    fi
}

dotfiles::generate_packages(){
    PACKAGES+=($OS)
    PACKAGES+=($SHELL)
    dotfiles::package_append ${OS}/.packages
    dotfiles::package_append general/.packages
}

dotfiles::process_packages() {
    dotfiles::banner
    dotfiles::set_gpg
    dotfiles::generate_packages
    dotfiles::validate_encrypted
    dotfiles::decrypt_secrets
    dotfiles::bootstrap ${PACKAGES[@]}
    general::info "Logout and back in for changes to take effect"
}

dotfiles::banner() {
    dotfiles::install figlet lolcat

    figlet dotfiles | lolcat
}

dotfiles::set_gpg() {
    which gpg2 &>/dev/null && GPG="gpg2"
}

dotfiles::bootstrap() {
    declare -a PACKS=("${@}")

    for p in "${PACKS[@]}"; do
        general::info "$p stowing"
        dotfiles::stow $p
        if [[ $? -ne 0 ]]; then
            general::fail "$p: stowing"
        fi

        if [[ -f $p/_install.sh ]]; then
            general::info "$p: installing"
            source $p/_install.sh
            if [[ $? -ne 0 ]]; then
                general::fail "$p: installing"
            fi
        fi

        general::success $p
    done
}

dotfiles::stow() {
    stow -D $1
    stow --ignore=_install.sh --ignore=.packages -vt $HOME $1 &>/dev/null
}

dotfiles::decrypt() {
    $GPG --batch --yes --quiet --use-agent --output $1 --decrypt $1.gpg
}

dotfiles::stow_functions() {
    declare -a FUNCTIONS=($(ls **/.local/functions/*.sh))
    for i in "${FUNCTIONS[@]%/*/*/*}"; do
        dotfiles::stow $i
    done
    source $HOME/.zshenv &>/dev/null
}

dotfiles::validate_encrypted() {
    if ! which md5 >/dev/null; then
        echo "unable to verify secrets have been decrypted. install md5"
        exit 1
    fi

    local EMAIL="seagoj@keybase.io"

    dotfiles::set_gpg
    declare -a SECRETS=($(find . -path ./pass/.password-store -prune -o -name "*.gpg" -print0 | xargs -0))
    for FILE in "${SECRETS[@]%.gpg}"; do
        if ! echo "$FILE" | grep ".password-store" >/dev/null; then
            current_md5=`md5 -q $FILE`
            repo_md5=`$GPG --batch --yes --quiet --use-agent --output - --decrypt $FILE.gpg | md5 -q`
            if [[ "$current_md5" != "$repo_md5" ]]; then
                echo "changes not encrypted in ${FILE}. run 'make encrypt' before installation"
                exit 1
            fi
        fi
    done
}

dotfiles::decrypt_secrets() {
    dotfiles::set_gpg
    declare -a SECRETS=($(find . -path ./pass/.password-store -prune -o -name "*.gpg" -print0 | xargs -0))
    for i in "${SECRETS[@]%.gpg}"; do
        if ! echo $i | grep ".password-store" >/dev/null; then
            dotfiles::decrypt $i
        fi
        if [[ $? -ne 0 ]]; then
            echo "unable to decrypt"
            exit 1
        fi
    done
}

dotfiles::encrypt() {
    local EMAIL=$1
    local FILE="$2"

    $GPG --batch --yes --quiet --output "$FILE.gpg" --encrypt --recipient $EMAIL $FILE
}

dotfiles::ignore() {
    local FILE=$1

    cat .gitignore | grep -q ${FILE:2} || echo ${FILE:2} >> .gitignore
}

dotfiles::remove() {
    local FILE=$1

    git rm --cached $FILE &>/dev/null
}

dotfiles::encrypt_secrets() {
    local EMAIL=$1

    dotfiles::set_gpg
    declare -a SECRETS=($(find . -path ./pass/.password-store -prune -o -name "*.gpg" -print0 | xargs -0))
    if [[ ! -d backup-secrets ]]; then
        mkdir -p backup-secrets
    fi

    for FILE in "${SECRETS[@]%.gpg}"; do
        if ! echo "$FILE" | grep ".password-store" >/dev/null; then
            echo "$FILE"
            cp "$FILE" backup-secrets/
            dotfiles::encrypt $EMAIL "$FILE"
            dotfiles::remove "$FILE"
            dotfiles::ignore "$FILE"
        fi
    done
}

dotfiles::notYetImplemented() {
    echo "$OS_TYPE is not yet implemented for $1."
    exit 1
}

dotfiles::clearFunc() {
    if type $1 &>/dev/null; then
        if type $1 | grep 'function' &>/dev/null; then
            unset -f $1
        fi
    fi
}

dotfiles::install() {
    while [[ $# > 0 ]]; do
        if ! which $1 &>/dev/null; then
            case $OS_TYPE in
            Arch)
                if type installArch | grep 'function' >/dev/null; then
                    installArch
                else
                    dotfiles::notYetImplemented $1
                fi
                ;;
            Darwin | Mac)
                if type installMac | grep 'function' >/dev/null; then
                    installMac
                elif type installDarwin | grep 'function' >/dev/null; then
                    installDarwin
                else
                    dotfiles::notYetImplemented $1
                fi
                ;;
            *)
                dotfiles::notYetImplemented $1
                ;;
            esac
        fi

        dotfiles::clearFunc installArch
        dotfiles::clearFunc installDarwin
        dotfiles::clearFunc installMac
        shift
    done
}

dotfiles::update_repo() {
    if [[ $# -ne 2 ]]; then
        echo Invalid parameters
        exit 1
    fi

    dotfiles::bootstrap git

    repo="${CODE:-${$HOME}/code}/${2}"

    if [[ ! -d $repo/.git ]]; then
        git clone --recursive ${1} $repo &&\
            pushd $repo
    else
        pushd $repo && git pull
    fi
}

dotfiles::mv_bin() {
    dotfiles::mv_all bin .local
}

dotfiles::mv_all() {
    if [[ $# == 0 ]]; then
        general::info "usage: dotfiles::mv_local [directory to move]"
    fi

    source_dir=${1}
    parent_dest_dir=${2:-".local"}

    declare -a BINS=($(ls -d **/${source_dir}))
    for i in "${BINS[@]}"; do
        package_path=`dirname ${i}`
        if [[ "." != "${package_path}" ]]; then
            new_bin_root="${package_path}/${parent_dest_dir}"
            if [[ ! -d ${new_bin_root} ]]; then
                mkdir -p ${new_bin_root}
            fi
            mv "${i}" "${new_bin_root}/"
        fi
    done
}
