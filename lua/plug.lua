--plugs settings
vim.cmd([[
call plug#begin(stdpath('data') . '/plugs/')
Plug 'vim-jp/vimdoc-ja'
Plug 'nvim-lua/plenary.nvim' "deps on telescope
Plug 'nvim-lua/popup.nvim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'lambdalisue/fern.vim' | Plug 'lambdalisue/fern-renderer-nerdfont.vim' | Plug 'lambdalisue/glyph-palette.vim'
Plug 'yuki-yano/fern-preview.vim' | Plug 'lambdalisue/fern-git-status.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/vim-vsnip' | Plug 'hrsh7th/vim-vsnip-integ'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp' | Plug 'hrsh7th/cmp-vsnip' | Plug 'hrsh7th/cmp-buffer'
Plug 'onsails/lspkind-nvim'
Plug 'williamboman/nvim-lsp-installer'
Plug 'rmagatti/goto-preview'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim'
Plug 'nvim-lualine/lualine.nvim'
"Plug 'nvim-lua/lsp-status.nvim'
Plug 'folke/trouble.nvim'
Plug 'rmagatti/auto-session'
Plug 'rmagatti/session-lens'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'alvan/vim-closetag',{'for':[ 'html','typescriptreact' ]}
Plug 'tpope/vim-commentary'
Plug 'phaazon/hop.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'cohama/lexima.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim',{'do':'make'}
Plug 'tom-anders/telescope-vim-bookmarks.nvim'
Plug 'jvgrootveld/telescope-zoxide'
"Plug 'goolord/alpha-nvim'
Plug 'akinsho/toggleterm.nvim'
Plug 'folke/todo-comments.nvim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'iamcco/markdown-preview.nvim', {'do': 'cd app && yarn install'}
"themes
Plug 'ulwlu/elly.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'tomasr/molokai'
Plug 'joshdick/onedark.vim'
Plug 'cocopon/iceberg.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'w0ng/vim-hybrid'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/everforest'
Plug 'sonph/onehalf'
Plug 'dracula/vim'
Plug 'jacoborus/tender'
Plug 'shaunsingh/nord.nvim'
Plug 'EdenEast/nightfox.nvim'
Plug 'rmehri01/onenord.nvim'
Plug 'Mofiqul/vscode.nvim'
call plug#end()
]])

local config = vim.fn.split(vim.fn.glob(vim.fn.stdpath('config') .. '/lua/plugins/' .. '*.lua'))
for _,plg in ipairs(config) do
	local ok, _ = pcall(require,'plugins/' .. vim.fn.fnamemodify(plg,':t:r'))
	if not ok then
		print(plg .. ' is not loaded.')
	end
end	
--Plug 'kassio/neoterm' "pwshでうまく動かない
