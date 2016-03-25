

" VUNDLE SETUP
"

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" PLUGINS
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Bundle 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/powerline',{'rtp':'powerline/bindings/vim/'}
Plugin 'easymotion/vim-easymotion'
"Plugin 'jnurmine/Zenburn'
"Plugin 'altercation/vim-colors-solarized'

" EXECUTE VUNDLE
call vundle#end()

" BASIC USAGE
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

set splitbelow
set splitright

set encoding=utf-8
let python_highlight_all=1

syntax on
"set nu

set softtabstop=4
set textwidth=79
set autoindent
set fileformat=unix

let mapleader = " "

"navigate splitscreen :sv splitver :vs splithor
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"folding is nice
set foldmethod=indent
set foldlevel=99
nnoremap <S-space> za

let g:SimpylFold_docstring_preview=1

"mark unecessary whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *py,*pyw,*.c,*.h match BadWhitespace /\s\+$/

"change interpreter to p3 instead of 2, which I doesn't have on my arch
let g:ycm_path_to_python_interpreter = '/usr/bin/python3'

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

"python virtualenv
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF



"Toggles
nnoremap <F5> :NERDTreeToggle<CR>

"ColorScheme
"if has('gui_running')
"    set background=dark
"    colorscheme solarized
"else
"    colorscheme zenburn
"endif
