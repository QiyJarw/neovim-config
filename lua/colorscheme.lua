--背景透過設定:neovide時は無効
vim.opt.termguicolors = true
-- if vim.fn.has('win32') ==1 and vim.g.neovide ~=true then
-- 	 vim.cmd([[augroup TransparentBG
-- 		 autocmd!
-- 		 autocmd Colorscheme * highlight Normal ctermbg=none
-- 		 autocmd Colorscheme * highlight NonText ctermbg=none
-- 		 autocmd Colorscheme * highlight LineNr ctermbg=none
-- 		 autocmd Colorscheme * highlight Folded ctermbg=none
-- 		 autocmd Colorscheme * highlight EndOfBuffer ctermbg=none
-- 	 augroup END
-- 	 ]])
-- end

vim.g.vscode_style = "dark"
-- vim.g.vscode_transparent= 1;
vim.cmd([[colorscheme vscode]])
vim.bo.syntax='on' --透過設定の後ろでないと動かない
-- set termguicolors"背景を染めたい時に有効化
