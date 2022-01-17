-- " Find files using Telescope command-line sugar.
-- " nnoremap <leader>ff <cmd>Telescope find_files<cr>
-- " nnoremap <leader>fg <cmd>Telescope live_grep<cr>
-- " nnoremap <leader>fb <cmd>Telescope buffers<cr>
-- " nnoremap <leader>fh <cmd>Telescope help_tags<cr>
-- " nnoremap <leader>gc <cmd>Telescope git_commits<cr>

opt = {noremap = true}
vim.api.nvim_set_keymap('n','<Leader>ff','<cmd>Telescope find_files<CR>',opt)
vim.api.nvim_set_keymap('n','<Leader>fb','<cmd>Telescope buffers<CR>',opt)
vim.api.nvim_set_keymap('n','<Leader>fd','<cmd>Telescope fd<CR>',opt)
vim.api.nvim_set_keymap('n','<Leader>fg','<cmd>Telescope live_grep<CR>',opt)
vim.api.nvim_set_keymap('n','<Leader>fh','<cmd>Telescope help_tags<CR>',opt)
vim.api.nvim_set_keymap('n','<Leader>gc','<cmd>Telescope git_commits<CR>',opt)
vim.api.nvim_set_keymap('n','<Leader>FF','<cmd>Telescope file_browser<CR>',opt)
vim.api.nvim_set_keymap('n','<Leader>:','<cmd>Telescope commands<CR>',opt)
vim.api.nvim_set_keymap('n','<Leader>t','<cmd>TodoTelescope<CR>',opt)

