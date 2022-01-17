--[[windowsのターミナル設定]]
if vim.fn.has("win32") then
	vim.o.shell='pwsh'
	vim.o.shellcmdflag='-c'
	vim.o.shellquote="\""
	vim.o.shellxquote=''
end

require('plug')--まずプラグインを読み込む
require('nvim-lsp')--lsp設定の読み込み
require('nvim-cmp')--lspなどの補完読み込み
require('keymaps')--キーマップを読み込む

local config = vim.fn.split(vim.fn.glob('~/AppData/Local/nvim/lua/config/' .. '*.lua'))
for _,cfg in ipairs(config) do
	require('config/'.. vim.fn.fnamemodify(cfg,':t:r'))
	print(cfg .. ' loaded.')
end	

local keymaps = vim.fn.split(vim.fn.glob('~/AppData/Local/nvim/lua/keymaps/' .. '*.lua'))
for _,kmp in ipairs(keymaps) do
	require('keymaps/'.. vim.fn.fnamemodify(kmp,':t:r'))
	print(kmp .. ' loaded.')
end	


--[[python設定]]
vim.g.python3_host_prog = [[E:\Program Files (x86)\Python\Python38\python.EXE]]

--[[neovide設定]]
if vim.g.neovide == true then
	vim.o.guifont=[[HackGenNerd Console:h13:cSHIFTJIS]]
	vim.o.pumblend=20 --PopUpMenuの透過設定
	vim.g.neovide_transparency=0.9
	vim.g.neovide_remember_window_size = true
end


--[[表示設定]]
vim.wo.number=true
vim.o.title=true
vim.o.showmatch=true --括弧のジャンプ
vim.o.visualbell=false
vim.o.laststatus=2 --ステータスバーの表示
vim.o.wildmenu=true
vim.o.wildoptions='pum' --ノーマルモードの補完表示方法
vim.o.showcmd=true
vim.wo.foldmethod="indent"
vim.wo.cursorline=true
vim.o.completeopt = "menu,menuone,noselect"
vim.o.splitright = true;
vim.o.pumblend = 13;
vim.o.winblend = 10;

--[[文字、カーソル設定]]
vim.o.hidden=true --バッファを未保存で移動しても警告を出さない
--vim.o.ambiwidth=double --全角文字の表示。vim-airlineの表記が崩れるので無効
vim.bo.fileencoding='utf-8'
-- vim.b.tabstop=4 --tabのスペース表現の数
-- vim.b.shiftwidth=4 --インデントに使うスペースの数
vim.cmd('set tabstop=4')
vim.cmd('set shiftwidth=4')
vim.bo.autoindent=true
vim.bo.smartindent=true
vim.o.list=true --tabやスペースを表示する
vim.o.listchars='tab:»-,trail:_,eol:↲,extends:»,precedes:«,nbsp:%'--改行文字やtabなどを表示
vim.o.whichwrap='b,s,h,l,<,>,[,],~' --行末/行頭からの移動で次行/前行に行く移動
vim.o.backspace='indent,eol,start'
vim.o.autochdir=true

vim.o.scrolloff=8
vim.o.sidescroll=16
vim.bo.textwidth=0
vim.o.clipboard='unnamed,unnamedplus'
vim.bo.fixendofline=false

--[[検索設定]]
vim.o.ignorecase=true --検索において大文字・小文字の区別をなくす
vim.o.smartcase=true --大文字で検索した場合は区別をonに
vim.o.wrapscan=true --検索で最後の行に来た後に初めに戻る
vim.o.hlsearch=true --検索結果をハイライトする
vim.o.incsearch=true --パターン入力中にも検索をする

--[[マウス設定]]
vim.o.mouse='a' --マウスのサポート
vim.o.guioptions='+a' --gui版でのみ有効
vim.o.history=1000 --コマンドの履歴保存

--[[設定]]
vim.o.swapfile=false--swapファイルを作らない
