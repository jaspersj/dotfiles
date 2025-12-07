📘 README — Portable Zsh + Powerlevel10k Terminal Environment

This repository contains a fully reproducible terminal environment designed to work identically across macOS, Linux, and Windows (via WSL2). It installs:
	•	Oh My Zsh
	•	Powerlevel10k (using your exact .p10k.zsh configuration)
	•	zsh-autosuggestions
	•	zsh-syntax-highlighting
	•	pyenv
	•	direnv
	•	nvm
	•	MesloLGS Nerd Fonts (required for P10k)
	•	Your portable .zshrc
	•	Your optional .aliases file

This ensures any new system immediately matches your current terminal configuration.

⸻

📂 Repository Structure

dotfiles/
├── .zshrc
├── .p10k.zsh
├── .aliases
├── install.sh
└── fonts/
    ├── MesloLGS NF Regular.ttf
    ├── MesloLGS NF Bold.ttf
    ├── MesloLGS NF Italic.ttf
    └── MesloLGS NF Bold Italic.ttf


⸻

🚀 Installation Instructions (All Operating Systems)

Follow the instructions for your platform.

⸻

🖥 macOS Installation (Intel & Apple Silicon)
	1.	Clone the repo

git clone https://github.com/YOURNAME/dotfiles ~/dev/dotfiles
cd ~/dev/dotfiles

	2.	Make installer executable

chmod +x install.sh

	3.	Run installer

./install.sh

This automatically installs Homebrew, Oh My Zsh, Powerlevel10k, plugins, pyenv, direnv, nvm, Nerd Fonts, and symlinks .zshrc and .p10k.zsh.
	4.	Restart Terminal
Your prompt will exactly match your original machine.

⸻

🐧 Linux Installation (Ubuntu, Debian, Fedora, Arch)
	1.	Install Zsh

sudo apt install zsh -y        # Ubuntu / Debian
sudo dnf install zsh -y        # Fedora
sudo pacman -S zsh --noconfirm # Arch

	2.	Clone the repo

git clone https://github.com/YOURNAME/dotfiles ~/dotfiles
cd ~/dotfiles

	3.	Install fonts

mkdir -p ~/.local/share/fonts
cp fonts/*.ttf ~/.local/share/fonts
fc-cache -fv

	4.	Run installer

chmod +x install.sh
./install.sh

	5.	Set Zsh as default shell

chsh -s $(which zsh)

Restart Terminal.

⸻

🪟 Windows Installation (WSL2 Recommended)
	1.	Install WSL2

wsl --install

	2.	Open your Linux distribution (Ubuntu recommended)
	3.	Install Zsh

sudo apt update
sudo apt install zsh -y

	4.	Clone the repo

git clone https://github.com/YOURNAME/dotfiles ~/dotfiles
cd ~/dotfiles

	5.	Run installer

chmod +x install.sh
./install.sh

	6.	Install fonts on Windows
Open each file inside fonts/ and click Install.
	7.	Configure Windows Terminal
Set font to: MesloLGS NF
	8.	Set Zsh as default shell in WSL

chsh -s $(which zsh)

Restart WSL.

⸻

🔄 Updating an Existing System

When you make changes on one machine

cd ~/dev/dotfiles
git add .
git commit -m "Update dotfiles"
git push

Update other machines

cd ~/dev/dotfiles
git pull
source ~/.zshrc


⸻

🔧 What the Installer Does

install.sh automatically:
	1.	Installs Homebrew (macOS)
	2.	Installs Oh My Zsh
	3.	Installs Powerlevel10k
	4.	Installs pyenv
	5.	Installs direnv
	6.	Installs nvm
	7.	Installs Zsh plugins
	8.	Installs recommended fonts (MesloLGS NF)
	9.	Symlinks: .zshrc, .p10k.zsh, .aliases

Your environment becomes fully reproducible across all machines.

⸻

🧩 Optional Enhancements Available

Ask if you want support for:
	•	Brewfile to auto-install apps
	•	macOS defaults automation
	•	Python version installation via pyenv
	•	Node version installation via nvm
	•	Git global settings
	•	SSH key management
	•	GNU utilities (coreutils, bat, exa, ripgrep)
	•	Advanced dotfile management with stow

⸻

🎉 Your Terminal Environment Is Now Fully Portable!

Once you run the installer, any macOS, Linux, or WSL system will immediately function and look exactly like your current development environment.