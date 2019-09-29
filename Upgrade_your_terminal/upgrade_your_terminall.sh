#!/bin/bash
 
cd
sudo apt install zsh

#Install oh-my-zsh
sh -c "$(wget -qO- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#Download .zshrc
cd
wget https://raw.githubusercontent.com/YASoftwareDev/dotfiles/master/zsh/.zshrc

mv .zshrc .zshrc_
mv .zshrc.1 .zshrc
# change powerline10k to powerline9k
# comment everything that causes errors, eg. fasd.



#Plugins

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k


#Install tmux
sudo apt install tmux

cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

# Uncoment mouse-mode