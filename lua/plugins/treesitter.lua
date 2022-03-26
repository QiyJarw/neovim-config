--nvim-treesitter設定
require 'nvim-treesitter.install'.compilers={"gcc"}
require 'nvim-treesitter.configs'.setup {
	ensure_installed = "maintained",
	highlight = {
		enable = true,
		},
}
