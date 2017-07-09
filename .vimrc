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

NeoBundle 'KazuakiM/neosnippet-snippets'
NeoBundle 'KazuakiM/vim-qfstatusline'
NeoBundle 'Shougo/dein.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neoinclude.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-ref'
NeoBundle 'vim-scripts/taglist.vim'
NeoBundle 'osyo-manga/shabadou.vim'
NeoBundle 'osyo-manga/vim-watchdogs'
"NeoBundle 'scrooloose/syntastic'
NeoBundle 'altercation/vim-colors-solarized'

" Emmet
NeoBundle 'mattn/emmet-vim'
let g:user_emmet_expandabbr_key='<C-e>'

" vim filer
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimshell'

" Markdown syntax
NeoBundle 'godlygeek/tabular'
NeoBundle 'joker1007/vim-markdown-quote-syntax'
NeoBundle 'rcmdnk/vim-markdown'
let g:vim_markdown_folding_disabled=1     " 折りたたみなし
let g:vimfiler_safe_mode_by_default = 0   " ファイル操作を可能にする

" Markdown Preview
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
let g:vim_markdown_frontmatter = 1

" surround
NeoBundle 'tpope/vim-surround'

" neocomplete-php
NeoBundle 'violetyk/neocomplete-php.vim'
let g:neocomplete_php_locale = 'ja'

" neocomplete, neosnippet
NeoBundle "Shougo/neocomplete.vim"
NeoBundle "Shougo/neosnippet"
NeoBundle "Shougo/neosnippet-snippets"

" vim-ref(PHPマニュアル)
"NeoBundle 'thinca/vim-ref'
:
" gist-vim
"NeoBundle 'mattn/gist-vim', {'depends': 'mattn/webapi-vim'}
"let g:gist_api_url = 'https://git.pepabo.com/api/v3'

"vdebug
"NeoBundle 'joonty/vdebug'

"vim-go
NeoBundle 'fatih/vim-go'

"vim-github-browse
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'tyru/open-browser-github.vim'
let g:openbrowser_github_url_exists_check = 'ignore'
let g:openbrowser_github_always_used_branch = 'master'
:command OG OpenGithubFile

"NeoBundle 'editorconfig/editorconfig-vim'

"for vue
NeoBundle 'posva/vim-vue'
NeoBundle 'digitaltoad/vim-pug'

"for javascript
NeoBundle 'pangloss/vim-javascript'

"非同期構文チェック
NeoBundle 'w0rp/ale'
let g:ale_sign_column_always = 1   "左端のバーを出しっぱなしにする

"for ruby
" 自動でendをいれる
NeoBundle 'tpope/vim-endwise'

" vimrc に記述されたプラグインでインストールされていないものがないかチェックする
NeoBundleCheck
call neobundle#end()

filetype on
filetype plugin on
filetype indent on
set autoindent                   "新しい行のインデントを現在行と同じにする
set expandtab                    "タブの代わりに空白文字を指定する
set cindent
set smartindent                  "改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smarttab                     "新しい行を作った時に高度な自動インデントを行う

"--------------------
" 基本的な設定
"--------------------

set backupdir=$HOME/.vimbackup       "バックアップファイルのディレクトリを指定する
set clipboard=unnamed,autoselect "クリップボードをWindowsと連携する
set nocompatible                 "vi互換をオフする
set directory=~/.vimbackup       "スワップファイル用のディレクトリを指定する
set hidden                       "変更中のファイルでも、保存しないで他のファイルを表示する
set incsearch                    "インクリメンタルサーチを行う
set ignorecase                   "大文字小文字を区別しない
set number                       "行番号を表示する
set showmatch                    "閉括弧が入力された時、対応する括弧を強調する
set matchtime=1
set noswapfile                   "スワップファイル作らない
set backspace=indent,eol,start

" grep検索を設定する
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh

" 検索結果のハイライトをEsc連打でクリアする
nnoremap <ESC><ESC> :nohlsearch<CR>

" vim filer
nnoremap <C-f> :VimFiler<CR>

" シンタックスに色をつける
syntax on

" 文字コード指定
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,euc-jp
"set fileencodings=utf-8,euc-jp,shift_jis
"set fileformats=unix,dos,mac

" markdownのハイライトを有効にする
set syntax=markdown

" カラー設定
syntax enable
set t_Co=16
set background=dark
let g:solarized_termcolors=16
colorscheme solarized

" st タブ作成 sx タブ閉じる sn,sp タブ移動
nnoremap <silent> <C-t> :tabnew<CR>:VimFiler<CR>
nnoremap <silent> <C-w> :q<CR>
nnoremap <silent> <C-h> :tabNext<CR>
nnoremap <silent> <C-l> :tabnext<CR>

" PHP
let g:php_baselib       = 1
let g:php_htmlInStrings = 1
let g:php_noShortTags   = 1
let g:php_sql_query     = 1
let g:php_parent_error_close = 1
let g:sql_type_default='mysql'

" vim-ref用設定
let g:ref_cache_dir=$HOME.'/.vim/vim-ref/cache'
let g:ref_phpmanual_path=$HOME.'/.vim/vim-ref/php-chunked-xhtml'

" 行末の空白をハイライト
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

nnoremap + <C-a>
nnoremap - <C-x>

"------------------------------------------------------------
" * neocomplete
"------------------------------------------------------------

let g:neocomplete#enable_at_startup = 1 " 起動時に有効化
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_camel_case_completion = 0
let g:neocomplete#enable_underbar_completion = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3

" ポップアップの操作
inoremap <expr><c-l> pumvisible() ? neocomplete#close_popup()."\<Esc>" : "\<Esc>"
inoremap <expr><c-c> neocomplete#cancel_popup()
" Ctrl+j, k で候補を移動
inoremap <expr><c-j> pumvisible() ? "\<C-n>" : "\<c-j>"
inoremap <expr><c-k> pumvisible() ? "\<C-p>" : "\<c-k>"
" Ctrl+i or Tab でSnippetsを展開
imap <C-i> <Plug>(neosnippet_expand_or_jump)
smap <C-i> <Plug>(neosnippet_expand_or_jump)
" ポップアップ、タグが存在しない場合は通常のTabを入力
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
" スニペットファイル
let g:neosnippet#snippets_directory='~/.vim/snippets'

" 補完ポップアップのカラー設定
hi Pmenu ctermfg=7
hi Pmenu ctermbg=8
hi PmenuSel ctermbg=3
hi PmenuSbar ctermbg=0

" If php-cs-fixer is in $PATH, you don't need to define line below
" let g:php_cs_fixer_path = "~/php-cs-fixer.phar" " define the path to the php-cs-fixer.phar
let g:php_cs_fixer_config_file = '.php_cs'       " configuration file
let g:php_cs_fixer_php_path = "php"               " Path to PHP
let g:php_cs_fixer_enable_default_mapping = 1     " Enable the mapping by default (<leader>pcd)
let g:php_cs_fixer_dry_run = 0                    " Call command with dry-run option
let g:php_cs_fixer_verbose = 0                    " Return the output of command if 1, else an inline information.
nnoremap <silent><leader>pcd :call PhpCsFixerFixDirectory()<CR>
nnoremap <silent><leader>pcf :call PhpCsFixerFixFile()<CR>

set conceallevel=0
let g:vim_json_syntax_conceal = 0

let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_def_mapping_enabled = 0

"let g:syntastic_check_on_open = 1
"let g:syntastic_enable_signs = 1
"let g:syntastic_echo_current_error = 1
"let g:syntastic_auto_loc_list = 2
"let g:syntastic_enable_highlighting = 1
"" なんでか分からないけど php コマンドのオプションを上書かないと動かなかった
"let g:syntastic_php_php_args = '-l'
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

function Foo()
  echo "foo"
endfunction
