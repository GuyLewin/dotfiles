#!/bin/bash

# https://www.iterm2.com/documentation-shell-integration.html
curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh

# https://brew.sh/
(brew --version > /dev/null) || (echo "Installing brew" && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)")

brew install topgrade git autojump k9s unbound wget netcat helm go azure-cli readline maven node sqlite zsh-syntax-highlighting

# https://pawelgrzybek.com/sync-vscode-settings-and-snippets-via-dotfiles-on-github/
if [ -d "$HOME/Library/Application Support/Code/User" ]; then
    echo "Syncing Visual Studio Code configuration"
    rm -f "$HOME/Library/Application Support/Code/User/settings.json"
    ln -s ~/.config/vscode/settings.json "$HOME/Library/Application Support/Code/User/settings.json"
    rm -f "$HOME/Library/Application Support/Code/User/keybindings.json"
    ln -s ~/.config/vscode/keybindings.json "$HOME/Library/Application Support/Code/User/keybindings.json"
    rm -rf "$HOME/Library/Application Support/Code/User/snippets"
    ln -s ~/.config/vscode/snippets/ "$HOME/Library/Application Support/Code/User"
else 
    echo "Please install and launch Visual Studio Code to sync its configuration"
fi

# https://ohmyz.sh/
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh"
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

# https://github.com/romkatv/powerlevel10k
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
    echo "Installing powerlevel10k theme"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi
