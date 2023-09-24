-- TODO: 動作が安定するようならrepoにpushする。
local jetpackfile = vim.fn.stdpath("data") .. "/site/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim"
local jetpackurl = 'https://raw.githubusercontent.com/tani/vim-jetpack/main/plugin/jetpack.vim'

--[[plug.vim本体の確認]]
if vim.fn.filereadable(jetpackfile) == 0 then
	print("vim-jetpack not found. start instatlling...")
	if vim.fn.has("win32") == 1 then --windowsの場合
		-- vim.api.nvim_command("! iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim|ni $Env:LOCALAPPDATA'/nvim-data/site/autoload/plug.vim' -Force")
		vim.fn.system('iwr -useb ' .. jetpackurl .. '|ni $Env:LOCALAPPDATA' .. '/nvim-data/site/pack/jetpack/opt/vim-jetpack/plugin/vim-jetpack.vim -Force')
	elseif vim.fn.has("unix") == 1 or vim.fn.has("mac") == 1 then --unix系統の場合
		-- vim.api.nvim_command([[!sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim']])
		vim.fn.system(string.format('curl -fsSLo %s --create-dirs %s',jetpackfile,jetpackurl))
	end
end

--plugs settings
vim.cmd([[
packadd vim-jetpack
call jetpack#begin(stdpath('data') . '/plugs')
Jetpack 'tani/vim-jetpack', {'opt': 1}
Jetpack 'vim-jp/vimdoc-ja'
Jetpack 'nvim-lua/plenary.nvim' "deps on telescope
Jetpack 'nvim-lua/popup.nvim'
"Jetpack 'lambdalisue/nerdfont.vim'
"Jetpack 'antoinemadec/FixCursorHold.nvim'
" Jetpack 'lambdalisue/fern.vim',{'branch':'main'} | Jetpack 'lambdalisue/fern-hijack.vim' | Jetpack 'lambdalisue/fern-renderer-nerdfont.vim' | Jetpack 'lambdalisue/glyph-palette.vim'
" Jetpack 'yuki-yano/fern-preview.vim' | Jetpack 'lambdalisue/fern-git-status.vim'
Jetpack 'folke/which-key.nvim'
Jetpack 'neovim/nvim-lspconfig'
Jetpack 'glepnir/lspsaga.nvim', {'branch' : 'main'}
Jetpack 'hrsh7th/vim-vsnip' | Jetpack 'hrsh7th/vim-vsnip-integ'
Jetpack 'hrsh7th/nvim-cmp'
Jetpack 'hrsh7th/cmp-nvim-lsp' | Jetpack 'hrsh7th/cmp-vsnip' | Jetpack 'hrsh7th/cmp-buffer'
Jetpack 'onsails/lspkind-nvim'
"Jetpack 'williamboman/nvim-lsp-installer'
Jetpack 'mfussenegger/nvim-dap' | Jetpack 'rcarriga/nvim-dap-ui'
Jetpack 'williamboman/mason.nvim' | Jetpack 'williamboman/mason-lspconfig.nvim' | Jetpack 'jay-babu/mason-nvim-dap.nvim'
"Jetpack 'rmagatti/goto-preview'
Jetpack 'kyazdani42/nvim-web-devicons'
"Jetpack 'kyazdani42/nvim-tree.lua'
Jetpack 'akinsho/bufferline.nvim'
Jetpack 'nvim-lualine/lualine.nvim'
Jetpack 'famiu/bufdelete.nvim'
Jetpack 'nvim-treesitter/nvim-treesitter', {'do': ':lua require(\"nvim-treesitter.install\").update({with_sync = true })'}
Jetpack 'SmiteshP/nvim-navic'
Jetpack 'utilyre/barbecue.nvim'
Jetpack 'gelguy/wilder.nvim'
Jetpack 'folke/trouble.nvim'
Jetpack 'rmagatti/auto-session'
Jetpack 'rmagatti/session-lens'
Jetpack 'terryma/vim-multiple-cursors'
Jetpack 'tpope/vim-surround'
"Jetpack 'alvan/vim-closetag',{'for':[ 'html','typescriptreact' ]}
Jetpack 'tpope/vim-commentary'
Jetpack 'phaazon/hop.nvim'
Jetpack 'lukas-reineke/indent-blankline.nvim'
Jetpack 'cohama/lexima.vim'
Jetpack 'wellle/targets.vim'
Jetpack 'tpope/vim-fugitive'
"Jetpack 'kdheepak/lazygit.nvim'
" Jetpack 'airblade/vim-gitgutter'
Jetpack 'lewis6991/gitsigns.nvim'
"Jetpack 'MattesGroeger/vim-bookmarks'
Jetpack 'rcarriga/nvim-notify'
Jetpack 'nvim-telescope/telescope.nvim'
Jetpack 'nvim-telescope/telescope-file-browser.nvim'
"Jetpack 'nvim-telescope/telescope-fzf-native.nvim',{'do':'make'}
Jetpack 'nvim-telescope/telescope-ui-select.nvim'
"Jetpack 'jvgrootveld/telescope-zoxide'
Jetpack 'tom-anders/telescope-vim-bookmarks.nvim'
Jetpack 'chentoast/marks.nvim'
Jetpack 'goolord/alpha-nvim'
"Jetpack 'nvim-orgmode/orgmode'
Jetpack 'akinsho/toggleterm.nvim'
Jetpack 'folke/todo-comments.nvim'
"Jetpack 'norcalli/nvim-colorizer.lua'
Jetpack 'iamcco/markdown-preview.nvim', {'do': 'cd app && yarn install'}
"Jetpack 'j-hui/fidget.nvim'
Jetpack 'kevinhwang91/nvim-hlslens'
Jetpack 'petertriho/nvim-scrollbar'
"Jetpack 'karb94/neoscroll.nvim'
Jetpack 'folke/lsp-colors.nvim'
"Jetpack 'vimpostor/vim-tpipeline'
"language plugins
"Jetpack 'simrat39/rust-tools.nvim' 
"Jetpack 'nvim-lua/lsp-status.nvim'
"Jetpack 'mattn/emmet-vim'
"Jetpack 'windwp/nvim-ts-autotag'
"themes
Jetpack 'arcticicestudio/nord-vim'
Jetpack 'tomasr/molokai'
Jetpack 'joshdick/onedark.vim'
Jetpack 'cocopon/iceberg.vim'
Jetpack 'ayu-theme/ayu-vim'
Jetpack 'w0ng/vim-hybrid'
Jetpack 'morhetz/gruvbox'
Jetpack 'sainnhe/everforest'
Jetpack 'sonph/onehalf'
Jetpack 'dracula/vim'
Jetpack 'jacoborus/tender'
Jetpack 'shaunsingh/nord.nvim'
Jetpack 'EdenEast/nightfox.nvim'
Jetpack 'rmehri01/onenord.nvim'
Jetpack 'Mofiqul/vscode.nvim'
Jetpack 'talha-akram/noctis.nvim'
call jetpack#end()
]])

local jetpack = require('jetpack')
for _, name in ipairs(jetpack.names()) do
  if not jetpack.tap(name) then
    jetpack.sync()
    break
  end
end
-- local config = vim.fn.split(vim.fn.glob(vim.fn.stdpath('config') .. '/lua/plugins/' .. '*.lua'))
-- for _, plg in ipairs(config) do
-- 	local ok, _ = pcall(require, 'plugins/' .. vim.fn.fnamemodify(plg, ':t:r'))
-- 	if not ok then
-- 		print(plg .. ' is not loaded.')
-- 	end
-- end
--Jetpack 'kassio/neoterm' "pwshでうまく動かない
