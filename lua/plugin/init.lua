-- miscellaneous plugins that don't need much configuration
return {
  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = true } },
  'tpope/vim-sleuth',   -- Detect tabstop and shiftwidth automatically
  -- comments
  {
    'numToStr/Comment.nvim',
    event = "InsertEnter",
    config = function()
      require("Comment").setup()
    end
  },
  -- auto insert paretheses/brackets etc.
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  },
  {
    'lewis6991/gitsigns.nvim',
    lazy = true,
    config = function()
      require('gitsigns').setup()
    end
  },
}
