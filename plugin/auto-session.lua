local notifyStatus, notify = pcall(require,"notify")
if ( not notifyStatus ) then return end
notify.setup({timeout = 3000})
vim.notify = notify

local sessionStatus, autoSession = pcall(require, "auto-session")
if ( not sessionStatus ) then return end

autoSession.setup{
	log_level='info',
	auto_session_suppress_dirs = {'~/','~/dev'},
	auto_session_enable_last_session = false,
	auto_session_root_dir = vim.fn.stdpath('data').."/sessions/",
	auto_session_enabled = true,
	auto_save_enabled = true,
	auto_restore_enabled = nil,

}

vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

--session-lens
local opt = {noremap = true}
vim.api.nvim_set_keymap('n','<leader>os','<cmd>SearchSession<CR>',opt)
