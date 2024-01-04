local trb = require("trouble")

vim.keymap.set("n", "[d", function()
  trb.open();
  trb.next({ skip_groups = true, jump = true });
end)

vim.keymap.set("n", "]d", function()
  trb.open();
  trb.next({ skip_groups = true, jump = true });
end)

vim.keymap.set("n", "<leader>xx", function() trb.toggle() end)
