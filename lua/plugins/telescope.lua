--telescope設定
--simple theme

cmd = require('telescope.builtin')
ext = require('telescope').extensions
require('telescope').setup{
  defaults = {
	  -- mappings = {
		  -- n = {
			  -- ["<leader>ff"] = cmd.find_files,
			  -- ["<leader>fb"] = cmd.buffers,
			  -- ["<leader>fg"] = cmd.live_grep,
			  -- ["<leader>gc"] = cmd.git_commits,
			  -- ["<leader>gh"] = cmd.help_tags,
			  -- ["<leader>m"] =  ext.vim_bookmarks.current_file,
			  -- ["<leader>M"] =  ext.vim_bookmarks.all,
			  -- ["<leader>z"] = ext.zoxide.list,
			  -- ["<leader>as"] = require('session-lens').search_session


		  -- }
  -- }
    },
  pickers = {
    find_files = {
    },
	buffers = {
		theme = "dropdown",
		previewer = false
	   },
	live_grep = {
		},
	-- file_browser = {
	-- 	theme = "dropdown"
	-- 	   },
	fd = {
		theme = "dropdown"
	},
	lsp_code_actions = {
		theme = "cursor"
	}

  },
	ext = {
		fzf = {
			fuzzy = true
		},
	}
}

require('telescope').load_extension('fzf')
require('telescope').load_extension('zoxide')
require('telescope').load_extension('vim_bookmarks')
require('telescope').load_extension('session-lens')

--keymappings
local opt = {noremap = true}
vim.api.nvim_set_keymap('n','<Leader>ff',"<cmd>lua require('telescope.builtin').find_files()<CR>",opt)
vim.api.nvim_set_keymap('n','<Leader>fb',"<cmd>lua require('telescope.builtin').buffers()<CR>",opt)
vim.api.nvim_set_keymap('n','<Leader>fg',"<cmd>lua require('telescope.builtin').live_grep()<CR>",opt)
vim.api.nvim_set_keymap('n','<Leader>fh',"<cmd>lua require('telescope.builtin').help_tags()<CR>",opt)
vim.api.nvim_set_keymap('n','<Leader>gc',"<cmd>lua require('telescope.builtin').git_commits()<CR>",opt)
-- vim.api.nvim_set_keymap('n','<Leader>FF','<cmd>lua require('telescope.builtin').file_browser()<CR>',opt)
vim.api.nvim_set_keymap('n','<Leader>:',"<cmd>lua require('telescope.builtin').commands()<CR>",opt)
vim.api.nvim_set_keymap('n','<Leader>t','<cmd>TodoTelescope<CR>',opt)
vim.api.nvim_set_keymap('n','<Leader>z','<cmd>Telescope zoxide list<CR>',opt)
vim.api.nvim_set_keymap('n','<Leader>ca',"<cmd>lua require('telescope.builtin').lsp_code_actions()<CR>",opt)
vim.api.nvim_set_keymap('n','<Leader>os',"<cmd>lua require('session-lens').search_session()<CR>",opt)
