#!/bin/sh

EMAIL=seagoj@gmail.com
declare -a SECRETS=($(find . -name *.gpg))

for i in "${SECRETS[@]%.gpg}"; do
    gpg --batch --yes --quiet --output $i.gpg --encrypt --recipient $EMAIL $i
    cat .gitignore | grep -q $i && echo $i >> .gitignore
done
