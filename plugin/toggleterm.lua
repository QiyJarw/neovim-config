local term = require("toggleterm.terminal").Terminal
local lazygit = term:new({
	cmd = "lazygit",
	count = 2,
	direction = "float",
	hidden = true
})

function _lazygit_toggle()
	lazygit:toggle()
end

require('toggleterm').setup{
	size = 12, -- ターミナルのサイズ
	open_mapping = "<c-t>",
	count = 1,
	hide_numbers = true,
	-- shade_filetypes = {},
	shade_terminals = true,
	start_in_insert = true, --ターミナルを開いた時にインサートモードで入る
	insert_mappings = true,
	persist_size = true,
	direction = 'horizontal', --ターミナルを開く方式
	close_on_exit = true, --プロセスをキルしたときにウィンドウを閉じる
	shell = vim.o.shell, --シェルの設定
	-- float ウィンドウ時の設定
	float_opts = {
		border = 'curved',
		width = 240,
		height = 80,
		winblend = 13, --custom promptが崩れるため0に設定
		highlights = {
			border = "Normal",
			background = "Normal"
		}
	}
}
vim.api.nvim_set_keymap('t','jj','<C-\\><C-n>',{noremap = true})
vim.keymap.set("n","<leader>lg",_lazygit_toggle, {noremap = true, silent = true})
