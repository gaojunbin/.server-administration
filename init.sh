ohmyserver(){
    echo -e 'This is a toolkit for server managementadministration.'
    echo -e 'NOTE: You must be the root user to use this tool!'
    echo -e 'NOTE: Please make sure you are an administrator, proceed with caution!'
    echo -e '[*] myadduser    - Add new linux user.'
    echo -e '[*] myquota      - Limit user storage space.'
}

source myadduser.sh
source myquota.sh