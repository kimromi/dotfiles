augroup filetypedetect
  au BufRead,BufNewFile *.rb setfiletype ruby
  au BufRead,BufNewFile *.php setfiletype php
  au BufRead,BufNewFile *.vue setlocal tabstop=2 softtabstop=2 shiftwidth=2
  au BufRead,BufNewFile *.js setlocal tabstop=2 softtabstop=2 shiftwidth=2
  au BufRead,BufNewFile *.yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2
  au BufRead,BufNewFile *.yml setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

