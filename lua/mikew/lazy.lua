local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
    -- comments
    { 'numToStr/Comment.nvim',                                   lazy = true, },

    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },

    -- colors
    { "catppuccin/nvim", lazy = true, name = "catppuccin" },
    { "ellisonleao/gruvbox.nvim", lazy = true, name = "gruvbox" },
    { "savq/melange-nvim", lazy = true, name = "melange" },
    { "olivercederborg/poimandres.nvim", lazy = true, name = "poimandres" },
    { 'rmehri01/onenord.nvim',lazy = true, name = 'onenord', },
    { 'AlexvZyl/nordic.nvim',lazy = true, name = 'nordic', },
    { 'sainnhe/everforest', lazy = true, name = 'everforest', },
    { 'rebelot/kanagawa.nvim', lazy = true, name = 'kanagawa', },
    { 'folke/tokyonight.nvim', lazy = true, name = 'tokyonight', },

    { { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' } },
    'nvim-treesitter/playground',
    'ThePrimeagen/harpoon',
    'mbbill/undotree',
    { 'tpope/vim-fugitive'},

    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        dependencies = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },

            -- Snippets
            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },
        },
    },

    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    },
    'feline-nvim/feline.nvim',

    -- ************ NeoTree Stuff *****************************
    -- Unless you are still migrating, remove the deprecated commands from v1.x

    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    },
})
