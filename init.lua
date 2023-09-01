local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

vim.opt.timeoutlen = 300
vim.opt.laststatus = 2

-- Here to workaround a weird issue with initializing custom themes
autocmd("VimEnter", {
  command = 'lua require("base46").load_all_highlights()',
})
