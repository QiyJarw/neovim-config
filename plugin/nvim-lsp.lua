local saga = require("lspsaga")
saga.init_lsp_saga({
	border_style = "rounded",
	code_action_icon = "",
	rename_action_quit = "<Esc>"
})

require('mason').setup{
	ui = {
		icons = {
			package_installed = "✅",
			package_pending = "➜",
			package_uninstalled ="❎"
		}
	}
}
local lspconfig= require('lspconfig')
-- local lsp_status = require('lsp-status')
-- lsp_status.register_progress()

--表示するdiagnosticのアイコン変更
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

require('mason-lspconfig').setup_handlers({
	function(server_name)
	 local opts = {}
	 --language serverが起動したときに呼ばれる関数
	 opts.on_attach = function(_, bufnr)
	   -- Enable completion triggered by <c-x><c-o>
	   vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	   -- Mappings.
	   -- See `:help vim.lsp.*` for documentation on any of the below functions
	   local keyopts = { noremap=true, silent=true }
	   vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, keyopts)
	   vim.keymap.set('n','gr', "<cmd>Lspsaga rename<CR>", keyopts)
	   -- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, keyopts)
	   -- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, keyopts)
	   vim.keymap.set('n','[d','<cmd>Lspsaga diagnostic_jump_prev<CR>',keyopts)
	   vim.keymap.set('n',']d','<cmd>Lspsaga diagnostic_jump_next<CR>',keyopts)
	   vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, keyopts)

	   local bufopts = { noremap=true, silent=true, buffer=bufnr }
	   -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
	   vim.keymap.set('n','K',"<cmd>Lspsaga hover_doc<CR>",bufopts)
	   vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
	   vim.keymap.set('n','gd',"<cmd>Lspsaga peek_definition<CR>", keyopts)
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
	   vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
	   -- vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
	   vim.keymap.set('n','<space>ca',"<cmd>Lspsaga code_action<CR>",bufopts)
	   -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
	   vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
	 end
	 if server_name == "sumneko_lua" then
	 	opts.settings = {
			Lua = {
				diagnostics = {globals = {'vim'}}
			}
		}
	 end
	 if server_name == "rust_analyzer" then
		 require'rust-tools'.setup({
			 server = {
				 on_attach = opts.on_attach
			 }
		 })
	 end
	 lspconfig[server_name].setup(opts)
 end
})

 --capabilitiesを拡張
 local capabilities = vim.lsp.protocol.make_client_capabilities()
 capabilities.textDocument.completion.completionItem.snippetSupport = true
 capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
-- capabilities = vim.tbl_extend('keep', capabilities or {}, lsp_status.capabilities)