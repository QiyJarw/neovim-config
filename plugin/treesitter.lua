--nvim-treesitter設定
local configStatus, configs = pcall(require, "nvim-treesitter.configs")
if ( not configStatus ) then return end

local installStatus,install = pcall(require, "nvim-treesitter.install")
if ( not installStatus ) then return end

local autoTagStatus, TSAutoTag = pcall(require, "nvim-ts-autotag")
if ( not autoTagStatus ) then return end

configs.setup {
	ensure_installed = { "vim","lua","markdown", "markdown_inline"},
	sync_install = true,
	highlight = {
		enable = true,
		}
}

TSAutoTag.setup{}
