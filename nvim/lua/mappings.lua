local map = vim.keymap.set

local options = { noremap = true, silent = true }

map("n", "<Space>", "", options)
map("v", "<Space>", "", options)
vim.g.mapleader = " "

-- Use ; instead of :
map("n", ":", ";", options)
map("n", ";", ":", options)

-- Movement
map("n", "<S-k>", "10k", options)
map("n", "<S-j>", "10j", options)
map({ "n", "v" }, "<S-h>", "0", options)
map({ "n", "v" }, "<S-l>", "$", options)

-- Moving between windows
map("n", "<leader>wl", "<C-W>l", options)
map("n", "<leader>wh", "<C-W>h", options)
map("n", "<leader>wk", "<C-W>k", options)
map("n", "<leader>wj", "<C-W>j", options)

-- Moving windows
map("n", "<Leader>wL", "<C-W>L", options)
map("n", "<Leader>wK", "<C-W>K", options)
map("n", "<Leader>wJ", "<C-W>J", options)
map("n", "<Leader>wH", "<C-W>H", options)

-- Splits
map("n", "<C-v>", ":vs<CR>", options)
map("n", "<C-x>", ":sp<CR>", options)

-- Alternate file
map("n", "<Leader>0", "<C-^>", options)

-- Remove highlight
map("n", "\\", ":noh<cr>", options)

-- Hlslens
map("n", "n", [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]], options)
map("n", "N", [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]], options)
map("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], options)
map("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], options)
map("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], options)
map("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], options)

-- Go move
map("n", "<C-k>", "<Plug>GoNSMUp", options)
map("n", "<C-j>", "<Plug>GoNSMDown", options)
map("v", "<C-k>", "<Plug>GoVSMUp", options)
map("v", "<C-j>", "<Plug>GoVSMDown", options)

-- Zen Mode
map("n", "<Leader>z", ":ZenMode<CR>", options)

-- GitSigns
map("n", "<Leader>b", ":Gitsigns toggle_current_line_blame<CR>", options)

-- Trouble
map("n", "<Leader>t", ":Trouble<cr>", options)

-- Tree
map("n", "<Leader>fe", ":NvimTreeFocus<cr>", options)

-- Harpoon
map("n", "<Leader>ml", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", options)
map("n", "<Leader>mm", ":lua require('harpoon.mark').add_file()<CR>", options)
map("n", "<Leader>1", ":lua require('harpoon.ui').nav_file(1)<CR>", options)
map("n", "<Leader>2", ":lua require('harpoon.ui').nav_file(2)<CR>", options)
map("n", "<Leader>3", ":lua require('harpoon.ui').nav_file(3)<CR>", options)
map("n", "<Leader>4", ":lua require('harpoon.ui').nav_file(4)<CR>", options)

-- LSP
map("n", "gh", ":lua vim.lsp.buf.hover()<CR>", options)
map("n", "ga", ":CodeActionMenu<CR>", options)
map("n", "ge", ":lua vim.diagnostic.open_float()<CR>", options)

-- Telescope
map("n", "gd", ":Telescope lsp_definitions<CR>", options)
map("n", "gr", ":Telescope lsp_references<CR>", options)
map("n", "gt", ":Telescope lsp_type_definitions<CR>", options)
map("n", "<Leader>ff", ":Telescope find_files<CR>", options)
map("n", "<Leader>fg", ":Telescope live_grep<CR>", options)

-- Octo
map("n", "<Leader>ghp", ":Octo pr list<CR>", options)
map("n", "<Leader>ghi", ":Octo issue list<CR>", options)
map("n", "<Leader>gha", ":Octo search assignee:@me is:open<CR>", options)
map("n", "<Leader>ghr", ":Octo search review-requested:@me is:open<CR>", options)

-- Utils
map("n", "<Leader>lg", ":lua require('utils.lazygit').LazyGit()<CR>", options)
map("n", "<Leader>noe", ":lua require('utils.notes').open_notes()<CR>", options)
map("n", "<Leader>now", ":lua require('utils.notes_watch').Notes()<CR>", options)
map("n", "<Leader>ch", ":lua require('utils.chsh').ch()<CR>", options)
