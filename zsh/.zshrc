#!/bin/bash


echo "█     █░▓█████  ██▓     ▄████▄   ▒█████   ███▄ ▄███▓▓█████    ▄▄▄█████▓ ▒█████     ▒███████▒  ██████  ██░ ██  ▐██▌ 
▓█░ █ ░█░▓█   ▀ ▓██▒    ▒██▀ ▀█  ▒██▒  ██▒▓██▒▀█▀ ██▒▓█   ▀    ▓  ██▒ ▓▒▒██▒  ██▒   ▒ ▒ ▒ ▄▀░▒██    ▒ ▓██░ ██▒ ▐██▌ 
▒█░ █ ░█ ▒███   ▒██░    ▒▓█    ▄ ▒██░  ██▒▓██    ▓██░▒███      ▒ ▓██░ ▒░▒██░  ██▒   ░ ▒ ▄▀▒░ ░ ▓██▄   ▒██▀▀██░ ▐██▌ 
░█░ █ ░█ ▒▓█  ▄ ▒██░    ▒▓▓▄ ▄██▒▒██   ██░▒██    ▒██ ▒▓█  ▄    ░ ▓██▓ ░ ▒██   ██░     ▄▀▒   ░  ▒   ██▒░▓█ ░██  ▓██▒ 
░░██▒██▓ ░▒████▒░██████▒▒ ▓███▀ ░░ ████▓▒░▒██▒   ░██▒░▒████▒     ▒██▒ ░ ░ ████▓▒░   ▒███████▒▒██████▒▒░▓█▒░██▓ ▒▄▄  
░ ▓░▒ ▒  ░░ ▒░ ░░ ▒░▓  ░░ ░▒ ▒  ░░ ▒░▒░▒░ ░ ▒░   ░  ░░░ ▒░ ░     ▒ ░░   ░ ▒░▒░▒░    ░▒▒ ▓░▒░▒▒ ▒▓▒ ▒ ░ ▒ ░░▒░▒ ░▀▀▒ 
  ▒ ░ ░   ░ ░  ░░ ░ ▒  ░  ░  ▒     ░ ▒ ▒░ ░  ░      ░ ░ ░  ░       ░      ░ ▒ ▒░    ░░▒ ▒ ░ ▒░ ░▒  ░ ░ ▒ ░▒░ ░ ░  ░ 
  ░   ░     ░     ░ ░   ░        ░ ░ ░ ▒  ░      ░      ░        ░      ░ ░ ░ ▒     ░ ░ ░ ░ ░░  ░  ░   ░  ░░ ░    ░ 
    ░       ░  ░    ░  ░░ ░          ░ ░         ░      ░  ░                ░ ░       ░ ░          ░   ░  ░  ░ ░    
                       ░                                                           ░                               "


# some useful options (man zshoptions)
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
stty stop undef		# Disable ctrl-s to freeze terminal.
zle_highlight=('paste:none')
alias sp="sudo poweroff"
alias wine32='WINEPREFIX=$(realpath ~/.local/share/wineprefixes/wine32/) wine'
alias wine32p='WINEPREFIX=~/.local/share/wineprefixes/wine32/'
alias cdr="cd ~/stuff/code/rust/projects"
##Emacs stuff
if [[ "$INSIDE_EMACS" = 'vterm' ]]; then
    alias clear='vterm_printf "51;Evterm-clear-scrollback";tput clear'
fi


# Specify the location of the history file
HISTFILE="$HOME/.histfile"
#HISTSIZE=10000000000000000000
SAVEHIST=100000000000

# beeping is annoying
setopt BEEP
setopt SHARE_HISTORY
# Colors
autoload -Uz colors && colors

# Set the prompt
PS1="[%F{red}%*%f]%n%F{lightblue} —>%f %~ %% "
PS3="[%F{red}%*%f]%n%F{lightblue}@%m ->%f %~ %F{red}%f%% "
PS2="%n@%m %~ %# "

# Define some aliases
alias ll="ls -l"
alias la="ls -a"
alias cls="clear"
alias ls='ls --color=auto'
alias xb-i="sudo xbps-install" 

# Enable colorized output for ls
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Add custom bin directory to the PATH
export PATH="$HOME/bin:$PATH"
export PATH=$PATH:/sbin/:/usr/sbin:/usr/bin:
export PKG_CONFIG_LIBDIR=/usr/local/lib/pkgconfig:/usr/lib64/pkgconfig/

# Set editor to nano (you can change this to your preferred text editor)
export EDITOR="nvim"

# Enable history sharing between multiple Zsh sessions
setopt share_history

# Enable autocorrect
setopt correct

#Theme
ZSH_THEME="default"

# Initialize fzf if installed (a fuzzy finder)
if [ -e /usr/local/opt/fzf/shell/completion.zsh ]; then
    source /usr/local/opt/fzf/shell/key-bindings.zsh
    source /usr/local/opt/fzf/shell/completion.zsh
fi

# completions
autoload -Uz compinit

compinit
_comp_options+=(globdots)

# Customize menu completion behavior and highlight options
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "=(#b) #([0-9]#)*=36"

zmodload zsh/complist

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
autoload -Uz colors && colors


#plugins2
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source ~/stuff/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=4"


# Plugins
plugins=(zsh-users/zsh-autosuggestions)
plugins=(zsh-users/zsh-syntax-highlighting)
plugins=(hlissner/zsh-autopair)
#plugins=(esc/conda-zsh-completion) false
# For more plugins: https://github.com/unixorn/awesome-zsh-plugins
# More completions https://github.com/zsh-users/zsh-completions



# Key-bindings
bindkey -s '^R' 'ranger^M'
bindkey -s '' 'btop\n'
#bindkey -s '^n' 'nvim $(fzf)^M'
bindkey -s '^v' 'nvim\n'
bindkey '^[[P' delete-char
bindkey "^k"   up-line-or-beginning-search # Up
bindkey "^j"   down-line-or-beginning-search # Down
bindkey "^l"   forward-word
bindkey "^h"   backward-word

bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
bindkey '^[[3~'   delete-char
bindkey "^H"      backward-delete-char
bindkey "^[[H"    beginning-of-line
bindkey "^[[F"    end-of-line
bindkey "^[[2~"   delete-char 

autoload edit-command-line; zle -N edit-command-line
 bindkey '^e' edit-command-line
