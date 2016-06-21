# if ! cat /etc/hosts | grep local.api.bonfyreapp.com >/dev/null; then
#     general::sudo "tee -a /etc/hosts <<< '127.0.0.1    local.api.bonfyreapp.com'" >/dev/null
# fi

if ! cat /etc/hosts | grep "local.beta.bonfyreapp.com" >/dev/null; then
    general::sudo 'tee -a /etc/hosts <<< 127.0.0.1\ \ \ \ local.beta.bonfyreapp.com' #>/dev/null
fi
