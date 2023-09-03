local navicStatus, navic = pcall(require, "nvim-navic")
if (not navicStatus) then return end

local barbecueStatus, barbecue = pcall(require, "barbecue")
if (not barbecueStatus) then return end

local contextIcons =
{
	File          = "󰈙 ",
	Module        = " ",
	Namespace     = "󰌗 ",
	Package       = " ",
	Class         = "󰌗 ",
	Method        = "󰆧 ",
	Property      = " ",
	Field         = " ",
	Constructor   = " ",
	Enum          = "󰕘",
	Interface     = "󰕘",
	Function      = "󰊕 ",
	Variable      = "󰆧 ",
	Constant      = "󰏿 ",
	String        = "󰀬 ",
	Number        = "󰎠 ",
	Boolean       = "◩ ",
	Array         = "󰅪 ",
	Object        = "󰅩 ",
	Key           = "󰌋 ",
	Null          = "󰟢 ",
	EnumMember    = " ",
	Struct        = "󰌗 ",
	Event         = " ",
	Operator      = "󰆕 ",
	TypeParameter = "󰊄 ",
}

navic.setup { icons = contextIcons }

barbecue.setup {
	symbols = {
		separator = ""
	},
	kinds = contextIcons
}

vim.api.nvim_set_hl(0, "NavicText", { default = false, fg = "#7ba2c9" })
