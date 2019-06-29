set nocompatible

set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf
set encoding=utf-8
set fileencodings=utf-8,cp932

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/nerdtree'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'itchyny/lightline.vim'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'leafgarland/typescript-vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'AndrewRadev/switch.vim'
Plugin 'tpope/vim-rails'
Plugin 'basyura/unite-rails'
Plugin 'tpope/vim-endwise'
"Plugin 'thinca/vim-ref'
Plugin 'junegunn/fzf.vim'
Plugin 'slim-template/vim-slim.git'

call vundle#end()
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set number
set clipboard=unnamed,autoselect
set fileformats=unix,dos,mac
set fileencodings=utf-8,sjis
set tags=.tags;$HOME

let mapleader = "," 

set background=light
colorscheme PaperColor
syntax on
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

inoremap jj <ESC>
noremap <CR> o<ESC>
noremap <silent> <C-e> :NERDTreeToggle<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <silent> <C-z> :FZF<CR>

map ] :NERDTreeFind<CR>

execute pathogen#infect()

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set laststatus=2

set termencoding=utf-8
set encoding=utf-8
set fileencodings=iso-2022-jp,utf-8,cp932,euc-jp

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']
let g:lightline = { 'colorscheme': 'PaperColor' }
let g:go_version_warning = 0
let g:BASH_Ctrl_j = 'off'

function! s:execute_ctags() abort
  let tag_name = '.tags'
  let tags_path = findfile(tag_name, '.;')
  if tags_path ==# ''
    return
  endif

  let tags_dirpath = fnamemodify(tags_path, ':p:h')
  execute 'silent !cd' tags_dirpath '&& ctags -R -f' tag_name '2> /dev/null &'
endfunction

"let g:netrw_banner = 0
"let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"let g:netrw_winsize = 25
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END
"
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType eruby setlocal expandtab shiftwidth=2 tabstop=2

augroup ctags
  autocmd!
  autocmd BufWritePost * call s:execute_ctags()
augroup END

