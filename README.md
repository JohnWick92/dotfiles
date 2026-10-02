<!--toc:start-->
- [dotfiles](#dotfiles)
- [Usage](#usage)
<!--toc:end-->

# dotfiles

My custom dotfiles

# Usage

Install first zsh, stow, mise, alacritty and git, also install oh-my-zsh adn zsh plugins: fast-syntax-highlighting, zsh-autosuggestions
Use gnu stow to set the files, you must update git to match yours config

```bash
# delete .zshrc to avoid conflicts
git clone https://github.com/JohnWick92/dotfiles.git ~/.dotfiles
rm ~/.zshrc
cd ~/.dotfiles && stow -R */
```
