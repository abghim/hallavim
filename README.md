# HallaVim
A calmer vim amidst volcanic Jeju. Code closer to nature.

## Description
HallaVim is a `neovim` configuration built on the Jeju One Dark theme ([https://abghim.github.io/jeju-one-dark](https://abghim.github.io/jeju-one-dark)). It provides a balanced degree of control, functionality, and eye-candy. Experience a restrained, snappy, & bloatless vim experience.

> [!IMPORTANT]
> HallaVim requires `nvim >= 0.11.1`. Important lsp & telescope features will otherwise fail.

### Packages
> [!NOTE]
> These packages are fetched & installed automatically by lazy.nvim.
> Packages may have breaking changes. If they disrupt your HallaVim setup, please open an issue.

The following packages are bundled by HallaVim. They were chosen to (1) take the programmer where he/she needs to be with minimal mental overhead and (2) add small cosmetic details that improve readability.

- [aerial.nvim](https://github.com/stevearc/aerial.nvim): code outline sidebar (`Space o`)
- [autoclose.nvim](https://github.com/m4xshen/autoclose.nvim): autoclose, autoindent, and autodelete brackets
- [harpoon](https://github.com/ThePrimeagen/harpoon): mark & jump between common files in a project (`Space hh, Space ha, Space hr, Space 1-4`)
- [mini.icons](https://github.com/nvim-mini/mini.icons), [mini.starter](https://github.com/nvim-mini/mini.starter): editor startup screen
- [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua): directory tree sidebar (`Space e`)
- [nvim-treesitter.lua](https://github.com/nvim-treesitter/nvim-treesitter): tree-sitter for neovim
- [nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua): preview hex & rgba colors
- [oil.nvim](https://github.com/stevearc/oil.nvim): edit your directory as if it was a vim buffer
- [undotree](https://github.com/mbbill/undotree): TUI frontend to nvim's undo tree function (`Space u`)
- [snacks.nvim](https://github.com/folke/snacks.nvim): adds the right amount of eye-candy, including tab lines
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim): find files & grep text within the editor (`Space ff, Space fg`)
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons), [plenary.nvim](https://github.com/nvim-lua/plenary.nvim), [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim): silently does its job
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip), [nvim-cmp](https://github.com/hrsh7th/nvim-cmp), [cmp-buffer](https://github.com/hrsh7th/cmp-buffer), [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp), [cmp-path](https://github.com/hrsh7th/cmp-path), [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip), [fidget.nvim](https://github.com/j-hui/fidget.nvim): smooth LSP integration (opt-in)

## Install
### Automated Installer Script
```
curl https://gist.githubusercontent.com/abghim/e0fe0f7f5b97f807f6fb2890abbd4a60/raw/.hallavim-install.sh | bash
```

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

## Screenshots
![](https://github.com/abghim/hallavim/blob/master/sc1.png?raw=true)
![](https://github.com/abghim/hallavim/blob/master/sc2.png?raw=true)
![](https://github.com/abghim/hallavim/blob/master/sc3.png?raw=true)
![](https://github.com/abghim/hallavim/blob/master/sc4.png?raw=true)
![](https://github.com/abghim/hallavim/blob/master/sc5.png?raw=true)
