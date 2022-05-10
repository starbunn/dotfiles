# Setup fzf
# ---------
if [[ ! "$PATH" == */lapi/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/lapi/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/lapi/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/lapi/.fzf/shell/key-bindings.zsh"
