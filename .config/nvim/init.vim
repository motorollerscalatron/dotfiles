set nocompatible

set rtp+=~/.config/nvim/bundle/vundle
set rtp+=/usr/local/opt/fzf
set encoding=utf-8
set fileencodings=utf-8,cp932

call vundle#begin("~/.config/nvim/bundle")

Plugin 'VundleVim/Vundle.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/nerdtree'
Plugin 'pangloss/vim-javascript'
Plugin 'itchyny/lightline.vim'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Quramy/tsuquyomi'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'AndrewRadev/switch.vim'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'basyura/unite-rails'
Plugin 'tpope/vim-endwise'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'slim-template/vim-slim.git'
Plugin 'posva/vim-vue'
Plugin 'kana/vim-tabpagecd'
Plugin 'thinca/vim-quickrun'
Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'
Plugin 'mattn/vim-lsp-settings'
Plugin 'mattn/calendar-vim'
Plugin 'mattn/emmet-vim'

call vundle#end()
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set number
set fileformats=unix,dos,mac
set fileencodings=utf-8,sjis
set tags=.tags;$HOME
set hlsearch
set scrolloff=7
set mouse=nv
set clipboard=unnamed

let mapleader = "," 

set background=light
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

map <Leader>. <c-w>10>
map <Leader>m <c-w>10<
map <Leader>k <c-w>3+
map <Leader>j <c-w>3-

set statusline+=%#warningmsg#
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

let g:lsp_diagnostics_enabled = 0
" debug
let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('~/vim-lsp.log')
let g:asyncomplete_log_file = expand('~/asyncomplete.log')

if executable('typescript-language-server')
  au User lsp_setup call lsp#register_server({
    \ 'name': 'javascript support using typescript-language-server',
    \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
    \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'package.json'))},
    \ 'whitelist': ['javascript', 'javascript.jsx'],
    \ })
endif

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
autocmd BufNewFile,BufRead *.ts *.tsx set syntax=typescript
autocmd VimEnter,BufNewFile,BufRead * if &ft == 'typescriptreact' | set ft=typescript.tsx | endif

augroup ctags
  autocmd!
  autocmd BufWritePost * call s:execute_ctags()
augroup END

