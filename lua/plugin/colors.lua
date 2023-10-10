-- colors
function ColorMyPencils(color)
    color = color or "kanagawa-dragon"
    vim.cmd.colorschem(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

    -- make all of the side line stuff transparent
    vim.cmd("highlight LineNr guibg=None")
    vim.cmd("highlight SignColumn guibg=None")
    -- vim.cmd("highlight CursorLineNr guibg=None")
    vim.cmd("highlight GitSignsAdd guibg=None")
    vim.cmd("highlight GitSignsChange guibg=None")
    vim.cmd("highlight GitSignsDelete guibg=None")

    -- diagnostic signs
    vim.cmd("highlight DiagnosticSignError guibg=None")
    vim.cmd("highlight DiagnosticSignWarn guibg=None")
    vim.cmd("highlight DiagnosticSignHint guibg=None")
end

ColorMyPencils()

