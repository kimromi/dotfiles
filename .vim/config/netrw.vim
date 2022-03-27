"netrw
nnoremap <C-f> :Ex<CR>
let g:netrw_banner=0 "ヘッダを非表示
let g:netrw_list_hide= '.git'
let g:netrw_bufsettings = 'number'
function! NetrwMapping()
  " hで一つ上のディレクトリへ
  nmap <buffer> h -^
  " lで一つ下のディレクトリへ
  nmap <buffer> l <CR>
  " rでリネーム
  nmap <buffer> r R
  " Nでファイル作成
  nmap <buffer> N %^
  " ddでファイル削除
  nmap <buffer> dd D
endfunction
augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup END

