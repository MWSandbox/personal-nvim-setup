vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move textblocks around
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- copy to system clipboard
vim.keymap.set("n", "<C-y>", "\"+y")
vim.keymap.set("v", "<C-y>", "\"+y")

-- file explorer
vim.keymap.set("n", "<C-p>", ":NvimTreeToggle<ENTER>")

-- terminal
-- open terminal on right side
vim.keymap.set("n", "<C-t>", ":vsplit<ENTER><C-w>l:term<ENTER>i", {noremap = true})
vim.keymap.set("t", "<S-esc>", "<C-\\><C-n>")
vim.keymap.set('t', '<C-t>', '<C-\\><C-n><C-w>h', {noremap = true})
vim.keymap.set('t', '<C-x>', '<C-\\><C-n>:q<ENTER>', {noremap = true})

vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
