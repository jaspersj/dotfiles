# -----------------------------------------
# Custom Functions
# -----------------------------------------
pkgsearch() {
    if [ -z "$1" ]; then
        echo "Usage: pkgsearch <package-name>"
        return 1
    fi

    PKG="$1"

    echo "🔍 Searching for: $PKG"
    echo "-----------------------------------"

    ########################################
    # APT SEARCH
    ########################################
    if command -v apt-cache >/dev/null 2>&1; then
        echo "📦 APT (deb packages):"
        APT_RESULTS=$(apt-cache search "$PKG" 2>/dev/null | head -20)
        if [ -n "$APT_RESULTS" ]; then
            echo "$APT_RESULTS"
            echo ""
            echo "➡️ Install with APT:"
            echo "   sudo apt install <exact-package-name>"
        else
            echo "(no matches)"
        fi
    else
        echo "📦 APT not available."
    fi
    echo "-----------------------------------"

    ########################################
    # SNAP SEARCH
    ########################################
    if command -v snap >/dev/null 2>&1; then
        echo "📦 Snap packages:"
        SNAP_RESULTS=$(snap find "$PKG" 2>/dev/null | head -20)
        if echo "$SNAP_RESULTS" | grep -q "$PKG"; then
            echo "$SNAP_RESULTS"
            echo ""
            echo "➡️ Install with Snap:"
            echo "   sudo snap install <exact-package-name>"
        else
            echo "(no matches)"
        fi
    else
        echo "📦 Snap not installed."
    fi
    echo "-----------------------------------"

    ########################################
    # FLATPAK SEARCH
    ########################################
    if command -v flatpak >/dev/null 2>&1; then
        echo "📦 Flatpak packages:"
        FLAT_RESULTS=$(flatpak search "$PKG" 2>/dev/null | head -20)
        if [ -n "$FLAT_RESULTS" ]; then
            echo "$FLAT_RESULTS"
            echo ""
            echo "➡️ Install with Flatpak:"
            echo "   flatpak install <remote> <package-id>"
        else
            echo "(no matches)"
        fi
    else
        echo "📦 Flatpak not installed."
    fi

    echo "-----------------------------------"
    echo "✅ Search complete."
}


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