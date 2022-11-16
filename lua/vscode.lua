vim.o.autochdir = true
vim.o.clipboard="unnamed"
vim.g.mapleader=" "
vim.o.showmatch=true --括弧のジャンプ
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.scrolloff=10
vim.o.sidescroll=1
--[[検索設定]]
vim.o.ignorecase=true --検索において大文字・小文字の区別をなくす
vim.o.smartcase=true --大文字で検索した場合は区別をonに
vim.o.wrapscan=true --検索で最後の行に来た後に初めに戻る
vim.o.hlsearch=true --検索結果をハイライトする
vim.o.incsearch=true --パターン入力中にも検索をする
-- NOTE: autogroupが設定されているプラグインは自動読み込みなのでそのエラーを消すために読み込む
vim.cmd[[
packadd vim-jetpack
call jetpack#begin(stdpath('data') . '/plugs/')
Jetpack 'tani/vim-jetpack', {'opt':1}
Jetpack 'tpope/vim-surround'
Jetpack 'nvim-treesitter/nvim-treesitter', {'do':':TSUpdate'} " WARN: 
Jetpack 'nvim-telescope/telescope.nvim' " WARN: 
Jetpack 'nvim-telescope/telescope-fzf-native.nvim',{'do':'make'} " WARN: 
Jetpack 'nvim-telescope/telescope-ui-select.nvim' " WARN: 
Jetpack 'jvgrootveld/telescope-zoxide' " WARN: 
Jetpack 'hrsh7th/nvim-cmp' " WARN: 
" FIXME: nvim-treeはキーマップの設定が残っているので消したい
call jetpack#end()
]]
vim.cmd[[
xmap gc <Plug>VSCodeCommentary
nmap gc <Plug>VSCodeCommentary
omap gc <Plug>VSCodeCommentary
nmap gcc <Plug>VSCodeCommentaryLine
]]
local opts = {noremap = true, silent = true}
vim.keymap.set("n","<leader>f","<Cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>",opts)
vim.keymap.set("n","<leader>b","<Cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>",opts)
vim.keymap.set("n","?","<Cmd>call VSCodeNotify('workbench.action.quickOpenWithModes')<CR>",opts)
vim.keymap.set("n","<c-t>","<Cmd>call VSCodeNotify('terminal.toggleVisibility')<CR>",opts)
vim.keymap.set("n","<Esc><Esc>","<Cmd>nohlsearch<CR>",opts)
