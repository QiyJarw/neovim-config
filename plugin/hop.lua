local status, hop = pcall(require, "hop")
if ( not status ) then return end

hop.setup{}

local opts = {noremap = true}
vim.api.nvim_set_keymap('n','<leader><leader>w','<cmd>HopWord<CR>',opts)
vim.api.nvim_set_keymap('n','<leader><leader>c','<cmd>HopWord<CR>',opts)
