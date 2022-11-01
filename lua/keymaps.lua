local opts = { noremap = true ,silent = true}
vim.g.mapleader=' ' --<Leader>キーの設定。<Space>ではうまくいかない
--[[矢印キーの無効化]]
vim.keymap.set('n','<UP>','<Nop>',opts)
vim.keymap.set('n','<Down>','<Nop>',opts)
vim.keymap.set('n','<Right>','<Nop>',opts)
vim.keymap.set('n','<Left>','<Nop>',opts)

vim.keymap.set('i','<Up>','<Nop>',opts)
vim.keymap.set('i','<Down>','<Nop>',opts)
vim.keymap.set('i','<Right>','<Nop>',opts)
vim.keymap.set('i','<Left>','<Nop>',opts)

vim.keymap.set('i','<C-j>','<Down>',opts)
vim.keymap.set('i','<C-k>','<Up>',opts)
vim.keymap.set('i','<C-h>','<Left>',opts)
vim.keymap.set('i','<C-l>','<Right>',opts)

--[[ｊキー二度押しでESCキー]]
vim.keymap.set('i','jj','<Esc>',opts)
vim.keymap.set('n','<Esc><Esc>',':nohlsearch<CR>',opts) --hlslens対策で<cmd>表記ではない

