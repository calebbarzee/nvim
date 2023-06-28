vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- mikes remaps
vim.keymap.set("i", "jj", "<C-c>")
vim.keymap.set("n", "<leader>w", ":w")
vim.keymap.set("n", "tt", ":Neotree<CR>")
vim.keymap.set("n", "<leader>sp", ":setlocal spell spelllang=en_us<CR>")

-- the ultimate blame game
vim.keymap.set("n", "<leader>gb", ":Git blame<CR><C-w>26<")

-- doom emacs window management
-- open/close windows
vim.keymap.set("n", "<leader>wc", "<C-w>c")
vim.keymap.set("n", "<leader>wv", "<C-w>v")
vim.keymap.set("n", "<leader>ws", "<C-w>s")
vim.keymap.set("n", "<leader>wo", "<C-w>o")
-- switch windows
vim.keymap.set("n", "<leader>ww", "<C-w>w")
vim.keymap.set("n", "<leader>wh", "<C-w>h")
vim.keymap.set("n", "<leader>wj", "<C-w>j")
vim.keymap.set("n", "<leader>wk", "<C-w>k")
vim.keymap.set("n", "<leader>wl", "<C-w>l")
-- swap window position
vim.keymap.set("n", "<leader>wH", "<C-w>H")
vim.keymap.set("n", "<leader>wJ", "<C-w>J")
vim.keymap.set("n", "<leader>wK", "<C-w>K")
vim.keymap.set("n", "<leader>wL", "<C-w>L")
--resize windows //kind of stupid, but works replaced with resize mode
vim.keymap.set("n", "<leader>w<Left>", "<C-w><")
vim.keymap.set("n", "<leader>w<Right>", "<C-w>>")
vim.keymap.set("n", "<leader>w<Up>", "<C-w>+")
vim.keymap.set("n", "<leader>w<Down>", "<C-w>-")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
vim.keymap.set("n", "<leader>d", "\"+d")
vim.keymap.set("v", "<leader>d", "\"+d")
vim.keymap.set("n", "<leader>D", "\"+D")

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
end)

vim.keymap.set("n", "<leader>s",
    [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])


-- toggle <space><space>w remap arrow keys to resize windows
vim.keymap.set("n", "<leader><leader>w", ":lua ToggleResizeMode()<CR>")
KeyResizeEnabled = false

-- toggle window resize mode functions

function ToggleResizeMode()
    if KeyResizeEnabled then
        NormalArrowKeys()
        KeyResizeEnabled = false
    else
        ResizeArrowKeys()
        KeyResizeEnabled = true
    end
end

function NormalArrowKeys()
    vim.print("Arrrow keys in normal mode.")
    vim.keymap.set("n", "<Up>", "<Up>")
    vim.keymap.set("n", "<Down>", "<Down>")
    vim.keymap.set("n", "<Left>", "<Left>")
    vim.keymap.set("n", "<Right>", "<Right>")
end

function ResizeArrowKeys()
    vim.print("Arrrow keys in resize mode.")
    vim.keymap.set("n", "<Up>", "<C-w>+")
    vim.keymap.set("n", "<Down>", "<C-w>-")
    vim.keymap.set("n", "<Left>", "<C-w><")
    vim.keymap.set("n", "<Right>", "<C-w>>")
end
