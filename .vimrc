" dot.vimrc, nishalr

filetype off
filetype plugin indent on

set t_Co=88
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
"set foldmethod=syntax           " Folding

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
let g:solarized_termcolors=88
let g:solarized_termtrans=1
let g:solarized_degrade=88
let g:solarized_bold=1
let g:solarized_underline=1
let g:solarized_italic=1
let g:solarized_contrast="med"
let g:solarized_visibility="med"
colorscheme solarized

let g:sh_fold_enabled=1
syntax on

" Window-split background colour
highlight VertSplit ctermbg=none
highlight VertSplit ctermfg=0

" Highlight text overflow beyond 79 characters
highlight OverLength ctermbg=red ctermfg=white
au BufWinEnter * let w:m1=matchadd('ErrorMsg', '\%>79v.\+', -1)

" code templates
au BufNewFile      *.awk       0r ~/.vim/templates/skel.awk
au BufNewFile      *.py        0r ~/.vim/templates/skel.py
au BufNewFile      *.sh        0r ~/.vim/templates/skel.sh

"au BufWritePost          *.awk       !chmod +x %
"au BufWritePost          *.py        !chmod +x %
"au BufWritePost          *.sh        !chmod +x %
