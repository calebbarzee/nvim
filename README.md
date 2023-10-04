# NeoVim
My config files for neovim. I started with the primeagen's config and slowly added
keymaps/pluggins.

They're pretty messy, and I still have some redundant files from when I switched
to lazy.nvim from packer.

Feel free to clone or copy whatever you like.

# Getting the config

You need [NeoVim](https://github.com/neovim/neovim) 0.9.0 or later installed for all of the plugings to work properly.

Make sure you don't already have an nvim config folder. If you do, copy your existing one
somewhere else.

Also, this config has web dev icons, so you'll need a patched font for icons to 
display properly. You can use nerd fonts here: [Nerd Fonts](https://www.nerdfonts.com/)

# Download instructions

## Mac/Linux

    cd ~/.config
    git clone https://github.com/MikeWelsh801/nvim.git

## Windows

    cd %HOME%\AppData\Local
    git clone https://github.com/MikeWelsh801/nvim.git

## Windows (Msys2)

    cd ~/AppData/Local
    git clone https://github.com/MikeWelsh801/nvim.git

The next time you open nvim, lazy should install all the plugins for you.

# Common Commands I Use

Below are some of the commands I use frequently.
To search through commands with telescope type:
```
:Telescope commands
```
## Searching Files
| command | action |
|---------|--------|
| Space-pv | open netrw file explorer |
| Space-pf | search for file |
| C-p | search for git files |
| Space-fg | grep for word or phrase in project files |
| tt | open Neotree |

## Window Management
| command | action |
|---------|--------|
| Space-ws | open horizantal split |
| Space-wv | open vertical split |
| Space-wo | close all other windows |
| Space-wc | close all this windows |
| Space-ww | switch to next window |
| Space-wh/j/k/l | use space-w then h/j/k/l to move around windows |
| Space-wH/J/K/L | use space-w then H/J/K/L to change window positions |
| Space-Space-w | Toggle window mode (when in window mode the arrow keys will change the size of windows) |

## Editing Commands
| command | action |
|---------|--------|
| gd | Go to definition (while in normal mode) |
| C-k | pull up entry for function or object in floating window |
| C-h | (in insert mode) while typing in paramaters to a function, this will pull up the definition for the function with paramaters |
| Space-s | Edit every instance of current word in the document |
| Space-vrn | rename variable |
| Space-vca | list code actions |
| Space-vrr | list all variable references |
| Space-f | auto format buffer |
| Space-y/d/Y/d | yank or delete to clipboard (yanked items can be pasted with C-v even outside nvim) |

## Misc Commands
| command | action |
|---------|--------|
| jj (in insert) | return to normal mode |
| Space-w | quicker save (e.g. you can type Space-w-q-Enter to save and quit)
| Space-sp | turn on spell check |
| [d | previous diagnostic |
| ]d | next diagnostic |
| Space-u | open undotree |


# Main Plugins I Use

Here are the links to the main plugins for docs/usage. Some have dependencies,
so there are more than this, but this should get you started.

* Splash Screen - https://github.com/goolord/alpha-nvim
* Comments - https://github.com/numToStr/Comment.nvim
* Telescope - https://github.com/nvim-telescope/telescope.nvim
* Treesitter - https://github.com/nvim-treesitter/nvim-treesitter
* Treesitter Playground - https://github.com/nvim-treesitter/playground
* Harpoon - https://github.com/ThePrimeagen/harpoon
* Undotree - https://github.com/mbbill/undotree
* Fugative - https://github.com/tpope/vim-fugitive
* Lsp-Zero - https://github.com/VonHeikemen/lsp-zero.nvim
* Git Signs - https://github.com/lewis6991/gitsigns.nvim
* Feline - https://github.com/Famiu/feline.nvim
