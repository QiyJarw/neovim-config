--telescope設定
local telescopeStatus, telescope = pcall(require, "telescope")
if ( not telescopeStatus ) then return end

local builtin = require("telescope.builtin")
local actions = require("telescope.actions")
local themes = require("telescope.themes")

local sessionStatus, sessionLens = pcall(require, "auto-session.session-lens")
if ( not sessionStatus ) then return end

telescope.load_extension('ui-select')
telescope.load_extension('file_browser')
-- telescope.load_extension('fzf')
telescope.load_extension('zoxide')

telescope.setup {
  defaults = {
	  mappings = {
		  i = {
			  ["<c-q>"] = actions.close,
			  ["<c-j>"] = actions.move_selection_next,
			  ["<c-k>"] = actions.move_selection_previous
		  },
		  n = {
			  ["q"] = actions.close,
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
		file_browser = {
			hijack_netrw = true,
		},
		-- fzf = {
		-- 	fuzzy = true
		-- },
		["ui-select"] = {
			themes.get_dropdown {

			}
		}
	}
}

--keymappings
local opts = {noremap = true, silent = true}
vim.keymap.set('n','<Leader>ff',builtin.find_files,opts)
vim.keymap.set('n','<Leader>F',telescope.extensions.file_browser.file_browser,opts)
vim.keymap.set('n','<Leader>fb',builtin.buffers,opts)
vim.keymap.set('n','<Leader>fg',builtin.live_grep,opts)
vim.keymap.set('n','<Leader>fh',builtin.help_tags,opts)
vim.keymap.set('n','<Leader>gc',builtin.git_commits,opts)
vim.keymap.set('n','<Leader>gs',builtin.git_status,opts)
vim.keymap.set('n','<Leader>d',builtin.diagnostics,opts)
vim.keymap.set('n','<Leader>:',builtin.commands,opts)
vim.keymap.set('n','<Leader>t','<cmd>TodoTelescope<CR>',opts)
vim.keymap.set('n','<Leader>z',telescope.extensions.zoxide.list,opts)
vim.keymap.set('n','<Leader>os',sessionLens.search_session,opts)
-- vim.keymap.set('n','<Leader>m',ext.vim_bookmarks.current_file,opts)
-- vim.keymap.set('n','<Leader>M',ext.vim_bookmarks.all,opts)

-- previewerで改行をする
vim.api.nvim_create_autocmd('User',{
	pattern = 'TelescopePreviewerLoaded',
	callback = function () vim.opt_local.wrap = true end
})
