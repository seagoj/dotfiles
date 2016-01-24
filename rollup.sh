#!/bin/sh

# EMAIL=seagoj@gmail.com
EMAIL=seagoj@keybase.io
declare -a SECRETS=($(find . -name *.gpg))

for i in "${SECRETS[@]%.gpg}"; do
    if ! echo $i | grep ".password-store" > /dev/null; then
        gpg --batch --yes --quiet --output $i.gpg --encrypt --recipient $EMAIL $i
        cat .gitignore | grep -q ${i:2} || echo ${i:2} >> .gitignore
    fi
done
