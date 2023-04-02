--nvim-treesitter設定
local configStatus, configs = pcall(require, "nvim-treesitter.configs")
if ( not configStatus ) then return end

local installStatus,install = pcall(require, "nvim-treesitter.install")
if ( not installStatus ) then return end

local autoTagStatus, TSAutoTag = pcall(require, "nvim-ts-autotag")
if ( not autoTagStatus ) then return end

install.compilers={"gcc"}
configs.setup {
	ensure_installed = { "c","html","javascript","tsx","css","c_sharp","vim","lua","rust", "markdown" },
	highlight = {
		enable = true,
		}
}

TSAutoTag.setup{}
