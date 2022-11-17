local navicStatus, navic = pcall(require, "nvim-navic")
if (not navicStatus) then return end

local barbecueStatus, barbecue = pcall(require, "barbecue")
if (not barbecueStatus) then return end

local contextIcons =
{
	File          = " ",
	Module        = " ",
	Namespace     = " ",
	Package       = " ",
	Class         = " ",
	Method        = " ",
	Property      = " ",
	Field         = " ",
	Constructor   = " ",
	Enum          = "練",
	Interface     = "練",
	Function      = " ",
	Variable      = " ",
	Constant      = " ",
	String        = " ",
	Number        = " ",
	Boolean       = "◩ ",
	Array         = " ",
	Object        = " ",
	Key           = " ",
	Null          = "ﳠ ",
	EnumMember    = " ",
	Struct        = " ",
	Event         = " ",
	Operator      = " ",
	TypeParameter = " ",
}

navic.setup { icons = contextIcons }

barbecue.setup {
	symbols = {
		separator = ""
	},
	kinds = contextIcons
}
