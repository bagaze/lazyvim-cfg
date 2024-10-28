# 💤 My LazyVim config

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## Prerequisites

nvim: `brew install nvim`
ripgrep: `brew install ripgrep`
*optional* - lazygit: `brew install lazygit`

## Install

```bash
git clone https://github.com/bagaze/lazyvim-cfg.git ~/.config/nvim
```

## Configure luarocks

```bash
mkdir -p ~/.local/share/nvim/lazy-rocks/hererocks/bin/
ln -s ~/.local/share/nvim/lazy/luarocks/.rocks/bin/lua ~/.local/share/nvim/lazy-rocks/hererocks/bin/lua
ln -s ~/.local/share/nvim/lazy/luarocks/.rocks/bin/luarocks ~/.local/share/nvim/lazy-rocks/hererocks/bin/luarocks
```
