# Create a new user account
# Create a keygen for an existed user
myadduser(){
    echo -e "Do you only want to creat keygen for existed user? ([y]/n)? \c"
    read flag_existed

    echo -e "The path to save new keygen of new user (default: $PWD/admin_ssh_keygen): \c"
    read path_to_save_keygen
    if [ "${path_to_save_keygen}" = "" ];then
        path_to_save_keygen="${PWD}/admin_ssh_keygen"
    fi
    sudo mkdir -p $path_to_save_keygen

    echo -e "user name: \c"
    read user_name

    if [ "${flag_existed}" = "y" ];then
        echo -e "user home dir (default: /home/${user_name}): \c"
        read user_home
        if [ "${user_home}" = "" ];then
            user_home="/home/${user_name}"
        fi
    else
        echo -e "user home dir (default: /home/${user_name}): \c"
        read user_home
        if [ "${user_home}" = "" ];then
            user_home="/home/${user_name}"
        fi

        sudo useradd -m -d ${user_home} -s ${SHELL} ${user_name}
    fi

    echo -e "server name: \c"
    read server_name

    sudo mkdir -p "${user_home}/.ssh"
    sudo ssh-keygen -f "${path_to_save_keygen}/${user_name}_${server_name}"
    cat "${path_to_save_keygen}/${user_name}_${server_name}.pub" | sudo tee -a "${user_home}/.ssh/authorized_keys"
    sudo rm "${path_to_save_keygen}/${user_name}_${server_name}.pub"

    # change own
    sudo chown -R "${user_name}:${user_name}" "${user_home}/.ssh"

    # change mod
    sudo chmod 700 "${user_home}/.ssh"
    sudo chmod 600 "${user_home}/.ssh/authorized_keys"
    sudo chown -R "$USER:$USER" "${path_to_save_keygen}"

    echo "Congratulations, it worked. Please download the key and log in."
    echo "key file path: ${path_to_save_keygen}/${user_name}_${server_name}"
}
