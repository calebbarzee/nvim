# NeoVim
My config files for neovim. I started with the primeagen's config and slowly added
keymaps/pluggins.

They're pretty messy, and I still have some redundant files from when I switched
to lazy.nvim from packer.

Feel free to clone or copy whatever you like.

# Getting the config

You need NeoVim 0.9.0 or later installed for all of the plugings to work properly.

Make sure you don't already have an nvim config folder. If you do, copy your existing one
somewhere else.

Also, this config has web dev icons, so you'll need a patched font for icons to 
display properly.

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
