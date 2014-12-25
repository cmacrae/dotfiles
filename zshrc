# Functions
autoload -Uz zutil
autoload -Uz compinit
autoload -Uz complist
autoload -Uz colors
autoload -Uz vcs_info

# Bindings
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward
bindkey '^K' kill-whole-line
bindkey "\e[2~" overwrite-mode          # Ins
bindkey "\e[3~" delete-char             # Delete
bindkey '^A'    beginning-of-line
bindkey '^E'    end-of-line
bindkey '^R' history-incremental-search-backward # Fix reverse search in tmux

# Activation
compinit
colors

# Source other configs
for file in $HOME/.zsh/rc/*.zsh; do
  source $file
done

# Prompts (right prompt sourced from vcs.zsh)
export "PROMPT=
%{$fg[blue]%}%m %{$fg[red]%}$ %{$reset_color%}"
export "RPROMPT=%{$fg[red]%}%~%f%b"

# Evaluate system PATH
if [ -x /usr/libexec/path_helper ]; then
    eval `/usr/libexec/path_helper -s`
fi