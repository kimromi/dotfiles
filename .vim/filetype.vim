augroup filetypedetect
  au BufRead,BufNewFile *.rb setfiletype ruby
  au BufRead,BufNewFile *.cap setfiletype ruby
  au BufRead,BufNewFile *.php setfiletype php
  au BufRead,BufNewFile *.vue setlocal tabstop=2 softtabstop=2 shiftwidth=2
  au BufRead,BufNewFile *.js setfiletype javascript
  au BufRead,BufNewFile *.js setlocal tabstop=2 softtabstop=2 shiftwidth=2
  au BufRead,BufNewFile *.coffee setlocal tabstop=2 softtabstop=2 shiftwidth=2
  au BufRead,BufNewFile *.yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2
  au BufRead,BufNewFile *.yml setlocal tabstop=2 softtabstop=2 shiftwidth=2
  au BufRead,BufNewFile *.scss setlocal tabstop=2 softtabstop=2 shiftwidth=2
  au BufRead,BufNewFile *.css setlocal tabstop=2 softtabstop=2 shiftwidth=2
  au BufRead,BufNewFile *.html setlocal tabstop=2 softtabstop=2 shiftwidth=2
  au BufRead,BufNewFile *.ts setfiletype typescript
  au BufRead,BufNewFile *.ts setlocal tabstop=2 softtabstop=2 shiftwidth=2
  au BufRead,BufNewFile *.json setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

autocmd BufRead,BufNewFile *.slim setfiletype slim
