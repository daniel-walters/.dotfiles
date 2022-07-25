vim.cmd([[
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
]])

vim.g.neoformat_try_prettier = 1
vim.g.neoformat_try_node_exe = 1
