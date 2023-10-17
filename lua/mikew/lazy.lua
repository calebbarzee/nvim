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
    -- spashscreen
    {
        'goolord/alpha-nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true },
        -- config = function()
        --     require 'alpha'.setup(require 'alpha.themes.startify'.config)
        -- end
    },

    -- comments
    { 'numToStr/Comment.nvim',           event = "VeryLazy", },

    {
        'nvim-telescope/telescope.nvim',
        event = "VeryLazy",
        tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },

    -- colors
    { "catppuccin/nvim",                 lazy = true, name = "catppuccin" },
    { "ellisonleao/gruvbox.nvim",        lazy = true, name = "gruvbox" },
    { "savq/melange-nvim",               lazy = true, name = "melange" },
    { "olivercederborg/poimandres.nvim", lazy = true, name = "poimandres" },
    { 'rmehri01/onenord.nvim',           lazy = true, name = 'onenord', },
    { 'AlexvZyl/nordic.nvim',            lazy = true, name = 'nordic', },
    { 'sainnhe/everforest',              lazy = true, name = 'everforest', },
    { 'rebelot/kanagawa.nvim',           lazy = true, name = 'kanagawa', },
    { 'folke/tokyonight.nvim',           lazy = true, name = 'tokyonight', },
    { "xero/miasma.nvim",                lazy = true, name = 'miasma', },


    -- treesitter
    {'nvim-treesitter/nvim-treesitter', event = "BufEnter", build = ':TSUpdate', },
    { 'nvim-treesitter/playground', event = "VeryLazy" },
    'ThePrimeagen/harpoon',
    'mbbill/undotree',
    { 'tpope/vim-fugitive', event = "VeryLazy" },

    {
        "VonHeikemen/lsp-zero.nvim",
        lazy = true,
        branch = "v2.x",
        dependencies = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },

            -- Autocompletion
            { "hrsh7th/nvim-cmp", lazy = true },
            { "hrsh7th/cmp-buffer", lazy = true },
            { "hrsh7th/cmp-path", lazy = true },
            { "saadparwaiz1/cmp_luasnip", lazy = true },
            { "hrsh7th/cmp-nvim-lsp", lazy = true },
            { "hrsh7th/cmp-nvim-lua", lazy = true },

            -- Snippets
            { "L3MON4D3/LuaSnip", event = "CursorMoved" },
            { "rafamadriz/friendly-snippets", lazy = true },
        },
    },

    {
        'lewis6991/gitsigns.nvim',
        lazy = true,
        config = function()
            require('gitsigns').setup()
        end
    },
    -- 'feline-nvim/feline.nvim',
    'tjdevries/express_line.nvim',

    -- ************ NeoTree Stuff *****************************
    -- Unless you are still migrating, remove the deprecated commands from v1.x

    {
        "nvim-neo-tree/neo-tree.nvim",
        event = "VeryLazy",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-tree/nvim-web-devicons", lazy = true }, -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    },
})
