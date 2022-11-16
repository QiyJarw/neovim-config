-- vim.cmd[[set sessionoptions+=tabpages,globals]]--タブ情報とグローバル変数をセッション保存
-- vim.cmd[[set sessionoptions-=blank]]--空ファイルをセッションに保存しない
-- require 'tabline'.setup{enable=false}--tablineの設定は無効化
local navicStatus, navic = pcall(require, "nvim-navic")
if (not navicStatus) then return end

local sessionLibStatus, autoSessionLib = pcall(require, "auto-session-library")
if (not sessionLibStatus) then return end

local lualineStatus, lualine = pcall(require, "lualine")
if (not lualineStatus) then return end

lualine.setup {
	options = {
		globalstatus = true,
		icons_enabled = true,
		theme = 'auto',
		component_separators = { left = '', right = '' },
		section_separators = { left = '', right = '' },
		disabled_filetypes = {},
		always_divide_middle = true,
	},

	sections = {
		lualine_a = { 'mode' },
		lualine_b = {  autoSessionLib.current_session_name , 'branch' },
		lualine_c = { 'filename', {navic.get_location, cond = navic.is_available}},
		lualine_x = { 'location', 'progress' },
		lualine_y = { 'diagnostics', 'diff' },
		lualine_z = { 'filetype', },
	},

	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { 'filename' },
		lualine_x = { 'location' },
		lualine_y = {},
		lualine_z = {}
	},
	extensions = { 'nvim-tree', 'fugitive', 'toggleterm' } --一部の拡張機能に合わせて表示を変更
}
