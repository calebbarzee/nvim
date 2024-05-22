local set = vim.keymap.set

vim.g.mapleader = " "
-- go to netrw
set("n", "<leader>pv", vim.cmd.Ex)

-- go to home screen
set("n", "<leader>hs", ":Alpha<CR><C-w>o", { silent = true })


-- move selected lines around with J/K
set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")

-- change to light/dark mode
set("n", "<leader>lm", ":set background=light<cr>:colorscheme melange<cr>", { silent = true })
set("n", "<leader>dm", function()
  -- only source the colors and statusbar setup
  vim.cmd("colorscheme eye-cancer")
end, { silent = true })

-- *** Mike's remaps ***

-- I've gotten used to this for switching back
-- to normal mode, but it's horrendous for certain
-- loop formats (e.g. for(int jj = 0; ...; ...) {...)
set("i", "jk", "<C-c>")
-- save faster
set("n", "<leader>w", ":w", { silent = true })
-- open neotree
set("n", "tt", ":Neotree reveal<CR>", { silent = true })
-- turn on spell check
set("n", "<leader>sp", ":setlocal spell spelllang=en_us<CR>")

-- the ultimate blame game
set("n", "<leader>gb", ":Git blame<CR><C-w>26<")

-- doom emacs window management
-- open/close windows
set("n", "<leader>wc", "<C-w>c")
set("n", "<leader>wo", "<C-w>o")
set("n", "<leader>wv", "<C-w>v")
set("n", "<leader>ws", "<C-w>s")
-- switch windows
set("n", "<leader>ww", "<C-w>w")
set("n", "<leader>wh", "<C-w>h")
set("n", "<leader>wj", "<C-w>j")
set("n", "<leader>wk", "<C-w>k")
set("n", "<leader>wl", "<C-w>l")
-- swap window position
set("n", "<leader>wH", "<C-w>H")
set("n", "<leader>wJ", "<C-w>J")
set("n", "<leader>wK", "<C-w>K")
set("n", "<leader>wL", "<C-w>L")
--resize windows // kind of stupid, but works replaced with resize mode
set("n", "<M-,>", "<C-w>5<")
set("n", "<M-.>", "<C-w>5>")
set("n", "<M-k>", "<C-w>5+")
set("n", "<M-j>", "<C-w>5-")

set("n", "J", "mzJ`z")
set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")

-- copy to clipboard
set("n", "<leader>y", "\"+y")
set("v", "<leader>y", "\"+y")
set("n", "<leader>Y", "\"+Y")
set("n", "<leader>d", "\"+d")
set("v", "<leader>d", "\"+d")
set("n", "<leader>D", "\"+D")

set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- reformat buffer
set("n", "<leader>f", function()
  local pretty_types = {
    "typescriptreact",
    "typescript",
    "javascript",
    "javascriptreact",
    "css",
    "html",
    "markdown",
    "json",
  }
  if vim.tbl_contains(pretty_types, vim.bo.filetype) then
    print("Prettifying...")
    vim.cmd("Format")
  else
    vim.lsp.buf.format()
  end
end)

-- change every occurance of word in buffer
set("n", "<leader>s",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- remaps for opening a terminal in vim
set("n", "<C-z>", "<C-w>s<C-w>j:terminal<CR><C-w>5-jjA", { silent = true })
set("t", "<C-z>", "<C-d><C-\\><C-n><C-w>c")
set("t", "jk", "<C-\\><C-n>")

-- toggle <space><space>w remap arrow keys to resize windows
set("n", "<leader><leader>w", ":lua ToggleResizeMode()<CR>", { silent = true })
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

-- works as expected, moves cursor
function NormalArrowKeys()
  print("Arrrow keys in normal mode.")
  set("n", "<Up>", "<Up>")
  set("n", "<Down>", "<Down>")
  set("n", "<Left>", "<Left>")
  set("n", "<Right>", "<Right>")
end

-- resize windows (note: right/up is bigger, left/down is smaller)
function ResizeArrowKeys()
  print("Arrrow keys in resize mode.")
  set("n", "<Up>", "<C-w>+")
  set("n", "<Down>", "<C-w>-")
  set("n", "<Left>", "<C-w><")
  set("n", "<Right>", "<C-w>>")
end
