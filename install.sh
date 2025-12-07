#!/usr/bin/env bash
set -e

echo "🔧 Installing your zsh environment..."

# -------------------------
# 1. Install Homebrew (if missing)
# -------------------------
if ! command -v brew &> /dev/null; then
  echo "🍺 Homebrew not found. Installing..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Load brew environment
eval "$(/opt/homebrew/bin/brew shellenv || true)"
eval "$(/usr/local/bin/brew shellenv || true)"

brew update

# -------------------------
# 2. Install required tools
# -------------------------
echo "📦 Installing pyenv, direnv, and nvm..."
brew install pyenv direnv nvm

# -------------------------
# 3. Create NVM directory
# -------------------------
mkdir -p "$HOME/.nvm"

# -------------------------
# 4. Install Oh My Zsh
# -------------------------
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "💤 Installing Oh My Zsh..."
  RUNZSH=no KEEP_ZSHRC=yes \
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# -------------------------
# 5. Install Powerlevel10k
# -------------------------
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

if [ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]; then
  echo "🎨 Installing Powerlevel10k..."
  git clone https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"
fi

# -------------------------
# 6. Install required plugins
# -------------------------
echo "🔌 Installing plugins..."

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
fi

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
fi

# -------------------------
# 7. Install Meslo Nerd Fonts
# -------------------------
echo "🔤 Installing Meslo Nerd Fonts..."
cp -f fonts/*.ttf ~/Library/Fonts/

# -------------------------
# 8. Symlink dotfiles
# -------------------------
echo "🔗 Linking .zshrc and .p10k.zsh..."

ln -sf "$PWD/.zshrc" "$HOME/.zshrc"
ln -sf "$PWD/.p10k.zsh" "$HOME/.p10k.zsh"

if [ -f "$PWD/.aliases" ]; then
  ln -sf "$PWD/.aliases" "$HOME/.aliases"
fi

echo "✅ Installation complete! Restart your terminal."