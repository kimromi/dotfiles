" NeoBundle 
if has('vim_starting')
   set nocompatible
   " neobundle をインストールしていない場合は自動インストール
   if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
      echo "install neobundle..."
      " vim からコマンド呼び出しているだけ neobundle.vim のクローン
      :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
   endif
   " runtimepath の追加は必須
   set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle'))
let g:neobundle_default_git_protocol='https' 

NeoBundleFetch 'Shougo/neobundle.vim'

" Emmet
NeoBundle 'mattn/emmet-vim'
let g:user_emmet_expandabbr_key='<F12>'

" vim filer
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimproc'
 
" Markdown syntax
NeoBundle 'godlygeek/tabular'
NeoBundle 'joker1007/vim-markdown-quote-syntax'
NeoBundle 'rcmdnk/vim-markdown'
let g:vim_markdown_folding_disabled=1     " 折りたたみなし
let g:vimfiler_safe_mode_by_default = 0   " ファイル操作を可能にする

" surround
NeoBundle 'tpope/vim-surround'

" neocomplete-php
NeoBundle 'violetyk/neocomplete-php.vim'
let g:neocomplete_php_locale = 'ja'

" vim-ref
NeoBundle 'thinca/vim-ref'

" vimrc に記述されたプラグインでインストールされていないものがないかチェックする
NeoBundleCheck
call neobundle#end()
filetype plugin indent on

"--------------------
" 基本的な設定
"--------------------

set autoindent                   "新しい行のインデントを現在行と同じにする
set backupdir=~/other/vimbackup  "バックアップファイルのディレクトリを指定する
set clipboard=unnamed            "クリップボードをWindowsと連携する
set nocompatible                 "vi互換をオフする
set directory=~/other/vimbackup  "スワップファイル用のディレクトリを指定する
set expandtab                    "タブの代わりに空白文字を指定する
set hidden                       "変更中のファイルでも、保存しないで他のファイルを表示する
set incsearch                    "インクリメンタルサーチを行う
set ignorecase                   "大文字小文字を区別しない
set number                       "行番号を表示する
set showmatch                    "閉括弧が入力された時、対応する括弧を強調する
set smarttab                     "新しい行を作った時に高度な自動インデントを行う

" grep検索を設定する
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh

" 検索結果のハイライトをEsc連打でクリアする
nnoremap <ESC><ESC> :nohlsearch<CR>

" vim filer
nnoremap <C-f> :VimFiler -split -simple -winwidth=35 -no-quit<CR>

" シンタックスに色をつける
syntax on

" 文字コード指定        
set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac

" markdownのハイライトを有効にする
set syntax=markdown

" カラー設定
syntax enable
set background=dark
colorscheme solarized
let g:solarized_termcolors=256

" C-nでファイル間の移動
nmap <silent> <C-n> <ESC>:update<CR>:bn<CR>
imap <silent> <C-n> <ESC>:update<CR>:bn<CR>
vmap <silent> <C-n> <ESC>:update<CR>:bn<CR>
cmap <silent> <C-n> <ESC>:update<CR>:bn<CR>

:silent !<command>

" PHP
let php_sql_query = 1
let php_baselib = 1
let php_htmlInStrings = 1
let php_noShortTags = 1
let php_parent_error_close = 1
let g:sql_type_default='mysql'

let g:ref_cache_dir=$HOME.'/.vim/vim-ref/cache'
let g:ref_phpmanual_path=$HOME.'/.vim/vim-ref/php-chunked-xhtml'
