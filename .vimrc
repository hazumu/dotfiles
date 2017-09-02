" ビープ音を鳴らさない
set vb t_vb=

" 自動コメントアウトを停止 set formatoptions-=ro
autocmd FileType * setlocal formatoptions-=ro 

set term=builtin_xterm
syntax on
set enc=utf-8 " vim 内部の文字コード（ブランクバッファの文字コードに影響） set fenc=utf-8 " デフォルトのファイル文字コード
set fencs=utf-8,iso-2022-jp,euc-jp,cp932 " 対応する文字コード
set langmenu=ja_JP.utf-8

"" 削除
set backspace=indent,eol,start " BS で indent, 改行, 挿入開始前の文字を削除
set smarttab " BS でインデント幅を削除

"" 検索
set hlsearch " 検索文字列を色づけ
set ignorecase " 大文字小文字を判別しない
set smartcase " でも大文字小文字が混ざって入力されたら区別する
set incsearch " インクリメンタルサーチ

"" バックアップ
set nobackup " ファイル上書きでバックアップファイルを作成

"" 表示
set background=dark " 背景が暗い指定（シンタックスの配色に影響）
syntax on " シンタックスの色づけ有効
set ruler " ルーラを表示
set showcmd " 入力中のコマンド（キー）を右下に表示
set showmatch " 括弧入力で対応する括弧を一瞬強調

set foldmethod=marker
set foldmarker=[[[{{{,}}}]]]
"タブの左側にカーソル表示
set listchars=tab:>\
set list
"タブ幅を設定する
set tabstop=2
set shiftwidth=2
set expandtab " tab を空白文字に置き換え

"ステータスラインを常に表示
set laststatus=2
"ステータスラインに文字コードと改行文字を表示する
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

"自動インデントを有効にする
:set autoindent

"補完
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
let g:AutoComplPop_NotEnableAtStartup = 1
hi Pmenu guibg=#666666
hi PmenuSel guibg=#8cd0d3 guifg=#666666
hi PmenuSbar guibg=#333333

" プラグインファイルの置き場所を追加する
" http://nanasi.jp/articles/howto/config/runtimepath.html
set runtimepath+=$HOME/.vim/runtime,$HOME/.vim/,$HOME/.vim,$HOME/.vim/runtime/syntax
" カーソル行をハイライト
set cursorline
" カレントウィンドウにのみ罫線を引く
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END

:hi clear CursorLine
:hi CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black

" neocomplcache
let g:neocomplcache_enable_at_startup = 1 " 起動時に有効化
" Use smartcase.
let g:NeoComplCache_SmartCase = 1
" Use camel case completion.
let g:NeoComplCache_EnableCamelCaseCompletion = 1
" Use underbar completion.
let g:NeoComplCache_EnableUnderbarCompletion = 1
" Set minimum syntax keyword length.
let g:NeoComplCache_MinSyntaxLength = 3
" Set manual completion length.
let g:NeoComplCache_ManualCompletionStartLength = 0
" Print caching percent in statusline.
let g:NeoComplCache_CachingPercentInStatusline = 1

" clevertab
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


" auto insert
" imap { {}<LEFT>
" imap [ []<LEFT>
" imap ( ()<LEFT>

" for JavaScript
" 上の括弧補完が邪魔している
map conl i<BS><CR>console.log();<Esc>lxhhha
map cond i<BS><CR>console.debug();<Esc>lxhhha

" USキーボード用マッピング
nmap ; :

" dein設定
if &compatible
  set nocompatible
endif

set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin('~/vim')

call dein#add('~/vim')
call dein#add('Shougo/neocomplete.vim')
call dein#add('mattn/emmet-vim')
call dein#add('Shougo/unite.vim')
call dein#add('scrooloose/nerdtree')
call dein#add('tpope/vim-fugitive')
call dein#add('Yggdroot/indentLine')
call dein#add('terryma/vim-multiple-cursors')
call dein#end()

filetype plugin indent on

" nerdtree設定
autocmd vimenter * NERDTree

