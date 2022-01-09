#!/bin/bash
# Update the apt package list.
sudo apt install curl wget git -y

# install zsh
sudo apt install zsh -y


# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# update robbyrussell
cp dieter_mod.zsh-theme ~/.oh-my-zsh/themes/

# install plugins
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions


# add plugins
sed -i 's/^plugins=(\(.*\)/plugins=(git extract web-search yum git-extras docker vagrant terraform mvn aws pip zsh-autosuggestions zsh-completions history-substring-search zsh-syntax-highlighting \1/' ~/.zshrc
sed -i -r 's/ZSH_THEME=.*/ZSH_THEME="dieter_mod"/' ~/.zshrc
# usr/bin takes precedence over windows' apps
sed -i '$ a export PATH="$PATH:/usr/bin"'  ~/.zshrc

# zsh git slow issue
git config --global --add oh-my-zsh.hide-dirty 1
