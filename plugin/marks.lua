local status, marks = pcall(require, "marks")
if (not status) then return end

marks.setup({
	bookmark_0 = {
		sign = ""
	}
})
