" Ruby
if executable("ruby")
  autocmd BufRead,BufNewFile *.rb map <F5> :% w !ruby -w<CR>
else
  autocmd BufRead,BufNewFile *.rb map <F5> :echo "you need to install Ruby first!"<CR>
endif
map <F6> :!bundle exec rspec<CR>
imap <S-j> <CR><CR>end<Esc>-cc
