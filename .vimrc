" dot.vimrc, nishalr

filetype off
filetype plugin indent on

set t_Co=16
set background=dark
set textwidth=79
set tabstop=4
set shiftwidth=4
set expandtab
set ff=unix
set hlsearch
set nowrap
set laststatus=2                " Always show the statusline
set encoding=utf-8              " Necessary to show Unicode glyphs
set nocompatible                " Disable vi-compatibility

" Options I rather switch on manually as necessary
"set colorcolumn=79              " Show a visual overflow cue line
"set relativenumber
"set cursorline
"set cursorcolumn

" Show < or > when characters are not displayed on the left or right
set list listchars=tab:>-,trail:.,precedes:<,extends:>

" use Vundle to manage plugins
set rtp+=~/.vim/bundle/vundle/

" load plugin bundles
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'
Bundle 'scrooloose/nerdtree'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'davidhalter/jedi-vim'

" vim-colors-solarised
let g:solarized_termcolors=16
let g:solarized_termtrans=1
let g:solarized_degrade=16
let g:solarized_bold=1
let g:solarized_underline=1
let g:solarized_italic=1
let g:solarized_contrast="med"
let g:solarized_visibility="med"
colorscheme solarized
syntax on

" Window-split background colour
highlight VertSplit ctermbg=8
highlight VertSplit ctermfg=0

" Highlight text overflow beyond 79 characters
highlight OverLength ctermbg=red ctermfg=white
autocmd BufWinEnter * let w:m1=matchadd('ErrorMsg', '\%>79v.\+', -1)

" code templates
autocmd BufNewFile  *.py        0r ~/.vim/templates/skel.py
autocmd BufNewFile  *.awk       0r ~/.vim/templates/skel.awk

