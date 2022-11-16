local status, colorizer = pcall(require, "colorizer")
if ( not status ) then return end

vim.o.termguicolors = true
local settings = {
	'css';
	'javascript';
	'typescriptreact';
}
colorizer.setup(settings)
