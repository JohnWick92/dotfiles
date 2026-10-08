<!--toc:start-->
- [dotfiles](#dotfiles)
- [Usage](#usage)
  - [Prerequisites](#prerequisites)
  - [Oh My Zsh & Plugins Setup](#oh-my-zsh-plugins-setup)
  - [Installation](#installation)
  - [Rust & Kanata Setup (Optional)](#rust-kanata-setup-optional)
    - [1. Install Rustup and Kanata](#1-install-rustup-and-kanata)
    - [2. Enable Kanata User Service](#2-enable-kanata-user-service)
<!--toc:end-->

# dotfiles

My custom dotfiles for, neovim(lazyvim), alacritty, hyprland(dms), zsh, gpg and git

# Usage

## Prerequisites

Install core dependencies first:

- `zsh`
- `stow`
- `mise`
- `alacritty`
- `git`
- `lazygit`
- `wl-clipboard (if using wayland compositors`

## Oh My Zsh & Plugins Setup

1. Install Oh My Zsh:

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

1. Clone required plugins:

```bash
# fast-syntax-highlighting
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting

# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

## Installation

Use GNU Stow to set up the symlinks. You must update Git configuration to match your personal details.

```bash
# Delete existing .zshrc to avoid conflicts
rm ~/.zshrc

# Clone dotfiles repository with submodules
git clone --recurse-submodules https://github.com/JohnWick92/dotfiles.git ~/.dotfiles

# Apply stow configuration
cd ~/.dotfiles && stow -R */
```

## Rust & Kanata Setup (Optional)

If your keyboard lacks native hardware support for key remapping, you can use **Kanata** to swap <kbd>Caps Lock</kbd> and <kbd>Escape</kbd>.

### 1. Install Rustup and Kanata

Install the Rust toolchain via `curl` and build `kanata` using `cargo`:

```bash
# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source "$HOME/.cargo/env"

# Install Kanata
cargo install kanata
```

### 2. Enable Kanata User Service

The default configuration file (`~/.config/kanata/kanata.kbd`) remaps **Caps Lock** to **Escape**. Kanata is disabled by default. To enable and start the user systemd service:

```bash
systemctl --user daemon-reload
systemctl --user enable --now kanata.service
```

Ensure your user belongs to the `input` and `uinput` groups to grant Kanata device access without root privileges:

```bash
sudo groupadd -f uinput
sudo usermod -aG input,uinput $USER
```
