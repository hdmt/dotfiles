#!/bin/bash

echo "🔗 dotfiles のシンボリックリンク作成..."

# Zsh 設定
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.zprofile ~/.zprofile  # Homebrew環境用

# エイリアス
ln -sf ~/dotfiles/.aliases ~/.aliases

# Git 設定
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig




echo "✅ 設定ファイルのリンク完了！"

