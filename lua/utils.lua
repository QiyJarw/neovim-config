-- OSによる設定の分岐を記述
--[[ターミナル設定]]
if vim.fn.has('win32') == 1 then
	vim.o.shell = 'pwsh'
	vim.o.shellcmdflag = '-c'
	vim.o.shellquote = '\"'
	vim.o.shellxquote = ''
elseif vim.fn.has("linux") == 1 then
	if vim.fn.system('which zsh | grep not') ~= '' then
		vim.o.shell = 'zsh'
	else
		vim.o.shell = '/bin/bash'
	end
end

-- wslのときにwin32yank.exeと連携
if vim.fn.has("wsl") == 1 then
	if vim.fn.system('which win32yank.exe | grep not') ~= '' then -- win32yank.exeがあれば
		vim.cmd [[let g:clipboard = { 'name' : 'wslClipboard', 'copy' : { '+' : 'win32yank.exe -i', '*' : 'win32yank.exe -i', }, 'paste' : { '+' : 'win32yank.exe -o', '*' : 'win32yank.exe -o', }, 'cache_enabled' : 1, }]] --ワンライナーでしか動かない
	end
end

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
