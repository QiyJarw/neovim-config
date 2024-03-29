local cmpStatus, cmp = pcall(require, "cmp")
if ( not cmpStatus ) then return end

local lspStatus, lspkind = pcall(require, "lspkind")
if ( not lspStatus ) then return end

cmp.setup({
	formatting = {
		format = lspkind.cmp_format({
			mode = 'symbol_text',
			menu = {
				buffer = "[buffer]",
				nvim_lsp = "[LSP]",
			},
			maxwidth = 50,
			ellipsis_char = '...',
			before = function (entry, vim_item)
				-- ...
				return vim_item
			end
		})
	},
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	window = {
		documentation = cmp.config.window.bordered()
	},
	mapping = {
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<CR>'] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = true
		},
		['<Tab>'] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end,
		['<S-Tab>'] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end,
		},
	sources = cmp.config.sources({
		{name = 'nvim_lsp'},
		{name = 'vsnip'},
		{name = 'buffer'},
		{name = 'orgmode'}

	})
})
