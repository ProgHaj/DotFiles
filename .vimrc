

" VUNDLE SETUP
"

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" PLUGINS
Plugin 'tmhedberg/SimpylFold'                                   "for folding +
Plugin 'vim-scripts/indentpython.vim'                           "indent python correctly.. ?
Plugin 'scrooloose/syntastic'                                   "syntax checking +
Plugin 'nvie/vim-flake8'                                        "python style checker + static syntax ?
Plugin 'kien/ctrlp.vim'                                         "fuzzy finder, usage ctrl+P
Plugin 'scrooloose/nerdtree'                                    "nerdtree with f5
Plugin 'Lokaltog/powerline',{'rtp':'powerline/bindings/vim/'}   "betterlooking status line
Plugin 'easymotion/vim-easymotion'                              "jump around in file using leader+leader+s or similar
Plugin 'rust-lang/rust.vim'                                     "rust syntax and stuff?
Plugin 'scrooloose/nerdcommenter'                               "comment with leader+c+leader or leader+c+c

" EXECUTE VUNDLE
call vundle#end()


"!!BASIC USAGE!!"
filetype plugin indent on
"activates omni usage
set omnifunc=syntaxcomplete#Complete
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
set nu
set relativenumber
set complete+=kspell
highlight LineNr ctermfg=grey

let python_highlight_all=1

syntax on

let mapleader = " "

"navigate splitscreen :sv splitver :vs splithor
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"autopairs!
"ino \" \""<left>
"ino ' ''<left>
ino ( ()<left>
ino [ []<left>
ino { {}<left>
ino {<CR> {<CR>}<ESC>O
ino {;<CR> {<CR>};<ESC>O

"tab
vmap < <gv
vmap > >gv


"python virtualenv -- why?
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF


"!!PLUGINS!!"

"""SimpleFold"""
"folding is nice
set foldmethod=indent
set foldlevel=99
nnoremap <S-z> za
let g:SimpylFold_docstring_preview=1

"""NERDTree"""
nnoremap <F5> :NERDTreeToggle<CR>

"""Easymotion"""
" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)
" DOESN'T WORK??


"!!EXTRAS!!"

"change .script files to have same syntax as lua. This is because of defold.
au BufRead,BufNewFile *.script set syntax=lua

"remove trailing whitespaces
autocmd BufWritePre *.py,*.groovy,*.c,*.rs,*.go :%s/\s\+$//e

"update ctag file after save for rust
autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/,$RUST_SRC_PATH/rusty-tags.vi
autocmd BufWritePost *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" | redraw!

"mark unecessary whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *py,*pyw,*.c,*.h match BadWhitespace /\s\+$/


"!!COMMAND HELP!!"
"setup ctags!
":set spell -> to activate spelling

"Vim 101 extra help:
"ctrl+p/ctrl+n in insert -> simple word completion
"ctrl+p -> previous, ctrl+n -> next, works for other as ups and downs as well
"ctrl+] -> go to tag(/definition) in other file using ctags
"ctrl+t -> go back when jumping to tags
"ctrl+x -> set us in completion mode
"ctrl+x + ctrl+] -> tag completion (Gooood) 
"ctrl+x + ctrl+f -> file completion
"ctrl+x + ctrl+p/ctr+n -> context aware word-completion
"ctrl+x + ctrl+l -> context aware line-completion
"m for marks, ' for jumping to it
"ctrl+x + ctrl+o -> omni completion (the plugin will help with this)
"
