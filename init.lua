if vim.g.vscode then
	require("vscode")
else
	require('os') --OSによる設定の分岐を読み込む
	require('keymaps') --まずキーマップを読み込む
	require('plugins') --プラグインを読み込む
	require('colorscheme') --カラースキームを読み込む
	require('utils') --その他の設定を読み込む

	--[[表示設定]]
	vim.wo.number = true
	vim.o.title = true
	vim.o.showmatch = true --括弧のジャンプ
	vim.o.visualbell = false
	vim.o.laststatus = 3 --ステータスバーの表示
	vim.o.wildmenu = true
	vim.o.wildoptions = 'pum' --ノーマルモードの補完表示方法
	vim.o.showcmd = true
	vim.wo.foldmethod = "diff"
	vim.wo.cursorline = true
	vim.o.completeopt = "menu,menuone,noselect"
	vim.o.splitright = true;
	vim.o.splitbelow = true;
	vim.o.pumblend = 13
	vim.o.winblend = 10
	vim.o.helplang = 'ja'

	--[[文字、カーソル設定]]
	--vim.o.ambiwidth=double --全角文字の表示。vim-airlineの表記が崩れるので無効
	vim.bo.fileencoding = 'utf-8'
	vim.o.tabstop = 4
	vim.o.shiftwidth = 4
	vim.bo.autoindent = true
	vim.bo.smartindent = true
	vim.o.list = true --tabやスペースを表示する
	vim.o.listchars = 'tab:»―,trail:_,eol:↲,extends:»,precedes:«,nbsp:%' --改行文字やtabなどを表示
	vim.o.whichwrap = 'b,s,h,l,<,>,[,],~' --行末/行頭からの移動で次行/前行に行く移動
	vim.wo.wrap = false
	vim.o.backspace = 'indent,eol,start'
	vim.o.autochdir = false

	vim.o.scrolloff = 10
	vim.o.sidescroll = 1
	vim.bo.textwidth = 0
	vim.o.clipboard = 'unnamed,unnamedplus'
	vim.bo.fixendofline = false

	--[[検索設定]]
	vim.o.ignorecase = true --検索において大文字・小文字の区別をなくす
	vim.o.smartcase = true --大文字で検索した場合は区別をonに
	vim.o.wrapscan = true --検索で最後の行に来た後に初めに戻る
	vim.o.hlsearch = true --検索結果をハイライトする
	vim.o.incsearch = true --パターン入力中にも検索をする

	--[[マウス設定]]
	vim.o.mouse = 'a' --マウスのサポート
	if vim.fn.has('gui') == 1 then
		vim.o.guioptions = '+a' --gui版でのみ有効
	end
	vim.o.history = 1000 --コマンドの履歴保存

	--[[設定]]
	vim.o.hidden = true --バッファを未保存で移動しても警告を出さない bufferline.vimにて移動するために序盤に読み込む
	vim.o.swapfile = false --swapファイルを作らない
end
