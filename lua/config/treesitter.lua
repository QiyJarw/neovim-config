--nvim-treesitter設定
require 'nvim-treesitter.install'.compilers={"gcc"}
require 'nvim-treesitter.configs'.setup {
	highlight = {
		enable = true,
		disable = {
			}
		},
	ensure_installed = {'c','cpp','rust','html','css','javascript','typescript','tsx','c_sharp'}
}
