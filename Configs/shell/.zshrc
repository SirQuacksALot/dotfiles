# Starship prompt
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"

# zoxide (smart cd)
eval "$(.local/bin/zoxide init zsh)"
export PATH=$PATH:~/.local/bin

# fzf keybindings and completions
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# Autosuggestions config
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#666666"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# History settings
HISTSIZE=50000
SAVEHIST=50000
HISTFILE=~/.zsh_history
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# Useful aliases
alias ls="lsd -lh"
alias ll="lsd -lah"
alias ..="cd .."
alias ...="cd ../.."
# alias gs="git status"
# alias glog="git log --oneline --graph --decorate -20"


bindkey -e

bindkey '^[[1;5D' beginning-of-line
bindkey '^[[1;5C' end-of-line
bindkey '^[[1;3D' backward-word
bindkey '^[[1;3C' forward-word
bindkey '^[[3;3~' kill-line

