ohmyserver(){
    echo -e 'This is a toolkit for server administration.'
    echo -e 'NOTE: You must be the root user to use this tool!'
    echo -e 'NOTE: Please make sure you are an administrator, proceed with caution!'
    echo -e '[*] myadduser    - Add new linux user.'
    echo -e '[*] myquota      - Limit user storage space.'
}

server_administration_root="$HOME/.server-administration"
source "${server_administration_root}/myadduser.sh"
source "${server_administration_root}/myquota.sh"