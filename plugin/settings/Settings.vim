set nocompatible                      " not compatible with the old-fashion vi mode
set backspace=2                       " allow backspacing over everything in insert nc >kkmode
set history=1000                      " keep 1000 lines of command line history
set undolevels=100
set ruler                             " show the cursor position all the time
set autoread                          " auto read when file is changed from outside
set wrap
set linebreak
set nolist
set hidden
set linespace=0
set cursorline
set nofoldenable
set number
set numberwidth=4
set title
set showmode
set nobomb                            " no BOM(Byte Order Mark)
set nostartofline
set laststatus=2
set clipboard=unnamed
set splitright                        " always open vertical split window in the right side
set splitbelow                        " always open horizontal split window below
set scrolloff=5                       " start scrolling when n lines away from margins
set switchbuf=useopen
set showtabline=2                     " always show tab
set wildmode=longest,list             " use emacs-style tab completion when selecting files, etc
set wildmenu                          " make tab completion for files/buffers act like bash
set key=			                        " disable encryption
set synmaxcol=1024
set viminfo=			                    " disable .viminfo file
set ttyfast                           " send more chars while redrawing

filetype on                           " enable filetype detection
filetype indent on                    " enable filetype-specific indenting
filetype plugin on                    " enable filetype-specific plugins

syntax on                             " syntax highlight
set hlsearch                          " search highlighting
set incsearch                         " incremental search
syntax enable
set t_Co=256
try
  colorscheme railscasts
catch
endtry

set nobackup                          " no *~ backup files
set noswapfile
set nowritebackup
set copyindent                        " copy the previous indentation on autoindenting
set ignorecase                        " ignore case when searching
set smartcase
set smarttab                          " insert tabs on the start of a line according to
set expandtab                         " replace <TAB> with spaces
set softtabstop=2
set shiftwidth=2
set tabstop=2
set shortmess=Ia                      " remove splash wording

" disable sound on errors
set visualbell
set noerrorbells
set t_vb=
set tm=500

" file encoding
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,big5,euc-jp,gbk,euc-kr,utf-bom,iso8859-1,euc-jp,utf-16le,latin1
set fenc=utf-8 enc=utf-8 tenc=utf-8
scriptencoding utf-8

" ignores
set wildignore+=*.o,*.obj,*.pyc                " output objects
set wildignore+=*.png,*.jpg,*.gif,*.ico        " image format
set wildignore+=*.swf,*.fla                    " image format
set wildignore+=*.mp3,*.mp4,*.avi,*.mkv        " media format
set wildignore+=*.git*,*.hg*,*.svn*            " version control system
set wildignore+=*sass-cache*
set wildignore+=*.DS_Store
set wildignore+=log/**
set wildignore+=tmp/**

" cursorline switched while focus is switched to another split window
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

" ======================================
"  custom key and plugin configurations
" ======================================
" remove tailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" comment
map <Leader><Leader> <Leader>c<space>

" next and prev tab
noremap <F7> gT
noremap <F8> gt

map <C-h> gT
map <C-l> gt

" identation
nmap <TAB> v>
nmap <S-TAB> v<
vmap <TAB> >gv
vmap <S-TAB> <gv

" remap VIM 0
map 0 ^

" return current opened file's dirctory
cnoremap %% <C-R>=expand('%:h').'/'<CR>

map "+y :w !pbcopy<CR><CR>
map "+p :r !pbpaste<CR><CR>

" ctrl-x for cut
" vmap <C-x> :!pbcopy<cr>
" " ctrl-c for copy
" vmap <C-c> :w !pbcopy<cr><cr>
" " ctrl-v for paste
" "nmap <C-v> :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
" imap <C-v> <Esc>:set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
"
" For local replace
nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>

" For global replace
nnoremap gR gD:%s/<C-R>///gc<left><left><left>}

" Function to rename the variable under the cursor
function! Rnvar()
  let word_to_replace = expand("<cword>")
  let replacement = input("new name: ")
  execute '%s/\(\W\)' . word_to_replace . '\(\W\)/\1' . replacement . '\2/gc'
endfunction


map <C-y> :.w !pbcopy<CR><CR>
map <C-l> :r !pbpaste<CR>
vmap <C-y> :w !pbcopy<CR><CR>

let g:ruby_debugger_progname = 'mvim'


map <C-a> GVgg
map <C-n> :enew
map <C-o> :e . <Enter>
map <C-s> :w <Enter>
map <C-t> :tabnew <Enter>
map <C-i> >>
map <C-q> :close <Enter>
map <C-c> :q! <Enter>
map <S-t> vat
map <S-T> vit
map <S-{> vi{
map <S-(> vi(
map <S-[> vi[

let g:EasyMotion_leader_key = ','
nmap gc :let @/=@/.'\\|\<'.expand("<cword>").'\>'<CR>
