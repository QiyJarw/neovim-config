local alphaStatus, alpha = pcall(require, "alpha")
if (not alphaStatus ) then return end

local dashboard = require("alpha.themes.dashboard")

dashboard.section.buttons.val = {
    dashboard.button( "e", "  > New file" , ":ene <BAR> startinsert <CR>"),
    dashboard.button( "SPC f f", "  > Find file", ":Telescope find_files<CR>"),
    dashboard.button( "r", "  > Recent"   , ":Telescope oldfiles<CR>"),
	dashboard.button("SPC o s","  > Open Session", "<cmd>SessionSearch<CR>"),
    dashboard.button( "s", "  > Settings" , ":e $MYVIMRC<CR> |:cd %:h<CR>"),
    dashboard.button( "q", "  > Quit NVIM", ":qa<CR>"),
}

dashboard.section.header.val = {
[[   _______                    .__           ]],
[[   \      \   ____  _______  _|__| _____    ]],
[[   /   |   \_/ __ \/  _ \  \/ /  |/     \   ]],
[[  /    |    \  ___(  <_> )   /|  |  Y Y  \  ]],
[[  \____|__  /\___  >____/ \_/ |__|__|_|  /  ]],
[[          \/     \/                    \/   ]],

}
alpha.setup(dashboard.config)

-- Disable folding on alpha buffer

vim.api.nvim_create_autocmd('FileType', {
	pattern = "alpha",
	callback = function ()
		-- vim.opt_local.foldenable = false
	end
})

-- vim.cmd([[
--     autocmd FileType alpha setlocal nofoldenable
-- 	autocmd FileType alpha set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2
-- ]])
