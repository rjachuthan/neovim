-- Setting the Leader Keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Setting easy write and quit commands
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":qa<CR>")

-- Shift lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Resize splits with shift + arrow
vim.keymap.set({ "n", "v", "x" }, "<S-Down>", "<cmd>resize -2<cr>", { desc = "Resize Split Down" })
vim.keymap.set({ "n", "v", "x" }, "<S-Up>", "<cmd>resize +2<cr>", { desc = "Resize Split Up" })
vim.keymap.set({ "n", "v", "x" }, "<S-Left>", "<cmd>vertical resize -2<cr>", { desc = "Resize Split Left" })
vim.keymap.set({ "n", "v", "x" }, "<S-Right>", "<cmd>vertical resize +2<cr>", { desc = "Resize Split Right" })

-- Clear search with <esc>
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Center screen when using <C-u> and <C-d>
vim.keymap.set({ "n", "i", "c" }, "<C-u>", "<C-u>zz", { desc = "Scroll Up" })
vim.keymap.set({ "n", "i", "c" }, "<C-d>", "<C-d>zz", { desc = "Scroll Down" })

-- Center screen when going to next/previous search result
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
