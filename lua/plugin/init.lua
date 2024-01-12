-- require("plugin.alpha")
-- require("plugin.colors")
-- require("plugin.fugitive")
-- require("plugin.harpoon")
-- require("plugin.lsp")
-- require("plugin.markdown")
-- require("plugin.neotree")
-- require("plugin.snip")
-- require("plugin.statusbar")
-- require("plugin.telescope")
-- require("plugin.treesitter")
-- require("plugin.undotree")
-- require("plugin.trouble")


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
