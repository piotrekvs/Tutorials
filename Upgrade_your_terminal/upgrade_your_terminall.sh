#!/bin/bash
 
cd
sudo apt install zsh

#Install oh-my-zsh
sh -c "$(wget -qO- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#Download .zshrc
cd
mv .zshrc .zshrc_
wget https://raw.githubusercontent.com/piotrekvs/Tutorials/master/Upgrade_your_terminal/.zshrc

# Uncomment exports according to your needs.
# Uncomment aliases according to your needs.


#Plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# Configure your powerlevel10k with command "p10k configure"

#Install tmux
sudo apt install tmux

cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

# Uncoment mouse-mode
