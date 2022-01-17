local ops = {noremap = true}
vim.api.nvim_set_keymap('n','<c-l>','<cmd>TablineBufferNext<CR>',ops)
vim.api.nvim_set_keymap('n','<c-h>','<cmd>TablineBufferPrevious<CR>',ops)
