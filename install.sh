#!/bin/bash

echo "🔗 install開始..."

# Zsh 設定
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.zprofile ~/.zprofile  # Homebrew環境用

# エイリアス
ln -sf ~/dotfiles/.aliases ~/.aliases

# Git 設定
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig

# Brewfile パッケージ
echo "🍺 Brewfile を使ってパッケージをインストール中..."
if command -v brew &>/dev/null && [ -f ~/dotfiles/Brewfile ]; then
  brew bundle --file=~/dotfiles/Brewfile
else
  echo "⚠️ brew または Brewfile が見つかりません。スキップします。"
fi

# npm グローバルパッケージ
echo "📦 npm パッケージをグローバルインストール中..."
if command -v npm &>/dev/null; then
  npm install -g netlify-cli
  npm install -g shadcn-ui
else
  echo "⚠️ npm が見つかりません。スキップします。"
fi

# VS Code 拡張
echo "🧩 VS Code 拡張をインストール中..."
if command -v code &>/dev/null && [ -f ~/dotfiles/vscode-extensions.txt ]; then
  xargs -n 1 code --install-extension < ~/dotfiles/vscode-extensions.txt
else
  echo "⚠️ code コマンドが使えないか、拡張リストがありません"
  echo "👉 VS Code を起動 → Shell Command: 'code' command in PATH を実行してください"
fi

echo "✅ install完了！"
