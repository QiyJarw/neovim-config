local scrollbarStatus, scrollbar = pcall(require, "scrollbar")
if ( not scrollbarStatus ) then return end

local handlersStatus, scrollbarHandlersSearch = pcall(require, "scrollbar.handlers.search")
if ( not handlersStatus ) then return end

scrollbarHandlersSearch.setup()
scrollbar.setup({
	handle = {
		color = "#3a4659"
	},
	marks = {
		Search = {color = "#a9b83d"}
	},
	handlers = {
		diagnostic = false,
		search = true
	}
})

