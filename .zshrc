# -----------------------------------------
# Oh My Zsh Setup
# -----------------------------------------
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# -----------------------------------------
# Powerlevel10k Config
# -----------------------------------------
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# -----------------------------------------
# Portable PATH Setup
# -----------------------------------------
export PATH="/usr/local/bin:/opt/homebrew/bin:$PATH"

# -----------------------------------------
# pyenv (only load if installed)
# -----------------------------------------
if command -v pyenv &>/dev/null; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

# -----------------------------------------
# direnv (only load if installed)
# -----------------------------------------
if command -v direnv &>/dev/null; then
  eval "$(direnv hook zsh)"
fi

# -----------------------------------------
# asdf (optional)
# -----------------------------------------
if [ -f "$HOME/.asdf/asdf.sh" ]; then
  . "$HOME/.asdf/asdf.sh"
fi

# -----------------------------------------
# Remove hardcoded JAVA_HOME
# -----------------------------------------
unset JAVA_HOME

# -----------------------------------------
# Aliases
# -----------------------------------------
[[ -f ~/.aliases ]] && source ~/.aliases

# -----------------------------------------
# End
# -----------------------------------------