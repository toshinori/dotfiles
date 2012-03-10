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

" http://blog.appling.jp/archives/140
" ESCキー2度押しでハイライトを消す
nnoremap <Esc><Esc> :<C-u>set nohlsearch<Return>
nnoremap / :<C-u>set hlsearch<Return>/
nnoremap ? :<C-u>set hlsearch<Return>?
nnoremap * :<C-u>set hlsearch<Return>*
nnoremap # :<C-u>set hlsearch<Return>#"

" コロンセミコロン入れ変え
noremap ; : 
noremap : ;

"スクロール時の余白を確保
set scrolloff=5

" 自動でカッコを閉じる
" http://d.hatena.ne.jp/spiritloose/20061113/1163401194　
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
vnoremap { "zdi^V{<C-R>z}<ESC>
vnoremap [ "zdi^V[<C-R>z]<ESC>
vnoremap ( "zdi^V(<C-R>z)<ESC>
vnoremap " "zdi^V"<C-R>z^V"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>

" 色を変更
" http://d.hatena.ne.jp/kattton/20110425/1303746056
set t_Co=256
colorscheme desert

" カレント行をハイライト 
set cursorline
highlight CursorLine term=reverse cterm=none

" Vundleの設定開始
" http://vim-users.jp/2011/04/hack215/
set nocompatible
filetype off

set rtp+=~/.vim/vundle/vundle.git/
call vundle#rc()

" Vundle
" http://vim-users.jp/2011/04/hack215/
Bundle 'Shougo/neocomplcache'
" Bundle 'Shougo/vimshell'
Bundle 'Shougo/unite.vim'
" Bundle 'unite.vim'
Bundle 'thinca/vim-ref'
Bundle 'thinca/vim-quickrun'
Bundle 'vim-ruby/vim-ruby'
" Bundle 'guicolorscheme.vim'
Bundle 'tpope/vim-rails' 

" Vundleの設定終了
filetype plugin on

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

" https://github.com/Shougo/unite.vim/blob/master/doc/unite.jax
" Unite

" 新規作成時のテンプレートの設定
autocmd BufNewFile *.rb 0r ~/.vim/templates/rb.tpl
autocmd BufNewFile *.sh 0r ~/.vim/templates/sh.tpl

" 挿入モードで開始
" let g:unite_enable_start_insert = 1



