# Based on: https://github.com/YASoftwareDev/dotfiles/blob/master/zsh/.zshrc



# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.npm-global/bin:$HOME/.yarn/bin:$HOME/bin:/usr/local/bin:$HOME/.local/bin:$HOME/.android-studio/bin:$PATH

HISTSIZE=1000000
SAVEHIST=1000000

# Path to your oh-my-zsh installation (first assume that we start from docker)
[ -d /root/.oh-my-zsh ] && export ZSH=/root/.oh-my-zsh
[ -d /home/${USER}/.oh-my-zsh ] && export ZSH=/home/${USER}/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

ZSH_THEME="powerlevel10k/powerlevel10k"
#ZSH_THEME="robbyrussell"

DEFAULT_USER="${USER}"


# AUTO-COMPLETION
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"
#
# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"


# UPDATES
# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"
#
# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13


# OTHER
# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"
#
# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"
#
# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"
#
# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git history history-substring-search dircycle dirhistory fasd docker vi-mode last-working-dir fzf-tab zsh-autosuggestions fast-syntax-highlighting)
plugins=(git colored-man-pages dirhistory docker vi-mode last-working-dir zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC="true"

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export EDITOR='vim'
# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export KEYTIMEOUT=1
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias :e=vim
alias :q=exit
alias :wq='echo "You are not in vim, dummy"'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

[[ $TMUX = "" ]] && export TERM="xterm-256color"

