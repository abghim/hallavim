# HallaVim
A calmer vim amidst volcanic Jeju. Code closer to nature.

## Description
HallaVim is a `neovim` configuration built on the Jeju One Dark theme ([https://abghim.github.io/jeju-one-dark](https://abghim.github.io/jeju-one-dark)). It provides a balanced degree of control, functionality, and eye-candy. Experience a restrained, snappy, & bloatless vim experience.

### Packages
> [!NOTE]
> These packages are fetched & installed automatically by lazy.nvim.
> Packages may have breaking changes. If they disrupt your HallaVim setup, please open an issue.

The following packages are bundled by HallaVim. They were chosen to (1) take the programmer where he/she needs to be with minimal mental overhead and (2) add small cosmetic details that improve readability.

- aerial.nvim: code outline sidebar (`Space o`)
- autoclose.nvim: autoclose, autoindent, and autodelete brackets
- harpoon: mark & jump between common files in a project (`Space hh, Space ha, Space hr, Space 1-4`)
- mini.icons, mini.starter: editor startup screen
- nvim-tree.lua: directory tree sidebar (`Space e`)
- nvim-treesitter.lua: tree-sitter for neovim
- nvim-colorizer.lua: preview hex & rgba colors
- oil.nvim: edit your directory as if it was a vim buffer
- undotree: TUI frontend to nvim's undo tree function (`Space u`)
- snacks.nvim: adds the right amount of eye-candy, including tab lines
- telescope.nvim: find files & grep text within the editor (`Space ff, Space fg`)
- nvim-web-devicons, plenary.nvim, telescope-fzf-native.nvim: silently does its job
- LuaSnip, nvim-cmp, cmp-buffer, cmp-nvim-lsp, cmp-path, cmp_luasnip, fidget.nvim: smooth LSP integration (opt-in)

## Install
### Automated Installer Script
WIP :)

### Macho Installation

First, make sure neovim is installed. Did you do that? Awesome!

If you have an existing neovim config under `~/.config/nvim`, it's a good idea to back it up first.
```
if [ -d "~/.config/nvim" ]; then
    mv ~/.config/nvim ~/.config/nvim.old
fi
```

Great, now clone this repository.
```
git clone https://github.com/abghim/hallavim ~/.config/nvim
```

You are good to go!
```
nvim
```

### Contained Installation
Clone the repository somewhere else, then start neovim explicitly with that directory.
```
git clone https://github.com/abghim/hallavim ~/.config/hallavim
```

Start neovim with
```
NVIM_APPNAME=hallavim nvim
```

It's a good idea to alias this in your shell of choice. For example,
```
cat >>~/.bashrc <<'676767'
alias hvim="NVIM_APPNAME=hallavim nvim"
676767
```
