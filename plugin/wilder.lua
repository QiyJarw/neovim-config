local status, wilder = pcall(require, "wilder")
if ( not status ) then return end

local gradient = {
  '#f4468f', '#fd4a85', '#ff507a', '#ff566f', '#ff5e63',
  '#ff6658', '#ff704e', '#ff7a45', '#ff843d', '#ff9036',
  '#f89b31', '#efa72f', '#e6b32e', '#dcbe30', '#d2c934',
  '#c8d43a', '#bfde43', '#b6e84e', '#aff05b'
}

-- for i, fg in ipairs(gradient) do
--   gradient[i] = wilder.make_hl('WilderGradient' .. i, 'Pmenu', {{a = 1}, {a = 1}, {foreground = fg}})
-- end

wilder.set_option('renderer', wilder.popupmenu_renderer(
	-- wilder.popupmenu_border_theme({
	-- 	pumblend = 13,
	-- 	highlights  = {
	-- 		gradient = gradient,
	-- 	},
	-- 	highlighter = wilder.highlighter_with_gradient({
	-- 		wilder.basic_highlighter()
	-- 	}),
	-- 	border = 'rounded',
	-- 	left = {' ', wilder.popupmenu_devicons()},
	-- 	right = {' ', wilder.popupmenu_scrollbar()}
	-- })
	wilder.popupmenu_palette_theme({
		border = 'rounded',
		max_height = '50%',
		min_height = 0,
		prompt_position = 'top',
		reverse = 0,
		left = {' ', wilder.popupmenu_devicons()},
		right = {' ', wilder.popupmenu_scrollbar()},
	})
))

if vim.g.vscode then return end --vscode-neovimでは設定しない
wilder.setup({ modes = {':','/','?'}})
