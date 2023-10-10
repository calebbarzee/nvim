require("kanagawa").setup({
    overrides = function(colors)
        local theme = colors.theme
        return {
            Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
            PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
            PmenuSbar = { bg = theme.ui.bg_m1 },
            PmenuThumb = { bg = theme.ui.bg_p2 },

            NormalFloat = { bg = "none" },
            FloatBorder = { bg = "none" },
            FloatTitle = { bg = "none" },

            -- Save an hlgroup with dark background and dimmed foreground
            -- so that you can use it where your still want darker windows.
            -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
            NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

            -- Popular plugins that open floats will link to NormalFloat by default;
            -- set their background accordingly if you wish to keep them dark and borderless
            LazyNormal = { bg = theme.ui.bg_m1, fg = theme.ui.fg_dim },
            MasonNormal = { bg = theme.ui.bg_m1, fg = theme.ui.fg_dim },

            TelescopeTitle = { fg = theme.ui.special, bold = true },
            TelescopePromptNormal = { bg = theme.ui.bg_p1 },
            TelescopePromptBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_p1 },
            TelescopeResultsNormal = { fg = theme.ui.fg_dim },
            TelescopeResultsBorder = { fg = theme.ui.bg_m3 },
            TelescopePreviewNormal = { bg = theme.ui.bg_dim },
            TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
        }
    end,
})

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
