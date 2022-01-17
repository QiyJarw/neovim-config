-- "let g:mapleader = "\<Space>" "leaderキーをスペースに設定

-- "terminal設定
-- " tnoremap <Esc> <C-\><C-n>
-- " command! -nargs=* T split | wincmd j | resize 10 | terminal <args>
-- " autocmd! TermOpen * startinsert

-- ""===キー入力============
-- "noremap <Up> <Nop>
-- "noremap <Down> <Nop>
-- "noremap <Left> <Nop>
-- "noremap <Right> <Nop>
-- "inoremap <Up> <Nop>
-- "inoremap <Down> <Nop>
-- "inoremap <Left> <Nop>
-- "inoremap <Right> <Nop>

-- ""=====カーソル移動===============
-- "inoremap <C-j> <Down>
-- "inoremap <C-k> <Up>
-- "inoremap <C-h> <Left>
-- "inoremap <C-l> <Right>
-- "inoremap <C-e> <$>

-- ""========ｊキー二度押しでESCキー
-- "inoremap jj <Esc>
-- "inoremap っｊ <Esc>

-- ""括弧保管
-- "inoremap { {}<LEFT>
-- "inoremap ( ()<LEFT>
-- "inoremap " ""<LEFT>
-- "inoremap ' ''<LEFT>
-- "inoremap [ []<LEFT>
ops = { noremap = true } 
vim.g.mapleader=' ' --<Leader>キーの設定。<Space>ではうまくいかない
--[[矢印キーの無効化]]
vim.api.nvim_set_keymap('n','<UP>','<Nop>',ops)
vim.api.nvim_set_keymap('n','<Down>','<Nop>',ops)
vim.api.nvim_set_keymap('n','<Right>','<Nop>',ops)
vim.api.nvim_set_keymap('n','<Left>','<Nop>',ops)

vim.api.nvim_set_keymap('i','<Up>','<Nop>',ops)
vim.api.nvim_set_keymap('i','<Down>','<Nop>',ops)
vim.api.nvim_set_keymap('i','<Right>','<Nop>',ops)
vim.api.nvim_set_keymap('i','<Left>','<Nop>',ops)

vim.api.nvim_set_keymap('i','<C-j>','<Down>',ops)
vim.api.nvim_set_keymap('i','<C-k>','<Up>',ops)
vim.api.nvim_set_keymap('i','<C-h>','<Left>',ops)
vim.api.nvim_set_keymap('i','<C-l>','<Right>',ops)

--[[ｊキー二度押しでESCキー]]
vim.api.nvim_set_keymap('i','jj','<Esc>',ops)
vim.api.nvim_set_keymap('n','<Esc><ESC>','<cmd>nohlsearch<CR>',ops)

--[[括弧補完]]
-- vim.api.nvim_set_keymap('i','{','{}<LEFT>',ops)
-- vim.api.nvim_set_keymap('i','(','()<LEFT>',ops)
-- vim.api.nvim_set_keymap('i','\"','\"\"<LEFT>',ops)
-- vim.api.nvim_set_keymap('i','\'','\'\'<LEFT>',ops)
-- vim.api.nvim_set_keymap('i','[','[]<LEFT>',ops)

--[[ターミナル設定]]
-- vim.api.nvim_set_keymap('t','<Esc>','<C-\\><C-n>',{})
-- vim.cmd([[
-- command! -nargs=* T split | wincmd j | resize 10 | terminal <args>
-- autocmd! TermOpen * startinsert
-- ]])
