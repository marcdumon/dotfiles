# Make zsh globbing behave like bash (no error on unmatched patterns)
setopt nonomatch

# Powerlevel10k
# -------------
# Disable Powerlevel10k instant prompt
typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# XDG Base Directories
# --------------------
# Local
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
# Global
export XDG_DATA_DIRS="/usr/local/share:/usr/share" # Overwrite; remove flatpack dirs

# Install p10k if not installed
# ----------------------------
# Set the directory for storing p10k
P10K_DIR="${XDG_DATA_HOME:-${HOME}/.local/share}/powerlevel10k/"
# Download p10k if it's not there yet
if [ ! -d "$P10K_DIR" ]; then
	mkdir -p "$(dirname $P10K_DIR)"
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$P10K_DIR"
fi

# Load p10k theme
#----------------
source ~/.local/share/powerlevel10k/powerlevel10k.zsh-theme
# Run .p10k if exist oherwise configure p10k (creates .p10k.zsh)
if [[ -f ~/.p10k.zsh ]]; then
    source ~/.p10k.zsh
else
    p10k configure
fi

# Load other plugins
# ------------------
source ~/.local/share/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.local/share/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Interactive shell setup
#------------------------
autoload -Uz compinit && compinit
setopt autocd
setopt correct

# Zsh options
HISTFILE=~/.zsh_history
setopt appendhistory   # append history instead of overwriting
setopt sharehistory    # share history between sessions
HISTSIZE=5000
SAVEHIST=5000

# Keybindings
# -----------
bindkey '\e[1;5C' forward-word
bindkey '\e[1;5D' backward-word
bindkey '^[[3;5~' kill-word

# Aliases (after loading p10k)
# ----------------------------
# ls
alias ls='ls --color=auto'
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'

# Run fastfetch in fully loaded interactive shells
if [[ $- == *i* && -n $PS1 ]]; then
    fastfetch
fi

# Fuzzy search with CTRL-R
source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
