"dein.vim Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif
set runtimepath+=$HOME/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin('$HOME/.vim/dein')

call dein#add('Shougo/dein.vim')

call dein#end()

if dein#check_install()
  call dein#install()
endif
"End dein.vim Scripts-------------------------
