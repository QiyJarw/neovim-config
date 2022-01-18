-- vim.cmd[[set sessionoptions+=tabpages,globals]]--タブ情報とグローバル変数をセッション保存
-- vim.cmd[[set sessionoptions-=blank]]--空ファイルをセッションに保存しない
-- require 'tabline'.setup{enable=false}--tablineの設定は無効化
require'lualine'.setup{
  options = {
    icons_enabled = true,
    theme = 'onedark',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename',require('auto-session-library').current_session_name},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  -- tabline = {
	  -- lualine_a={},
	  -- lualine_b={},
	  -- lualine_c={require'tabline'.tabline_buffers},
	  -- lualine_x={require'tabline'.tabline_tabs},
	  -- luailne_y={},
	  -- lualine_z={}
  -- },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  extensions = {'nvim-tree','fugitive','toggleterm'}--一部の拡張機能に合わせて表示を変更
}
