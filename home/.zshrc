# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

path+=('/home/rbedit7/bin')
export PATH
path+=('/home/rbedit7/.config/emacs/bin')
export PATH
path+=('/home/rbedit7/go/bin')
export PATH

export EDITOR='nvim'
export VISUAL='nvim'



# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=""



# Aliases
# source ~/.bash_profile

# alias vim='nvim'
# # alias nv='nvim'
# # alias vi='nvim'
# alias c='clear'
# #alias nvimdir='cd ~/.config/nvim && nvim .'
# #alias ec='emacsclient -c -a 'emacs' &'
# alias q='exit'
# #alias tmuxconf='nvim ~/.config/tmux/tmux.conf'
# alias hypr='nvim ~/.config/hypr/'
# #alias ghu='yadm add -u && yadm commit -m "update" && yadm push'
# #alias uni='yazi ~/documents/uni/'
# #alias celeste='./games/celeste-linux/Celeste'
# alias zzz='systemctl hybrid-sleep'
# #alias vault='cd ~/documents/vault'
# #alias notes='yazi notes'
# alias ls='eza -a --icons=always'
# alias ll='eza -al --icons=always'
# alias lt='eza -a --tree --level=1 --icons=always'
# alias y='yazi'
# alias wtr='curl wttr.in/Richmond+Hill'
# alias rw='richweather'
#




PATH=$PATH:/home/bin/

export PATH="$PATH:${$(find ~/.local/bin -maxdepth 1 -type d -printf %p:)%%:}"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git sudo zsh-256color zsh-syntax-highlighting zsh-autosuggestions zsh-vi-mode)
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export PATH=$PATH:/home/rbedit7/.spicetify

# loading starship

eval "$(starship init zsh)"
# pfetch
./weather.sh



PROMPT_EOL_MARK=''

 

# alias this='some command'
# function rr {
#    sudo !!
# }

#
#
# if command -v lsd > /dev/null; then
#   # alias vim='nvim'
#   # alias nv='nvim'
# #alias nvimdir='cd ~/.config/nvim && nvim .'
# #alias ec='emacsclient -c -a 'emacs' &'
# #alias q='exit'
# #alias tmuxconf='nvim ~/.config/tmux/tmux.conf'
#   # alias hypr='nvim ~/.config/hypr/'
# #alias ghu='yadm add -u && yadm commit -m "update" && yadm push'
# #alias uni='yazi ~/documents/uni/'
# #alias celeste='./games/celeste-linux/Celeste'
#   # alias zzz='systemctl hybrid-sleep'
# #alias vault='cd ~/documents/vault'
# #alias notes='yazi notes'
#   alias ls='eza -a --icons'
#   alias ll='eza -al --icons=always'
#   alias lt='eza -a --tree --level=1 --icons=always'
# fi

# Created by `pipx` on 2024-12-30 18:15:22
export PATH="$PATH:/home/rbedit7/.local/bin"


# Aliases
# source ~/.bash_profile

alias vim='nvim'
alias nv='nvim'
alias vi='nvim'
alias c='clear'
#alias nvimdir='cd ~/.config/nvim && nvim .'
#alias ec='emacsclient -c -a 'emacs' &'
alias q='exit'
#alias tmuxconf='nvim ~/.config/tmux/tmux.conf'
alias hypr='nvim ~/.config/hypr/'
#alias ghu='yadm add -u && yadm commit -m "update" && yadm push'
#alias uni='yazi ~/documents/uni/'
#alias celeste='./games/celeste-linux/Celeste'
alias zzz='systemctl hybrid-sleep'
#alias vault='cd ~/documents/vault'
#alias notes='yazi notes'
alias ll='eza -a --icons=always'
alias ls='eza -al --icons=always'
alias lt='eza -a --tree --level=1 --icons=always'
alias y='yazi'
alias wtr='curl wttr.in/Richmond+Hill'
alias rw='richweather'
alias nvc='cd $HOME/.config/nvim && vim'
alias lta='eza -lTag --level=4 --icons=always'



## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/rbedit7/.dart-cli-completion/zsh-config.zsh ]] && . /home/rbedit7/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

