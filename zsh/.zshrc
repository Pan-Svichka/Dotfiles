#!/bin/bash

~/stuff/scripts/randomizer.sh
cal
echo "Роби переклад"
#date "+%A, %B %d, %Y"


# some useful options (man zshoptions)
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
stty stop undef		# Disable ctrl-s to freeze terminal.
zle_highlight=('paste:none')
alias sp="sudo poweroff"
#alias wineosu='WINEPREFIX=~/home/pan_svichka/prg/gms/osu/osu!wine+prefix/osu!prefix'
#alias cdr="cd ~/stuff/code/rust/projects"

# Specify the location of the history file
HISTFILE="$HOME/.histfile"
#HISTSIZE=10000000000000000000
SAVEHIST=100000000000

# beeping is annoying
unsetopt BEEP
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
alias xc='cls && source ~/.zshrc && source ~/.zshenv'

# Enable colorized output for ls
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Add custom bin directory to the PATH
export PATH="$HOME/bin:$PATH"
export PATH=$PATH:/sbin/:/usr/sbin:/usr/bin:
export PKG_CONFIG_LIBDIR=/usr/local/lib/pkgconfig:/usr/lib64/pkgconfig/

if test -z "${XDG_RUNTIME_DIR}"; then
    export XDG_RUNTIME_DIR=/tmp/${UID}-runtime-dir
    if ! test -d "${XDG_RUNTIME_DIR}"; then
        mkdir "${XDG_RUNTIME_DIR}"
        chmod 0700 "${XDG_RUNTIME_DIR}"
    fi
fi

# Set editor to nano (you can change this to your preferred text editor)
export EDITOR="nvim"
export VISUAL="nvim"
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

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=4"


# Plugins
#plugins=(zsh-users/zsh-autosuggestions)
#plugins=(zsh-users/zsh-syntax-highlighting)
#plugins=(hlissner/zsh-autopair)
#plugins=(esc/conda-zsh-completion) false
# For more plugins: https://github.com/unixorn/awesome-zsh-plugins
# More completions https://github.com/zsh-users/zsh-completions

# Key-bindings
bindkey -s '^R' 'ranger^M'
bindkey -s '' 'btop^M'
#bindkey -s '^n' 'nvim $(fzf)^M'
bindkey -s '^V' 'nvim\n'
bindkey -s '^Z' 'nvim ~/.config/hypr/hyprland.conf^M'
bindkey -s '^N' 'nvim ~/.zshrc^M'
bindkey -s '^A' 'nvim ~/.zshenv^M'

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

