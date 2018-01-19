

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
"Bundle 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/powerline',{'rtp':'powerline/bindings/vim/'}
Plugin 'easymotion/vim-easymotion'
Plugin 'rust-lang/rust.vim'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'jnurmine/Zenburn'
"Plugin 'altercation/vim-colors-solarized'

" EXECUTE VUNDLE
call vundle#end()

" BASIC USAGE
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set textwidth=79
set autoindent
set fileformat=unix
set splitbelow
set splitright

set encoding=utf-8
let python_highlight_all=1

syntax on
"set nu "adds linenumbs

"Add specific ts/sts/.. etc in the future
if has("autocmd")
    filetype on
    autocmd FileType java setlocal ts=4 sts=4 sw=4 noexpandtab
    autocmd BufNewFile,BufRead *.rss setfiletype xml
endif


let mapleader = " "

"navigate splitscreen :sv splitver :vs splithor
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"folding is nice
set foldmethod=indent
set foldlevel=99
nnoremap <S-z> za

let g:SimpylFold_docstring_preview=1

"mark unecessary whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *py,*pyw,*.c,*.h match BadWhitespace /\s\+$/

"change interpreter to p3 instead of 2, which I doesn't have on my arch
"let g:ycm_path_to_python_interpreter = '/usr/bin/python3'

"let g:ycm_autoclose_preview_window_after_completion=1
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




"leader toggles
nmap <leader>l :set list!<CR>
"    <leader>g higher up, jump to definition/declaration
"    <leader><leader> 1000ms for commanding easymotion(basicly acejump)

vmap < <gv
vmap > >gv





"change .script files to have same syntax as lua. This is because of defold.
au BufRead,BufNewFile *.script set syntax=lua

autocmd BufWritePre *.py,*.groovy,*.c,*.rs :%s/\s\+$//e

"autopairs!
ino " ""<left>
ino ' ''<left>
ino ( ()<left>
ino [ []<left>
ino { {}<left>
ino {<CR> {<CR>}<ESC>O
ino {;<CR> {<CR>};<ESC>O
