# Setting disk limit.

myquota(){
    echo -e "[1] Install the quota package"
    echo -e "[2] Enabling Filesystem Quota"
    echo -e "[3] Turn on quota"
    echo -e "[4] Turn off quota"
    echo -e "[5] Add disk quota for the user"
    echo -e "[6] Generating Quota Reports"

    echo -e "Your input: \c"
    read func
    if [ "${func}" = "1" ];then
        sudo apt install quota
    elif [ "${func}" = "2" ];then
        echo "1. [sudo vim /etc/fstab]"
        echo "2. add [usrquota] and/or [grpquota] options in the options field ([4th]) of the /etc/fstab file"
        echo "3. [sudo reboot]"
    elif [ "${func}" = "3" ];then
        echo -e "turn on quota on which filesystem (default: /): \c"
        read file_sys
        if [ "${file_sys}" = "" ];then
            file_sys="/"
        fi
        sudo quotaon -v ${file_sys}
    elif [ "${func}" = "4" ];then
        echo -e "turn on quota on which filesystem (default: /): \c"
        read file_sys
        if [ "${file_sys}" = "" ];then
            file_sys="/"
        fi
        sudo quotaoff -v ${file_sys}
    elif [ "${func}" = "5" ];then
        awk -F':' '{ print $1}' /etc/passwd
        echo -e "Select the users you need to assign quotas to (If not specified, then for all users): \c"
        read select_user
        if [ "${select_user}" = "" ];then
            echo "Setting all the users' disk limit with a same configuration."
            # TODO
            echo "haven't done! error!"
        else
            echo "Setting a specific disk limit for: ${select_user}"
            echo -e "Do you want to copy config from other user, if yes, plese specify user name: \c"
            read yon
            if [ "${yon}" = "" ];then
                sudo edquota -u ${select_user}
            else
                sudo edquota -p ${yon} ${select_user}
            fi
        fi
    elif [ "${func}" = "6" ];then
        sudo repquota -aug
    else
        echo "Invalid input!"
    fi

}
