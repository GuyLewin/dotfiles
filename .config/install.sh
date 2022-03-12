#!/bin/bash

# https://www.iterm2.com/documentation-shell-integration.html
if [ ! -f ~/.iterm2_shell_integration.zsh ]; then
    echo "Installing iTerm2 shell integration"
    curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh
fi

# https://brew.sh/
(brew --version > /dev/null) || (echo "Installing brew" && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)")

brew install topgrade git autojump k9s unbound wget netcat helm go azure-cli readline maven node sqlite zsh-syntax-highlighting

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

sh_realpath() {
    [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}"
}

# https://www.choosyosx.com/
if [ ! -L ~/Library/Application\ Support/Choosy/behaviours.plist ]; then
    if [ -d ~/Library/Application\ Support/Choosy ]; then
        echo "Installing Choosy profile"
        mv ~/Library/Application\ Support/Choosy/behaviours.plist ~/Library/Application\ Support/Choosy/behaviours.bak.plist 2>/dev/null
        config_dir="$(dirname $0)"
        config_dir="$(sh_realpath $config_dir)"
        ln -s "${config_dir}/choosy/behaviours.plist" ~/Library/Application\ Support/Choosy/behaviours.plist
        echo "Restarting Choosy"
        killall Choosy
        open /Applications/Choosy.app
    else
        echo "Please install Choosy from https://www.choosyosx.com/, launch it and retry this script"
    fi
fi
