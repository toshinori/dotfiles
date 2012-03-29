" バックアップを作成しない
set nobackup
" 文字コードを UTF-8 に設定
set encoding=utf-8

" ファイル読み込み時の文字コード検索順
set fileencodings=utf-8,ucs-bom,euc-jp,cp932,iso-2022-jp
set fileencodings+=,ucs-2le,ucs-2

" ステータスラインの表示内容を設定
set statusline=%F%m%r%h%w\%=[TYPE=%Y]\[FORMAT=%{&ff}]\[ENC=%{&fileencoding}]\[LOW=%l/%L]

" 行番号表示
set number

"ステータスは常に2行
set laststatus=2

" シンタックスハイライトON
syntax on

" 対応するカッコを表示
set showmatch

" if文などでインデント
set cindent

" 検索結果をハイライト表示
set hlsearch

" インクリメンタルサーチ
set incsearch

" 大文字小文字を区別しない
set ignorecase

" 検索で小文字なら大文字を無視、大文字なら無視しない設定
set smartcase

" タブをスペースに変換
set expandtab

" http://blog.appling.jp/archives/140
" ESCキー2度押しでハイライトを消す
nnoremap <Esc><Esc> :<C-u>set nohlsearch<Return>
nnoremap / :<C-u>set hlsearch<Return>/
nnoremap ? :<C-u>set hlsearch<Return>?
nnoremap * :<C-u>set hlsearch<Return>*
nnoremap # :<C-u>set hlsearch<Return>#"

""set noimdisable
""set iminsert=0 imsearch=0
""set noimcmdline
""inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>

" コロンセミコロン入れ変え
noremap ; :
noremap : ;

"" カンマの後ろにスペースを付与
inoremap , ,<Space>

"スクロール時の余白を確保
set scrolloff=5

" 自動でカッコを閉じる
" AutoCloseに移行
" http://d.hatena.ne.jp/spiritloose/20061113/1163401194　
"inoremap { {}<LEFT>
"inoremap [ []<LEFT>
"inoremap ( ()<LEFT>
"inoremap " ""<LEFT>
"inoremap ' ''<LEFT>
"vnoremap { "zdi^V{<C-R>z}<ESC>
"vnoremap [ "zdi^V[<C-R>z]<ESC>
"vnoremap ( "zdi^V(<C-R>z)<ESC>
"vnoremap " "zdi^V"<C-R>z^V"<ESC>
"vnoremap ' "zdi'<C-R>z'<ESC>

" 色を変更
" http://d.hatena.ne.jp/kattton/20110425/1303746056
" tmuxを使う場合はオフにしないと色がでない
"set t_Co=256
"colorscheme desert
colorscheme molokai
"colorscheme zenburn
"colorscheme dw_blue

" カレント行をハイライト
set cursorline
highlight CursorLine term=reverse cterm=none

" Vundleの設定開始
" http://vim-users.jp/2011/04/hack215/
set nocompatible
filetype off

" Vundle
set rtp+=~/.vim/vundle/vundle.git/
call vundle#rc()

" http://vim-users.jp/2011/04/hack215/
Bundle 'Shougo/neocomplcache'
" vimshellを使うにはvimprocが必要
" またvimprocは~/.vim/bundle/vimproc/make -f make_gcc.makeを
" 実行してproc.soを生成する必要がある
Bundle 'Shougo/vimshell'
Bundle 'Shougo/vimproc'
Bundle 'Shougo/unite.vim'
Bundle 'thinca/vim-ref'
Bundle 'thinca/vim-quickrun'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-haml'
Bundle 'The-NERD-tree'
Bundle 'The-NERD-Commenter'
" http//nanasi.jp/articles/vim/enhancedcommentify_vim.html
Bundle 'EnhCommentify.vim'
Bundle 'AutoClose'
Bundle 'Markdown'
Bundle 'YankRing.vim'
Bundle 'glidenote/memolist.vim'

" Vundleの設定終了
filetype plugin on
filetype indent on

" neocmplcashe
" Tabで補完
" http://d.hatena.ne.jp/famnet/20110619/install_neocmplcache_vim_plugin
let g:neocomplcache_enable_at_startup = 1
function InsertTabWrapper()
		if pumvisible()
				return "\<c-n>"
		endif
		let col = col('.') - 1
		if !col || getline('.')[col - 1] !~ '\k\|<\|/'
			return "\<tab>"
		elseif exists('&omnifunc') && &omnifunc == ''
			return "\<c-n>"
		else
			return "\<c-x>\<c-o>"
		endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

" RSenseでオムニ補完を使う
" http://cx4a.org/software/rsense/index.ja.html#.E6.9C.80.E6.96.B0.E5.AE.89.E5.AE.9A.E6.9D.BF__v0.3_
let g:rsenseHome = "/opt/rsense-0.3"
if !exists('g:neocomplcache_omni_patterns')
	let g:neocomplcache_omni_patterns = {}
endif
let g:rsenseUseOmniFunc = 1
if filereadable(expand('/opt/rsense-0.3/bin/rsense'))
	let g:rsenseHome = expand('/opt/rsense-0.3')
	let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
endif

" quickrun
" 実行結果を下、または右に表示する
let g:quickrun_config={'*': {'split': ''}}
set splitbelow
set splitright

"" NERD_commenter
"" コメントの後ろにスペースを付与
let NERDSpaceDelims = 1

" YankRing
let g:yankring_manual_clipboard_check = 0

" https://github.com/Shougo/unite.vim/blob/master/doc/unite.jax
" Unite
" バッファ一覧
"nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
"noremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>

" Unite
" http://d.hatena.ne.jp/ruedap/20110117/vim_unite_plugin_1_wee
let g:unite_enable_start_insert = 1

" インサート／ノーマルどちらからでも呼び出せるようにキーマップ
nnoremap <silent> <C-f> :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
inoremap <silent> <C-f> <ESC>:<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> <C-b> :<C-u>Unite buffer file_mru<CR>
inoremap <silent> <C-b> <ESC>:<C-u>Unite buffer file_mru<CR>

" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

" 新規作成時のテンプレートの設定
autocmd BufNewFile *.rb 0r ~/.vim/templates/rb.tpl
autocmd BufNewFile *.sh 0r ~/.vim/templates/sh.tpl

" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge

" ビープを消す
set visualbell

" HTML、XML、ERBで自動でタグを閉じる
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype eruby inoremap <buffer> </ </<C-x><C-o>
augroup END

