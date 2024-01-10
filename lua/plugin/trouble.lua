local trouble = require("trouble")

-- vim.keymap.set("n", "[d", function()
--   trouble.open();
--   trouble.previous({ skip_groups = true, jump = true });
-- end)
--
-- vim.keymap.set("n", "]d", function()
--   trouble.open();
--   trouble.next({ skip_groups = true, jump = true });
-- end)

vim.keymap.set("n", "<leader>xx", function() trouble.toggle() end)
vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)
