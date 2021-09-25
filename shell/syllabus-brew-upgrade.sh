#!/usr/bin/env bash

# brew update && brew upgrade --cask $(brew list --cask) && brew autoremove && brew cleanup --prune=all
# brew update && brew upgrade --cask iina sublime-text iterm2 visual-studio-code docker microsoft-edge wechat motrix maczip
# brew uninstall microsoft-auto-update 
# brew autoremove 
# brew cleanup --prune=all
# adrive
echo -e "Start brew update"
brew update 
brew upgrade --cask iina sublime-text iterm2 visual-studio-code docker microsoft-edge wechat motrix v2rayu betterzip
if [[ -n $(brew list --cask | grep "microsoft-auto-update") ]]; then
    echo -e "\nStart brew uninstall microsoft-auto-update"
    brew uninstall microsoft-auto-update
fi
echo -e "\nStart brew autoremove"
brew autoremove 
brew cleanup --prune=all
