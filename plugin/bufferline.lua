local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup {
	options = {
		numbers = "none",
		--- @deprecated, please specify numbers as a function to customize the styling
		-- number_style = "", -- buffer_id at index 1, ordinal at index 2
		close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
		right_mouse_command = "",
		-- right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
		left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
		middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
		-- NOTE: this plugin is designed with this icon in mind,
		-- and so changing this is NOT recommended, this is intended
		-- as an escape hatch for people who cannot bear it for whatever reason
		indicator = {
			icon = '▎',
			style = 'none'
		},
		buffer_close_icon = '',
		modified_icon = '●',
		close_icon = '',
		left_trunc_marker = '',
		right_trunc_marker = '',
		--- name_formatter can be used to change the buffer's label in the bufferline.
		--- Please note some names can/will break the
		--- bufferline so use this at your discretion knowing that it has
		--- some limitations that will *NOT* be fixed.
		name_formatter = function(buf) -- buf contains a "name", "path" and "bufnr"
			-- remove extension from markdown files for example
			-- if buf.name:match('%.md') then
			--   return vim.fn.fnamemodify(buf.name, ':t:r')
			-- end
		end,
		max_name_length = 18,
		max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
		tab_size = 18,
		diagnostics = "nvim_lsp",
		diagnostics_update_in_insert = false,
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			return "(" .. count .. ")"
		end,
		-- NOTE: this will be called a lot so don't do any heavy processing here
		custom_filter = function(buf_number, buf_numbers)
			-- filter out filetypes you don't want to see
			if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
				return true
			end
			-- filter out by buffer name
			if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
				return true
			end
			-- filter out based on arbitrary rules
			-- e.g. filter out vim wiki buffer from tabline in your work repo
			if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
				return true
			end
			-- filter out by it's index number in list (don't show first buffer)
			if buf_numbers[1] ~= buf_number then
				return true
			end
		end,
		offsets = { { filetype = "NvimTree", text = " File Explorer" } },
		show_buffer_icons = true, -- disable filetype icons for buffers
		show_buffer_close_icons = true,
		show_close_icon = false,
		show_tab_indicators = true,
		persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
		-- can also be a table containing 2 custom separators
		-- [focused and unfocused]. eg: { '|', '|' }
		-- separator_style = "thick",
		-- enforce_regular_tabs = false | true,
		always_show_bufferline = false,
		sort_by = 'id',
		-- add custom logic
		-- return buffer_a.modified > buffer_b.modified
		-- endfunction
		groups = {
			options = {
				toggle_hidden_on_enter = true -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
			},
			items = {
				-- {
				-- 	name = "Docs",
				-- 	highlight = { undercurl = false, sp = "green" },
				-- 	auto_close = false, -- whether or not close this group if it doesn't contain the current buffer
				-- 	matcher = function(buf)
				-- 		return buf.filename:match('%.md') or buf.filename:match('%.txt')
				-- 	end,
				-- 	separator = { -- Optional
				-- 		style = require('bufferline.groups').separator.pill
				-- 	},
				-- },
				-- {
				-- 	name = "settings",
				-- 	highlight = { undercurl = false, sp = "green" },
				-- 	auto_close = false, -- whether or not close this group if it doesn't contain the current buffer
				-- 	matcher = function(buf)
				-- 		return buf.filename:match('%.lua')
				-- 	end,
				-- 	separator = { -- Optional
				-- 		style = require('bufferline.groups').separator.pill
				-- 	},
				-- }
			}
		}
	},
}

vim.o.hidden = true --バッファを未保存で移動しても警告を出さない bufferline.vimにて移動するために序盤に読み込む
local opts = { noremap = true }
vim.keymap.set('n', '<c-l>', '<cmd>BufferLineCycleNext<CR>', opts)
vim.keymap.set('n', '<c-h>', '<cmd>BufferLineCyclePrev<CR>', opts)
