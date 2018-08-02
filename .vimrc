set nocompatible
filetype off 

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'davidhalter/jedi-vim'

Plugin 'nathanaelkane/vim-indent-guides'

Plugin 'scrooloose/nerdtree'

call vundle#end()
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set number
set clipboard=unnamed,autoselect
let mapleader = "," 

colorscheme default
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

inoremap jj <ESC>
noremap <CR> o<ESC>
noremap <silent> <C-T> :NERDTreeToggle<CR>

execute pathogen#infect()

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']
