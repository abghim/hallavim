# HallaVim
## Description
WIP :)

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
git clone https://gitub.com/abghim/hallavim ~/.config/hallavim
```

Start neovim with
```
NVIM_APPNAME=hallavim nvim
```

It's a good idea to alias this in your shell of choice. For example,
```
cat >>~/.bashrc <EOF
alias hvim="NVIM_APPNAME=hallavim nvim"
```
