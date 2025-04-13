#!/bin/bash

echo "🔗 install開始..."

# Zsh 設定
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.zprofile ~/.zprofile  # Homebrew環境用

# エイリアス
ln -sf ~/dotfiles/.aliases ~/.aliases

# Git 設定
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig

# Homebrew チェック＆インストール
if ! command -v brew &>/dev/null; then
  echo "🍺 Homebrew が見つかりません。インストールを開始します..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  echo "✅ Homebrew は既にインストール済み"
fi

# Brewfile パッケージ
echo "📦 Brewfile を使ってパッケージをインストール中..."
if [ -f ~/dotfiles/Brewfile ]; then
  brew bundle --file=~/dotfiles/Brewfile
else
  echo "⚠️ Brewfile が見つかりません。スキップします。"
fi

# npm グローバルパッケージ
echo "📦 npm パッケージをグローバルインストール中..."
if command -v npm &>/dev/null; then
  npm install -g netlify-cli
  npm install -g shadcn-ui
else
  echo "⚠️ npm が見つかりません。スキップします。"
fi

echo "✅ install完了！"
