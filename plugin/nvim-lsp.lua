local sagaStatus, saga = pcall(require, "lspsaga")
if (not sagaStatus) then return end

local masonStatus, mason = pcall(require, "mason")
if (not masonStatus) then return end

local cmpStatus, cmpNvimLsp = pcall(require, "cmp_nvim_lsp")
if (not cmpStatus) then return end

local lspStatus, lspconfig = pcall(require, "lspconfig")
if (not lspStatus) then return end

local masonLspStatus, masonLspConfig = pcall(require, "mason-lspconfig")
if (not masonLspStatus) then return end

local navicStatus, navic = pcall(require, "nvim-navic")
if ( not navicStatus ) then return end

local rustStatus, rustTools = pcall(require, "rust-tools")
if not rustStatus then return end

saga.init_lsp_saga({
	border_style = "rounded",
	code_action_icon = "",
	rename_action_quit = "<Esc>"
})

mason.setup {
	ui = {
		icons = {
			package_installed = "✅",
			package_pending = "➜",
			package_uninstalled = "❎"
		}
	}
}

-- local lsp_status = require('lsp-status')
-- lsp_status.register_progress()

--表示するdiagnosticのアイコン変更
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

masonLspConfig.setup_handlers({
	function(server_name)
		local opts = {}
		--language serverが起動したときに呼ばれる関数
		opts.on_attach = function(client, bufnr)
			if client.server_capabilities.documentSymbolProvider then
				navic.attach(client, bufnr)
			end

			-- Enable completion triggered by <c-x><c-o>
			vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

			-- Mappings.
			-- See `:help vim.lsp.*` for documentation on any of the below functions
			local keyopts = { noremap = true, silent = true }
			vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, keyopts)
			vim.keymap.set('n', 'gr', "<cmd>Lspsaga rename<CR>", keyopts)
			-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, keyopts)
			-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, keyopts)
			vim.keymap.set('n', '[d', '<cmd>Lspsaga diagnostic_jump_prev<CR>', keyopts)
			vim.keymap.set('n', ']d', '<cmd>Lspsaga diagnostic_jump_next<CR>', keyopts)
			vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, keyopts)

			local bufopts = { noremap = true, silent = true, buffer = bufnr }
			-- vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
			vim.keymap.set('n', 'K', "<cmd>Lspsaga hover_doc<CR>", bufopts)
			vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
			vim.keymap.set('n', 'gd', "<cmd>Lspsaga peek_definition<CR>", keyopts)
			vim.keymap.set('n', 'gh', '<cmd>Lspsaga lsp_finder<CR>', bufopts)
			-- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
			vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
			vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
			vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
			vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
			vim.keymap.set('n', '<space>wl', function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, bufopts)
			vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
			vim.keymap.set('n', '<space>r', vim.lsp.buf.rename, bufopts)
			-- vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
			vim.keymap.set('n', '<space>ca', "<cmd>Lspsaga code_action<CR>", bufopts)
			-- vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
			vim.keymap.set('n', '<space>fm', function() vim.lsp.buf.format { async = true } end, bufopts)
		end
		if server_name == "sumneko_lua" then
			opts.settings = {
				Lua = {
					diagnostics = { globals = { 'vim' } }
				}
			}
		end
		if server_name == "rust-analyzer" then
			rustTools.setup({
				server = {
					on_attach = opts.on_attach
				}
			})
		end
		lspconfig[server_name].setup(opts)
	end
})

local capabilities = cmpNvimLsp.default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
