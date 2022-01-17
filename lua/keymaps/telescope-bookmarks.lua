 -- " nnoremap <Leader>m :Telescope vim_bookmarks current_file<CR>
 -- " nnoremap <Leader>M :Telescope vim_bookmarks all<CR>

 vim.api.nvim_set_keymap('n','<Leader>m','<cmd>Telescope vim_bookmarks current_file<CR>',{}) 
 vim.api.nvim_set_keymap('n','<Leader>M','<cmd>Telescope vim_bookmarks all<CR>',{}) 
