--telescope設定
local cmd = require('telescope.builtin')
local action = require('telescope.actions')

require('telescope').setup{
  defaults = {
	  mappings = {
		  n = {
			  ["q"] = action.close,
		  }
		}
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
	fd = {
		theme = "dropdown"
	},
	lsp_code_actions = {
		theme = "cursor"
	}

  },
	extensions = {
		fzf = {
			fuzzy = true
		},
		["ui-select"] = {
			require('telescope.themes').get_dropdown {

			}
		}
	}
}

require('telescope').load_extension('fzf')
require('telescope').load_extension('zoxide')
require('telescope').load_extension('vim_bookmarks')
require('telescope').load_extension('session-lens')
require('telescope').load_extension('ui-select')

local ext = require('telescope').extensions

--keymappings
local opts = {noremap = true}
vim.keymap.set('n','<Leader>ff',cmd.find_files,opts)
vim.keymap.set('n','<Leader>fb',cmd.buffers,opts)
vim.keymap.set('n','<Leader>fg',cmd.live_grep,opts)
vim.keymap.set('n','<Leader>fh',cmd.help_tags,opts)
vim.keymap.set('n','<Leader>gc',cmd.git_commits,opts)
vim.keymap.set('n','<Leader>gs',cmd.git_status,opts)
vim.keymap.set('n','<Leader>d',cmd.diagnostics,opts)
vim.keymap.set('n','<Leader>:',cmd.commands,opts)
vim.keymap.set('n','<Leader>t','<cmd>TodoTelescope<CR>',opts)
vim.api.nvim_set_keymap('n','<Leader>z','<cmd>Telescope zoxide list<CR>',opts)
vim.keymap.set('n','<Leader>os',"<cmd>lua require('session-lens').search_session()<CR>",opts)
vim.keymap.set('n','<Leader>m',ext.vim_bookmarks.current_file,opts)
vim.keymap.set('n','<Leader>M',ext.vim_bookmarks.all,opts)
