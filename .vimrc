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

" スワップファイルを作らない
set noswapfile

" カーソルを行頭、行末で止まらないようにする
" 動作してない？
set whichwrap=b,s,h,l,<,>,[,]

" 編集中でも他のファイルを開けるようにする
set hidden

" 他で変更されたら自動で読み込む
set autoread
augroup vimrc-checktime
  autocmd!
  autocmd WinEnter * checktime
augroup END

" BSが効かない場合の対処
set backspace=indent,eol,start

"スクロール時の余白を確保
set scrolloff=8

" ビープを消す
set visualbell

" 折りたたみON
" set foldmethod=syntax

" yankしたらクリップボードにコピー
set clipboard+=autoselect

" カレント行をハイライト
set cursorline
highlight CursorLine term=reverse cterm=none

set tabstop=2

" 新規作成時のテンプレートの設定
autocmd BufNewFile *.rb 0r ~/.vim/templates/rb.tpl
autocmd BufNewFile *.sh 0r ~/.vim/templates/sh.tpl

" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge

" 色を変更
" http://d.hatena.ne.jp/kattton/20110425/1303746056
" tmuxを使う場合はオフにしないと色がでない
set t_Co=256
"colorscheme desert
colorscheme molokai
"colorscheme zenburn
"colorscheme dw_blue

"" キーマップ関連
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

" カンマの後ろにスペースを付与
inoremap , ,<Space>


" 0で行頭、9で行末
nmap 0 ^
nmap 9 $

vnoremap 0 ^
vnoremap 9 $

" innsert mode での移動
inoremap  <C-e> <END>
inoremap  <C-a> <HOME>
" インサートモードでもhjklで移動
" inoremap <C-j> <Down>
" inoremap <C-k> <Up>
" inoremap <C-h> <Left>
" inoremap <C-l> <Right>

" ビジュアルモードで選択した内容を検索
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g')<CR><CR>

" 折りたたみ
set foldmethod=syntax
set foldlevel=100

" Vundleの設定開始
" http://vim-users.jp/2011/04/hack215/
set nocompatible
filetype off

" Vundle
set rtp+=~/.vim/vundle/vundle.git/
call vundle#rc()

" http://vim-users.jp/2011/04/hack215/
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neocomplcache-snippets-complete'
" 英語を補完
"Bundle 'neco-look'

" vimshellを使うにはvimprocが必要
" またvimprocは~/.vim/bundle/vimproc/make -f make_gcc.makeを
" 実行してproc.soを生成する必要がある
Bundle 'Shougo/vimshell'
Bundle 'Shougo/vimproc'

" バッファなども扱えるファイラ的なの
Bundle 'Shougo/unite.vim'
Bundle 'thinca/vim-ref'

" 編集中のファイルを実行
""Bundle 'thinca/vim-quickrun'
Bundle 'git://github.com/tokorom/vim-quickrun.git'

" Ruby関連
" Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-haml'
Bundle 'bundler'

" vim-railsでプロジェクト表示など
Bundle 'The-NERD-tree'

" コメント切替
Bundle 'The-NERD-Commenter'
" http//nanasi.jp/articles/vim/enhancedcommentify_vim.html

" 自動で括弧を閉じる
Bundle 'AutoClose'
Bundle 'git://github.com/Townk/vim-autoclose.git'
" マークダウンを色付け
Bundle 'Markdown'

" Yankの履歴をたどれるようにする
Bundle 'YankRing.vim'

" メモ取り
Bundle 'glidenote/memolist.vim'

" == などの入力補助
Bundle 'smartchr'

" 単語単位の移動をいい感じにする
Bundle 'smartword'

" 関連するファイルを開く
Bundle 'git://github.com/kana/vim-altr.git'

" 対応するカッコの表示を強化
Bundle 'matchit.zip'

" Rubyのリファクタリング
" Bundle 'git://github.com/ecomba/vim-ruby-refactoring.git'

" XMLRPCなどを実行する
Bundle 'mattn/webapi-vim'

" DBを操作
Bundle 'mattn/vdbi-vim'

" gitを操作
Bundle 'git://github.com/tpope/vim-fugitive.git'

" coffee-script
" Bundle 'git://github.com/kchmck/vim-coffee-script.git'
Bundle 'kchmck/vim-coffee-script'

" less
Bundle 'git://github.com/groenewege/vim-less.git'

" zendocing
Bundle 'ZenCoding.vim'

" 複数プロセス間でのyankをできるようにする
Bundle 'yanktmp.vim'

" cssで色を表示
" 要設定
" Bundle 'css_color.vim'

" helpをuniteで検索、:Unite help
Bundle 'git://github.com/tsukkee/unite-help.git'

" jQueryなどのリファレンスを参照
" Bundle 'git://github.com/soh335/vim-ref-jquery.git'
Bundle 'git://github.com/mojako/ref-sources.vim.git'

" Vundleの設定終了
filetype plugin on
filetype indent on

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
"
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_force_overwrite_completefunc = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
" let g:neocomplcache_dictionary_filetype_lists = {
   " \ 'default' : '',
   " \ 'vimshell' : $HOME.'/.vimshell_hist'
   " \ }

" let g:neocomplcache_dictionary_filetype_lists = {
   " \ 'default' : '',
   " \ 'ruby' : $HOME.'/.vim/dict/objc.dict'
   " \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown,eruby setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.coffee = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

" neocmplcashe
" Tabで補完
" http://d.hatena.ne.jp/famnet/20110619/install_neocmplcache_vim_plugin
" let g:neocomplcache_enable_at_startup = 1
" function InsertTabWrapper()
		" if pumvisible()
				" return "\<c-n>"
		" endif
		" let col = col('.') - 1
		" if !col || getline('.')[col - 1] !~ '\k\|<\|/'
			" return "\<tab>"
		" elseif exists('&omnifunc') && &omnifunc == ''
			" return "\<c-n>"
		" else
			" return "\<c-x>\<c-o>"
		" endif
" endfunction
" inoremap <tab> <c-r>=InsertTabWrapper()<cr>

" RSenseでオムニ補完を使う
" http://cx4a.org/software/rsense/index.ja.html#.E6.9C.80.E6.96.B0.E5.AE.89.E5.AE.9A.E6.9D.BF__v0.3_
" let g:rsenseHome = "/opt/rsense-0.3"
" if !exists('g:neocomplcache_omni_patterns')
	" let g:neocomplcache_omni_patterns = {}
" endif
" let g:rsenseUseOmniFunc = 1
" if filereadable(expand('/opt/rsense-0.3/bin/rsense'))
        " let g:rsenseHome = expand('/opt/rsense-0.3')
        " let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
" endif

" スニペット
let g:neocomplcache_snippets_dir = '~/.vim/snipetts/'
imap <C-k> <Plug>(neocomplcache_snippets_expand)
smap <C-k> <Plug>(neocomplcache_snippets_expand)

" quickrun
" 実行結果を下、または右に表示する
let g:quickrun_config = {}
let g:quickrun_config={'*': {'split': ''}}
set splitbelow
set splitright
""set g:quickrun_config={}

" rspec用quickrun
""let g:quickrun_config['ruby.rspec'] = {'command': 'rspec', 'cmdopt': '-c --format progress -I .', 'exec': ['bundle exec %c %o %s %a'], 'output_filetype': 'rspec-result'}
" let g:quickrun_config['ruby.rspec'] = {'command': 'rspec', 'cmdopt': '', 'output_filetype': 'rspec-result'}

""let g:quickrun_config['ruby.rspec'] = {'command': 'rspec'}
" augroup RSpec
  " autocmd!
  " autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
" augroup END

" NERD_commenter
" コメントの後ろにスペースを付与
let NERDSpaceDelims = 1
" ,, でコメント切替
nmap ,, <Plug>NERDCommenterToggle
vmap ,, <Plug>NERDCommenterToggle

" YankRing
" これを設定しないとペーストしたときに落ちる
let g:yankring_manual_clipboard_check = 0

" Unite
" http://d.hatena.ne.jp/ruedap/20110117/vim_unite_plugin_1_wee
let g:unite_enable_start_insert = 1
" http://d.hatena.ne.jp/basyura/20100622/p1
" 先頭候補を自動で選択
" let g:neocomplcache_enable_auto_select  =  1
" Enterキー押下時、候補選択中だったら選択確定、そうでなければ改行
inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "<CR>"

" インサート／ノーマルどちらからでも呼び出せるようにキーマップ
nnoremap <silent> <C-f> :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
inoremap <silent> <C-f> <ESC>:<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> <C-b> :<C-u>Unite buffer file_mru<CR>
inoremap <silent> <C-b> <ESC>:<C-u>Unite buffer file_mru<CR>

"" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
"" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
"" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
"" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
"
"" http://d.hatena.ne.jp/ruedap/20110117/vim_unite_plugin_1_week
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
        " 単語単位からパス単位で削除するように変更
        imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
        " ESCキーを2回押すと終了する
        nmap <silent><buffer> <ESC><ESC> q
        imap <silent><buffer> <ESC><ESC> <ESC>q
endfunction

" ref-sources
let g:ref_alc2_overwrite_alc = 1
" jquery doc
let g:ref_jquery_doc_path = $HOME. '/doc/jqapi/'
" 結果に合わせて、開かれるウインドウの縦サイズを調節します。
" let g:ref_auto_resize = 1
" wikipedia に加え、英語版で検索する為の wikipedia_en が登録されます。
let g:ref_wikipedia_lang = ['ja', 'en']
" キャッシュを有効にする
let g:ref_use_cache = 1

" smartchr
autocmd FileType ruby,coffee inoremap <buffer> <expr> = smartchr#one_of(' = ',  ' == ',  ' === ',  '=')
autocmd FileType haml inoremap <buffer> <expr> = smartchr#one_of('= ',  '=')
autocmd FileType ruby inoremap <buffer> <expr> + smartchr#one_of(' + ',  '+')
autocmd FileType ruby inoremap <buffer> <expr> - smartchr#one_of(' - ',  '-')
autocmd FileType coffee inoremap <buffer> <expr> - smartchr#one_of(' - ', ' ->', '-')
autocmd FileType ruby,coffee inoremap <buffer> <expr> # smartchr#one_of('# ',  '#{}', '#')

" autocmd FileType RUBY inoremap # #<Space>

" HTML、XML、ERBで自動でタグを閉じる
augroup MyXML
        autocmd!
        autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
        autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
        autocmd Filetype ERUBY inoremap <buffer> </ </<C-x><C-o>
augroup END

" vim-atlr
nmap gr <Plug>(altr-forward)
call altr#define('app/models/%.rb', 'spec/models/%_spec.rb')
call altr#define('app/controllers/%.rb', 'spec/controllers/%_spec.rb')
call altr#define('app/helpers/%.rb', 'spec/helpers/%_spec.rb')
call altr#define('spec/routing/%_spec.rb', 'config/routes.rb')

"" smartword
"" if exists('g:loaded_smartword')
"  " map w <Plug>(smartword-w)
"  " map b <Plug>(smartword-b)
"  " map e <Plug>(smartword-e)
"  " map ge <Plug>(smartword-ge)
"  " noremap W w
"  " noremap B b
"  " noremap E e
"  " noremap gE ge
"" endif
"
"" ruby_refactoring
"" let g:ruby_refactoring_map_keys = 1
"
" vim-autoclose
let g:autoclose_on = 1
autocmd FileType ruby let b:AutoClosePairs = AutoClose#DefaultPairsModified("|", "")
" let g:AutoClosePairs_add = "|"

noremap <Leader>t :vimgrep /TODO/j **/*.rb **/*.js **/*.erb
autocmd QuickfixCmdPost vimgrep cw

noremap <CR> o<ESC>
noremap <S-CR> O<ESC>

" yanktmp
map <silent> sy :call YanktmpYank()<CR>
map <silent> sp :call YanktmpPaste_p()<CR>
map <silent> sP :call YanktmpPaste_P()<CR>

" fugitive
": カーソル下にあるファイルを edit
" -: カーソル下にあるファイルを git add
" p: カーソル下にあるファイルを git add -p
" D: カーソル下にあるファイルを git diff[ --cached]
" C: git commit
nnoremap <Space>gd :<C-u>Gdiff<Enter>
nnoremap <Space>gs :<C-u>Gstatus<Enter>
nnoremap <Space>gl :<C-u>Glog<Enter>
nnoremap <Space>ga :<C-u>Gwrite<Enter>
nnoremap <Space>gc :<C-u>Gcommit<Enter>
nnoremap <Space>gC :<C-u>Git commit --amend<Enter>
nnoremap <Space>gb :<C-u>Gblame<Enter>

