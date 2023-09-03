local dapStatus, dap = pcall(require, "dap")
if (not dapStatus) then return end
local masonStatus, mason = pcall(require, "mason")
if (not masonStatus) then return end
local masonDapStatus, masonDap = pcall(require, "mason-nvim-dap")
if (not masonDapStatus) then return end
local uiStatus, dapui = pcall(require, "dapui")
if (not uiStatus) then return end

mason.setup {}
-- masonDap.setup {
-- 	ensure_installed = { 'cppdbg' },
-- 	automatic_installation = true,
-- 	automatic_setup = true
-- }

masonDap.setup{
	ensure_installed = { 'cppdbg' },
	handlers = {
		function(config)
			masonDap.default_setup(config)
		end,
		cppdbg = function(config)
			config.adapters = {
				id = "cppdbg", -- necessary for cpptools
				type = "executable",
				command = "OpenDebugAD7"
			}

			config.configurations = {
				{
					name = 'Launch',
					type = 'cppdbg',
					request = 'launch',
					linux = {
						MIMode = 'gdb',
						miDebuggerPath = 'gdb'
					},
					osx = {
						MIMode = 'lldb',
						miDebuggerPath = 'lldb'
					},
					windows = {
						MIMode = 'gdb',
						miDebuggerPath = 'gdb'
					},
					program = function()
						return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
					end,
					cwd = '${workspaceFolder}',
					stopOnEntry = false,
					args = function()
						local arg = {}
						vim.ui.input({ prompt = 'enter args:', default = '' }, function(input)
							if input ~= '' then table.insert(arg, input) end
						end)
						return arg
					end
				},
				{
					name = 'Attach to gdbserver :1234',
					type = 'cppdbg',
					request = 'launch',
					MIMode = 'gdb',
					miDebuggerServerAddress = 'localhost:1234',
					miDebuggerPath = 'gdb',
					cwd = '${workspaceFolder}',
					program = function()
						return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
					end,
				},
			}
			masonDap.default_setup(config)
		end
	},
	-- function(source_name)
	-- 	require('mason-nvim-dap.automatic_setup')(source_name)
	-- end,
	-- cppdbg = function(source_name)
	-- 	dap.adapters.cppdbg = {
	-- 		id = "cppdbg", -- necessary for cpptools
	-- 		type = "executable",
	-- 		command = "OpenDebugAD7"
	-- 	}

	-- 	dap.configurations.cpp = {
	-- 		{
	-- 			name = 'Launch',
	-- 			type = 'cppdbg',
	-- 			request = 'launch',
	-- 			linux = {
	-- 				MIMode = 'gdb',
	-- 				miDebuggerPath = 'gdb'
	-- 			},
	-- 			osx = {
	-- 				MIMode = 'lldb',
	-- 				miDebuggerPath = 'lldb'
	-- 			},
	-- 			windows = {
	-- 				MIMode = 'gdb',
	-- 				miDebuggerPath = 'gdb'
	-- 			},
	-- 			program = function()
	-- 				return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
	-- 			end,
	-- 			cwd = '${workspaceFolder}',
	-- 			stopOnEntry = false,
	-- 			args = function()
	-- 				local arg = {}
	-- 				vim.ui.input({ prompt = 'enter args:', default = '' }, function(input)
	-- 					if input ~= '' then table.insert(arg,input) end
	-- 				end)
	-- 				return arg
	-- 			end
	-- 		},
	-- 		{
	-- 			name = 'Attach to gdbserver :1234',
	-- 			type = 'cppdbg',
	-- 			request = 'launch',
	-- 			MIMode = 'gdb',
	-- 			miDebuggerServerAddress = 'localhost:1234',
	-- 			miDebuggerPath = 'gdb',
	-- 			cwd = '${workspaceFolder}',
	-- 			program = function()
	-- 				return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
	-- 			end,
	-- 		},
	-- 	}

	-- 	-- If you want to use this for Rust and C, add something like this:
	-- 	dap.configurations.c = dap.configurations.cpp
	-- 	dap.configurations.rust = dap.configurations.cpp
	-- end
}

dapui.setup {}
dap.listeners.before['event_initialized']['custom'] = function(session, body)
	dapui.open()
end

dap.listeners.before['event_terminated']['custom'] = function(session, body)
	dapui.close()
end

vim.api.nvim_set_hl(0, 'DapStoppedLine', { default = false, fg = 'black', bg = '#d5e63e' })
vim.api.nvim_set_hl(0, 'DapBreakOutPoint', { default = false, fg = 'red', bg = '' })
vim.fn.sign_define('DapBreakOutPoint', { text = '', texthl = 'DapBreakOutPoint', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '', texthl = '', linehl = 'DapStoppedLine', numhl = '' })

local opts = { silent = true }
vim.keymap.set('n', '<F5>', '<cmd>DapContinue<CR>', opts)
vim.keymap.set('n', '<F6>', '<cmd>DapStepOver<CR>', opts)
vim.keymap.set('n', '<F7>', '<cmd>DapStepInto<CR>', opts)
vim.keymap.set('n', '<F8>', '<cmd>DapStepOut<CR>', opts)
vim.keymap.set('n', '<leader>b', ':DapToggleBreakpoint<CR>', opts)
