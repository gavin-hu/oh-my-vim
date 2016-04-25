#!/bin/bash

# sh oh-my-vim.sh [install,uninstall,backup,restore]

function validate() {
    #
    avaliable_commands=("install" "uninstall" "backup" "restore" "help")
    #
    message="./oh-my-vim.sh [install, uninstall, backup, restore]"
    #
    if [ -z $1 ]; then
        echo $message    
        exit 1
    fi

    match=0
    for avaliable_command in ${avaliable_commands[@]}; do
        if [ "$avaliable_command" == "$1" ]; then
            match=1
            break
        fi
    done

    if [ $match -eq 0 ]; then
        echo $message
        exit 1
    fi

    if [$OH_MY_VIM ]; then
        if ! [ -d $OH_MY_VIM]; then
            echo "Oh My Vim 未下载！"
        fi
    else
        if ! [ -d ~/.oh-my-vim ]; then
            echo "Oh My Vim 未下载!" 
        fi
    fi

}

function dispatch() {
    
    if [ "$1" == "install" ]; then
        backup
        install
    fi

    if [ "$1" == "uninstall" ]; then
        uninstall
        restore
    fi

    if [ "$1" == "backup" ]; then
        backup
    fi

    if [ "$1" == "restore" ]; then
        restore
    fi
}

function install() {
    if [ $OH_MY_VIM ]; then
        ln -sf $OH_MY_VIM/vimrc ~/.vimrc
    else
        ln -sf ~/.oh-my-vim/vimrc ~/.vimrc
    fi
}

function uninstall() {
    if [ -L ~/.vimrc ]; then
        rm -f ~/.vimrc
    fi
}

function backup() {
    if [ -f ~/.vimrc ]; then
        mv -f ~/.vimrc ~/.vimrcbackup
    fi
    if [ -d ~/.vim ]; then
        mv -f ~/.vim ~/.vimbackup
    fi
}


function restore() {
    if [ -f ~/.vimrcbackup ]; then
        mv -f ~/.vimrcbackup ~/.vimrc
    fi
    if [ -d ~/.vimbackup ]; then
        mv -f ~/.vimbackup ~/.vim
    fi
}


validate $1

dispatch $*
