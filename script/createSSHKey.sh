cd ~/.ssh
mkdir key_backup
cp id_rsa* key_backup
rm id_rsa*
ssh-keygen -t rsa -C "seagoj@gmail.com"
clip < ~/.ssh/id_rsa.pub
