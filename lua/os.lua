-- OSによる設定の分岐を記述
--[[ターミナル設定]]
if vim.fn.has("win32")==1 then
	vim.o.shell='pwsh'
	vim.o.shellcmdflag='-c'
	vim.o.shellquote=[[]]
	vim.o.shellxquote=[[]]
elseif vim.fn.has("linux")==1 then
	if vim.fn.system('which zsh | grep not') ~= '' then
	vim.o.shell='zsh'
else
	vim.o.shell='bash'
	end
end

-- wslのときにwin32yank.exeと連携
if vim.fn.has("wsl") == 1 then
	if vim.fn.system('which win32yank.exe | grep not') ~= '' then -- win32yank.exeがあれば
		vim.cmd[[let g:clipboard = { 'name' : 'wslClipboard', 'copy' : { '+' : 'win32yank.exe -i', '*' : 'win32yank.exe -i', }, 'paste' : { '+' : 'win32yank.exe -o', '*' : 'win32yank.exe -o', }, 'cache_enabled' : 1, }]]--ワンライナーでしか動かない
	end
end
