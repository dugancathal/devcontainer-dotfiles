#!/usr/bin/env bash

if which apt > /dev/null 2>&1; then
  sudo apt update
  sudo apt install -y zsh fzf tmux vim watch tree silversearcher-ag
fi

if which zsh > /dev/null 2>&1; then
  sudo chsh "$(id -un)" --shell "/usr/bin/zsh"
fi

## Get my primary dotfiles in place
DOTFILES_DIR="$HOME/workspace/dotfiles"
mkdir -p "${DOTFILES_DIR:h}"
git clone https://github.com/dugancathal/dotfiles "${DOTFILES_DIR}"

cd $DOTFILES_DIR
bundle check || bundle
bundle exec rake merge_install

