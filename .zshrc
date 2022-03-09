# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#[[ $TERM = "xterm" ]] && { tmux && exit 0; }
#
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="agnoster_custom"
ZSH_THEME="powerlevel10k/powerlevel10k"
DEFAULT_USER=`whoami`

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

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
plugins=(
    gitfast
    vi-mode
    brew
    docker
    zsh-syntaxhighlighting
    pyenv
)

# User configuration

export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/home/jonathan/anaconda/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
export PATH=/usr/local/share/npm/bin:$PATH
export PATH=~/.local/bin:$PATH
export PYTHONDONTWRITEBYTECODE=True

# PHP configuration
#export PATH=/usr/local/opt/php@7.1/bin:$PATH
#export PATH=/usr/local/opt/php@7.1/sbin:$PATH

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh
export EDITOR="/usr/bin/vim"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
 alias zshrc="vim ~/.zshrc"
 alias vimrc="vim ~/.vimrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias panda="pandoc *.md -o notes.pdf --highlight-style tango"
alias notes="cd ~/Documents/notes"
alias push="git push"
alias pull="git pull"
alias gits="git status"
alias galaxy="cd ~/devel/GalaxyTools"
alias dotfiles="cd ~/dotfiles"
alias trackpoint="sudo configure-trackpoint"
alias power="sudo shutdown -h now"
alias ="fg"
alias bluetooth_on="sudo rfkill unblock bluetooth"
alias bluetooth_off="sudo rfkill block bluetooth"
alias home_wifi="sudo ip link set wlp3s0 down && sudo netctl start home_wifi"
alias uf_wifi="sudo ip link set wlp3s0 down && sudo netctl start uf_wifi"
alias i3_config="vim ~/.config/i3/config"
# alias xset for mouse
alias ssh_minix="ssh -p 3022 root@localhost"
alias thunder_uf="ssh -l jpoisson thunder.cise.ufl.edu"
alias ssh_jpblog="ssh root@45.55.141.161"
alias ssh_jpblog_safe="ssh safeuser@45.55.141.161"
alias matrix="cmatrix"
alias mongodb_start="sudo systemctl start mongodb"
alias mongodb_status="sudo systemctl status mongodb"
alias mongodb_stop="sudo systemctl stop mongodb"
alias vim="nvim"
alias dm="docker-machine"
alias cat="ccat"
alias gc='(){ git checkout $1 ;}'
alias gcn='(){ git checkout -b $1 ;}'
alias mysql='mycli'
alias alacritty='alacritty&'
alias snowsql='/Applications/SnowSQL.app/Contents/MacOS/snowsql'

##################################
###########Custom################
#

# Map 'jk' to escape to vi-mode instead of escape
bindkey -M viins 'jk' vi-cmd-mode

# Auto complete settings
#source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
#ZSH_AUTOSUGGEST_STRATEGY=(history completion)
#ZSH_AUTOSUGGEST_USE_ASYNC=1
#bindkey '^ ' autosuggest-accept

# Syntax Highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export NVM_DIR="/Users/jp-aib/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
# where to store our virtual envs
export WORKON_HOME=$HOME/virtenvs
# where projects will reside
export PROJECT_HOME=$HOME/git
# where is the virtualenvwrapper.sh
source $HOME/.local/bin/virtualenvwrapper.sh

# Z setup
. /usr/local/etc/profile.d/z.sh

#Sol config
export PATH="/usr/local/opt/vim@7.4/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:/usr/bin/python"
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:/usr/local/go/bin"
export PATH=/usr/local/php5/bin:$PATH
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

export GOPATH="$HOME/go"

# Start tmux
tmux
# Rename window to random emoji
#EMOJI=(🐶 🐱 🐭 🐹 🐰 🦊 🐻 🐼 🐨 🐯 🦁 🐮 🐷 🐽 🐸 🐵 🙊 🙉 🙊 🐒 🐔 🐧 🐦 🐤 🐣 🐥 🦆 🦅 🦉 🦇 🐺 🐗 🐴 🦄 🐝 🐛 🦋 🐌 🐚 🐞 🐜 🕷 🕸 🐢 🐍 🦎 🦂 🦀 🦑 🐙 🦐 🐠 🐟 🐡 🐬 🦈 🐳 🐋 🐊 🐆 🐅 🐃 🐂 🐄 🦌 🐪 🐫 🐘 🦏 🦍 🐎 🐖 🐐 🐏 🐑 🐕 🐩 🐈 🐓 🦃 🕊 🐇 🐁 🐀 🐿 🐾 🐉 🐲);
#RANDOM_EMOJI=${EMOJI[$((RANDOM%88))]};

#tmux rename-window -t${TMUX_PANE} "$RANDOM_EMOJI"
# clear terminal
clear
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PIPENV_PYTHON="$PYENV_ROOT/shims/python"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# added by Snowflake SnowSQL installer v1.2
export PATH=/Applications/SnowSQL.app/Contents/MacOS:$PATH
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
