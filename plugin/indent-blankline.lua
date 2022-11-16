local status, indentBlackline = pcall(require, "indent_boackline")
if ( not status ) then return end

indentBlackline.setup {
    -- for example, context is off by default, use this to turn it on
	show_current_context_start = true,
	show_end_of_line = true,
}
