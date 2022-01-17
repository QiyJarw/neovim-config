local opt = {noremap = true}
vim.api.nvim_set_keymap('n','<c-l>','<cmd>BufferLineCycleNext<CR>',opt)
vim.api.nvim_set_keymap('n','<c-h>','<cmd>BufferLineCyclePrev<CR>',opt)
