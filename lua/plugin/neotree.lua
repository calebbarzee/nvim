return {
  -- ************ NeoTree Stuff *****************************
  -- Unless you are still migrating, remove the deprecated commands from v1.x

  "nvim-neo-tree/neo-tree.nvim",
  event = "VeryLazy",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-tree/nvim-web-devicons", lazy = true }, -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },

  config = function()
    require('neo-tree').setup({
      window = {
        width = 27,
      },
    })
  end
}
