#!/bin/bash

# files here
hook_i="./ascii_fun.install"
hook="./ascii_fun.hook"
ascii_img="./ascii_img"


# files there
fin_hook_i="/usr/lib/initcpio/install/ascii_fun"
fin_hook="/usr/lib/initcpio/hooks/ascii_fun"
fin_ascii_img="/usr/lib/initcpio/ascii_img"

help(){
    echo "This is the install script to install your fun ascii start up hook"
    echo "to install run $0 install"
    echo "to uninstall run $0 uninstall"
    echo "must be root"
    exit 1
}

check(){
    if [ "$(id -u)" != "0" ]; then
        echo "I require complete control of your computer in order to continue!!!" 1>&2
        echo "Do you really trust me?" 1>&2
        exit 1
    elif ! [[ -e $hook_i ]]; then
        echo missing  $hook_i
        exit 1
    elif ! [[ -e $hook ]]; then
        echo missing  $hook
        exit 1
    elif ! [[ -e $ascii_img ]]; then
        echo missing  $ascii_img
        exit 1
    fi
}
run_install(){
    echo installing
	install -o root -g root -m 0644  $hook_i $fin_hook_i
	install -o root -g root -m 0644  $hook $fin_hook
	install -o root -g root -m 0644  $ascii_img $fin_ascii_img
    echo done
}
run_uinstall(){
    echo "removing $fin_hook"
	rm $fin_hook
    echo "removing $fin_hook_i"
	rm $fin_hook_i
    echo "removing $fin_ascii_img"
	rm $fin_ascii_img
}


if [[ $1 == "install" ]]; then
    check
    run_install
elif [[ $1 == "uninstall" ]]; then
    run_uninstall
else
    help
fi
# vim: set ft=sh ts=4 sw=4 et:
