# Enhance your terminal

## 1. Install **ZSH**

```bash
sudo apt install zsh
```

## 2. Install **Oh My Zsh**

```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Now log out and then log back into your account to load default shell settings.

## 3. Download and replace your ZSH configuration file **.zshrc**

```bash
mv $HOME/.zshrc $HOME/.zshrc_backup
wget -P $HOME  https://raw.githubusercontent.com/piotrekvs/Tutorials/master/Enhance_terminal/.zshrc
```

## 4. Customize Oh My Zsh

### Plugins

* **zsh-autosuggestions**

  ```bash
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  ```

* **zsh-syntax-highlighting**

  ```bash
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  ```

### Theme

* **Powerlevel10k**

  ```bash
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
  ```

  You can now configure Powerlevel10k theme with command:

  ```bash
  p10k configure
  ```

## 5. Install **Tmux**

```bash
sudo apt install tmux
git clone https://github.com/gpakosz/.tmux.git $HOME/.tmux
ln -s -f $HOME/.tmux/.tmux.conf $HOME
cp $HOME/.tmux/.tmux.conf.local $HOME
sed -i "s/^#set -g mouse on$/set -g mouse on/" $HOME/.tmux.conf.local
```
