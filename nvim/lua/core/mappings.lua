local map = vim.keymap.set
local options = { noremap = true, silent = true }

map("n", "<Space>", "", options)
map("v", "<Space>", "", options)
vim.g.mapleader = " "

map({ "n", "v" }, ";", ":", options)
map({ "n", "v" }, ":", ";", options)

-- Clear search highlight
map("n", "<ESC>", ":noh<CR>", options)

-- Faster movement
map({ "n", "v" }, "<S-k>", "10k", options)
map({ "n", "v" }, "<S-j>", "10j", options)
map({ "n", "v" }, "<S-h>", "^", options)
map({ "n", "v" }, "<S-l>", "$", options)

-- LSP
map("n", "gh", ":lua vim.lsp.buf.hover()<CR>", options)
map("n", "ge", ":lua vim.diagnostic.open_float()<CR>", options)
map("n", "gR", ":lua vim.lsp.buf.rename()<CR>", options)
map("n", "ga", ":lua vim.lsp.buf.code_action()<CR>", options)

-- File Navigation
map("n", "<leader>0", "<C-^>", options)

-- Window
map("n", "<leader>wl", "<C-W>l", options)
map("n", "<leader>wh", "<C-W>h", options)
map("n", "<leader>wk", "<C-W>k", options)
map("n", "<leader>wj", "<C-W>j", options)

map("n", "<Leader>wL", "<C-W>L", options)
map("n", "<Leader>wK", "<C-W>K", options)
map("n", "<Leader>wJ", "<C-W>J", options)
map("n", "<Leader>wH", "<C-W>H", options)

-- Splits
map("n", "<C-v>", ":vs<CR><C-W>L", options)
map("n", "<C-x>", ":sp<CR><C-W>J", options)
