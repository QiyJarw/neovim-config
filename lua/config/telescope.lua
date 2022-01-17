--telescope設定
require('telescope').setup{
  defaults = {
  },
  pickers = {
    find_files = {
      theme = "dropdown",
    },
	buffers = {
		theme = "dropdown",
		   },
	live_grep = {
		theme = "dropdown",
		},
	file_browser = {
		theme = "dropdown"
		   },
	fd = {
		theme = "dropdown"
	}
  },
	extensions = {
	}
}
