set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'mhinz/vim-signify'
Plugin 'powerline/powerline'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-fugitive'
call vundle#end()
filetype plugin indent on

" Personal settings
syntax on
set showmatch
set ignorecase
set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
set ttimeoutlen=50
" \Personal settings

" Jump to last position
augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END
" \Jump to last position

" Airline
set laststatus=2
let g:airline_powerline_fonts = 1
" \Airline

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" \Syntastic

