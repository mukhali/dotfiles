#!/usr/bin/env bash
# set -e
# $@表示所有参数
# $#表示所有参数的个数
# /Library/Desktop Pictures
# command + shift + /             menubar cmd


# nofree betterzip DaisyDisk
# adrive miniconda vmware-fusion cmake postman docker
# imagemagick mas stats istat-menus gitkraken maczip cleanmymac foxitreader itsycal
# CheatSheet dash omnidisksweeper

# alias syllabus="bash ~/bin/shell/syllabus-brew.sh"

BOLD='\033[1m'
RED='\033[0;31m'
BLUE='\033[0;34m'
GREEN='\033[32m'
WHITE='\033[34m'
YELLOW='\033[33m'
NO_COLOR='\033[0m'

function _usage() {
    echo -e "\n${RED}Options${NO_COLOR}:
    ${BLUE}full     ${NO_COLOR}: upgrade and cleanandprune.
    ${BLUE}clean    ${NO_COLOR}: autoremove and cleanup.
    ${BLUE}upgrade  ${NO_COLOR}: update、upgrade and uninstall auto.
    ${BLUE}cleanlogs${NO_COLOR}: cleanlogs.
    ${BLUE}usage    ${NO_COLOR}: show help message and exit.
    ${BLUE}-h|--help${NO_COLOR}: show help message and exit.
    "
}

#Clean the logs.
root_need() {
    if [[ $EUID -ne 0 ]]; then
        echo "Error:This script must be run as root!" 1>&2
        exit 1
    fi
}

function cleanlogs() {
    root_need
    printf "Emptying the system log files.\n"
    # sudo rm -rfv /private/var/log/*  > /dev/null 2>&1
    # sudo rm -rfv /Library/Logs/DiagnosticReports/* > /dev/null 2>&1
    # rm -rf ~/Library/Caches/*
}

# 
function brewupgrade () {
    brew upgrade --cask iina sublime-text iterm2 maczip vmware-fusion \
                        wechat motrix v2rayu \
                        microsoft-edge visual-studio-code microsoft-remote-desktop
}

function cleanandprune() {
    echo -e "Start brew autoremove"
    brew autoremove
    brew cleanup --prune=all
}

function uninstallmsauto() {
    if [[ -n $(brew list --cask | grep "microsoft-auto-update") ]]; then
        echo -e "\nStart brew uninstall microsoft-auto-update"
        brew uninstall microsoft-auto-update
    fi
}

function brewupdate() {
    echo -e "Start brew update"
    brew update
}

function main() {
    if [ "$#" -eq 0 ]; then
        _usage
        exit 0
    fi

    local fullcmd="$@"
    local cmd="$1"
    shift
    case "${cmd}" in
        full)
            brew upgrade --cask $(brew list --cask)
            cleanandprune
            ;;
        clean)
            cleanandprune
            ;;
        upgrade)
            brewupdate
            brewupgrade
            uninstallmsauto
            ;;
        cleanlogs)
            cleanlogs
            ;;
        usage)
            _usage
            ;;
        -h|--help)
            _usage
            ;;
        *)
            echo -e "\n${RED}Wrong Cmd Options${NO_COLOR}: ${fullcmd} ; try ${BLUE}syllabus usage${NO_COLOR} for help
            "
            ;;
    esac
}

main "$@"