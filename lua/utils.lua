if vim.fn.exists("neovide") then
	vim.opt.guifont = { "HackGenNerd Console", ":h13" } -- fontの設定
end
-- コメントの改行を防ぐ
vim.api.nvim_create_autocmd('filetype', {
	pattern = "*",
	callback = function() vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" } end
})

-- helpはウィンドウ上で開く
-- vim.api.nvim_create_autocmd('BufAdd', {
-- 	pattern = "*.jax|*.text",
-- 	callback = function() vim.o.splitbelow=false end
-- })
vim.api.nvim_create_autocmd('filetype', {
	pattern = "help",
	callback = function() vim.o.splitbelow = false end
})
