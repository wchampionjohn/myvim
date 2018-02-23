" PHP
if executable("php")
  autocmd BufRead,BufNewFile *.php set tabstop=4
  autocmd BufRead,BufNewFile *.php set shiftwidth=4
  autocmd BufRead,BufNewFile *.php map <F5> :% w !php<CR>
else
  autocmd BufRead,BufNewFile *.php map <F5> :echo "you need to install PHP first!"<CR>
endif
