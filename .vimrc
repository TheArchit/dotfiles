" dot.vimrc, nishalr

filetype off
filetype plugin indent on

set t_Co=256                    " Number of terminal colours
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

"
" /* vim plugins */
"
set rtp+=~/.vim/bundle/vundle/  " use Vundle to manage plugins

"
" /* Vundle configuration */
"
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'
Bundle 'scrooloose/nerdtree'
Bundle 'Lokaltog/vim-powerline'
"Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'davidhalter/jedi-vim'

"
" /* vim-powerline configuration */
"
"                                            ______
"         _________                          \    /__
"         \_____   \______  _  _____________ /   /'__' ___   ____
"          |    ___/  _ \ \/ \/ / __ \_  ___\   / |  |/   \_/ __ \
"          |   |  |  (_) \  _  /  ___/|  |  /  /__|  |  |  \  ___/
"          '___'   \____/ \/ \/ \___  |__' /___  /'__'__|  /\___ \
"                                   \/        / /        \/     \/
"                                            | /
"                                            |/
"                                            '

let g:Powerline_symbols = 'fancy'
"let g:Powerline_colorscheme = 'solarized256'

"
" /* Personalised customisation settings */
"
syntax on
colorscheme solarized

" Window-split background colour
highlight VertSplit ctermbg=8
highlight VertSplit ctermfg=0

" Highlight text overflow beyond 79 characters
highlight OverLength ctermbg=red ctermfg=white
au BufWinEnter * let w:m1=matchadd('ErrorMsg', '\%>79v.\+', -1)

" Show < or > when characters are not displayed on the left or right
set list listchars=tab:>-,trail:.,precedes:<,extends:>

" Initialise new scripts from templates based on file extension
autocmd BufNewFile  *.py        0r ~/.vim/templates/skel.py
autocmd BufNewFile  *.awk       0r ~/.vim/templates/skel.awk
