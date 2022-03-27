set backupdir=$HOME/.vimbackup   "バックアップファイルのディレクトリを指定する
set clipboard=unnamed,autoselect "yankでクリップボードと連携
set nocompatible                 "vi互換をオフする
set directory=~/.vimbackup       "スワップファイル用のディレクトリを指定する
set hidden                       "変更中のファイルでも、保存しないで他のファイルを表示する
set incsearch                    "インクリメンタルサーチを行う
set ignorecase                   "大文字小文字を区別しない
set number                       "行番号を表示する
set showmatch                    "閉括弧が入力された時、対応する括弧を強調する
set noswapfile                   "スワップファイル作らない
set backspace=indent,eol,start   "バックスペースキーで削除できるようにする
set display=lastline             "文字数が長いファイルでも表示する

filetype plugin indent on
syntax enable
colorscheme desert

"タブ作成/閉じる/移動
nnoremap <silent> <C-t> :tabnew<CR>:Ex<CR>
nnoremap <silent> <C-w> :q<CR>
nnoremap <silent> <C-h> :tabprevious<CR>
nnoremap <silent> <C-l> :tabnext<CR>

runtime! config/*.vim
