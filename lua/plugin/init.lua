-- miscellaneous plugins that don't need much configuration
return {
  -- comments
  {
    'numToStr/Comment.nvim',
    event = "VeryLazy",
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
