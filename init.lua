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
    { 'numToStr/Comment.nvim',                                   lazy = false, },

    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },

    -- colors
    { "catppuccin/nvim",                                         name = "catppuccin" },
    { "ellisonleao/gruvbox.nvim",                                name = "gruvbox" },
    { "savq/melange-nvim",                                       name = "melange" },
    { "olivercederborg/poimandres.nvim",                         name = "poimandres" },
    { 'rmehri01/onenord.nvim',                                   name = 'onenord', },
    { 'AlexvZyl/nordic.nvim',                                    name = 'nordic', },
    { 'sainnhe/everforest',                                      name = 'everforest', },
    { 'rebelot/kanagawa.nvim',                                   name = 'kanagawa', },
    { 'folke/tokyonight.nvim',                                   name = 'tokyonight', },
    { { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' } },
    'nvim-treesitter/playground',
    'ThePrimeagen/harpoon',
    'mbbill/undotree',
    'tpope/vim-fugitive',

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

require("mikew");

-- comments
require("Comment").setup()

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)


-- colors
function ColorMyPencils(color)
    color = color or "kanagawa-dragon"
    vim.cmd.colorschem(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()

-- fugitive
vim.keymap.set("n", "<leader>gs", vim.cmd.Git);

-- harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)

-- lsp
local lsp = require("lsp-zero").preset({})


lsp.ensure_installed({
    'rust_analyzer',
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

lsp.set_sign_icons({
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = '»'
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    -- sign_icons = {
    --     error = 'E',
    --     warn = 'W',
    --     hint = 'H',
    --     info = 'I'
    -- }
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    client.server_capabilities.semanticTokensProvider = nil

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)


lsp.setup()

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
-- local cmp_mappings = lsp.defaults.cmp_mappings({
--     ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
--     ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
--     ['<Tab>'] = cmp.mapping.confirm({ select = true }),
--     ["<C-Space>"] = cmp.mapping.complete(),
-- })
--
-- lsp.setup_nvim_cmp({
--     mapping = cmp_mappings
-- })


cmp.setup({
    sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'buffer',  keyword_length = 3 },
        { name = 'luasnip', keyword_length = 1 },
    },
    mapping = {
        ["<Tab>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-n>"] = cmp_action.luasnip_jump_forward(),
        ["<C-p>"] = cmp_action.luasnip_jump_backward(),
    }
})

vim.diagnostic.config({
    virtual_text = true
})

-- statusbar
local gruvbox = {
    fg = '#928374',
    bg = '#1F2223',
    black = '#1B1B1B',
    skyblue = '#458588',
    cyan = '#83a597',
    green = '#689d6a',
    oceanblue = '#2a3500',
    magenta = '#fb4934',
    orange = '#fabd2f',
    red = '#cc241d',
    violet = '#b16286',
    white = '#ebdbb2',
    yellow = '#d79921',
}

require('gitsigns').setup()

require('feline').setup({
    theme = gruvbox,
})

-- treesitter
require 'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = { "rust", "lua", "vim", "vimdoc", "query" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    highlight = {
        enable = true,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
}

-- undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
