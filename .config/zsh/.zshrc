#!/bin/sh
export ZDOTDIR=$HOME/.config/zsh
lolcat $ZDOTDIR/shellheader
setopt appendhistory
setopt inc_append_history
export HISTTIMEFORMAT="[%F %T] "
setopt extended_history

# some useful options
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
stty stop undef # Disable Ctrl+S to freeze terminal, apparently.
zle_highlight=('paste:none')

# beep = annoying
unsetopt beep

# useful functions
source "$ZDOTDIR/zsh-functions"
# good to source files

# completions
# Colors
autoload -Uz colors && colors

xrandr() {
  /usr/bin/xrandr "$@"
  nitrogen --set-centered ~/Wallpaper.png
}

[ "$(which starship)" ] && eval "$(starship init zsh)"

if [ ! -d "/tmp/$(whoami)/screenshots" ]; then
    mkdir -p "/tmp/$(whoami)/screenshots"
fi

[ "$(which bat)" ] && export BAT_THEME="Catppuccin" &&

# [ "$(which nvm)" ] && source /usr/share/nvm/init-nvm.sh
. /opt/asdf-vm/asdf.sh
[ -f "$HOME/bin/log" ] && alias log='~/bin/log'

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk
autoload -Uz compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
zmodload zsh/complist
_comp_options+=(globdots)

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

zsh_add_file "zsh-vim-mode"
zsh_add_file "zsh-plugins"
zsh_add_file "zsh-completions"
zsh_add_file "zsh-bindings"
compinit
zsh_add_file "zsh-exports"
zsh_add_file "zsh-fzf"
zsh_add_file "zsh-aliases"
zsh_add_file "inits.sh"
# source ~/.config/zsh/rose-pine-fzf/fzf.sh
#if [ "$TERM" = "linux" ]; then
#    /bin/echo -e "
#    \e]P0403c58
#    \e]P1ea6f91
#    \e]P29bced7
#    \e]P3f1ca93
#    \e]P434738e
#    \e]P5c3a5e6
#    \e]P6eabbb9
#    \e]P7faebd7
#    \e]P86f6e85
#    \e]P9ea6f91
#    \e]PA9bced7
#    \e]PBf1ca93
#    \e]PC34738e
#    \e]PDc3a5e6
#    \e]PEeabbb9
#    \e]PFffffff
#    "
#    # get rid of artifacts
#    clear
#fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# zsh_add_file "zsh-nvm"
export PATH=$PATH:/home/ashx/.spicetify
