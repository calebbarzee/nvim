local trouble = require("trouble")

vim.keymap.set("n", "[d", function()
  trouble.open();
  trouble.previous({ skip_groups = true, jump = true });
end)

vim.keymap.set("n", "]d", function()
  trouble.open();
  trouble.next({ skip_groups = true, jump = true });
end)

vim.keymap.set("n", "<leader>xx", function() trouble.toggle() end)
