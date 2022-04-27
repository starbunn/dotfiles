# Setup fzf
# ---------
if [[ ! "$PATH" == */home/ashe/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/ashe/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/ashe/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/ashe/.fzf/shell/key-bindings.zsh"
