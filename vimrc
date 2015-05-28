if !1 | finish | endif

if has('vim_starting')
    if &compatible
        set nocompatible
    endif
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'gmarik/Vundle.vim'
NeoBundle 'chankaward/vim-railscasts-theme'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'techlivezheng/vim-plugin-minibufexpl'
NeoBundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim'}
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'
NeoBundle 'klen/python-mode'
NeoBundle 'lukerandall/haskellmode-vim'
NeoBundle 'eagletmt/ghcmod-vim'
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\   'windows' : 'tools\\update-dll-mingw',
\   'cygwin' : 'make -f make_cygwin.mak',
\   'mac' : 'make -f make_mac.mak',
\   'linux' : 'make',
\   'unix' : 'gmake',
\   },
\}
NeoBundle 'eagletmt/neco-ghc'
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'marijnh/tern_for_vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'pascoual/meteor-vim-ultisnips'
call neobundle#end()
filetype plugin indent on
NeoBundleCheck

augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC
augroup END

let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"
au BufEnter *.hs compiler ghc
colorscheme railscasts
set guifont=Source\ Code\ Pro\ for\ Powerline:h14
syntax on
set number
set relativenumber
set showcmd
set tabstop=4
set shiftwidth=4
set expandtab
set nowrap
set autoindent
set cindent
set cursorline
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
 
set encoding=utf-8
set laststatus=2
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
if !has('gui_running')
    set term=xterm-256color
endif
set termencoding=utf-8
let g:Powerline_symbols = "fancy"
"anti menu garbled
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

set foldmethod=indent
set foldlevel=99
let mapleader = ','
map <leader>j :RopeGotoDefinition<CR>
let g:pymode_rope = 1
let g:pymode_options_colorcolumn = 0        "Using my own
filetype on
filetype plugin indent on

"autocmd FileType javascript setlocal omnifunc=tern#Complete

augroup vimrc_filetype
    autocmd!
    autocmd FileType python call s:MyPythonSettings()
    autocmd FileType html call s:MyHTMLSettings()
    autocmd FileType css call s:MyHTMLSettings()
    autocmd FileType javascript call s:MyPythonSettings()
augroup end

map <C-n> :NERDTreeToggle<CR>

function! s:MyPythonSettings()
    highlight ColorColumn ctermbg=red guibg=red
    "PYTHON MODE SETTINGS
    let g:pymode = 1
    let g:pymode_rope = 0
    let g:pymode_doc = 1
    let g:pymode_doc_key = 'K'
    let g:pymode_lint = 1
    let g:pymode_lint_checker = "pyflakes,pep8"
    let g:pymode_lint_write = 1
    let g:pymode_virtualenv = 1
    let g:pymode_folding = 1
    let g:pymode_motion = 1
    let g:pymode_breakpoint = 1
    let g:pymode_breakpoint_bind = '<leader>b'
    call matchadd('ColorColumn', '\%81v', 100)
    set ts=4
    set sw=4
endfunction

function! s:MyHTMLSettings()
    set ts=2
    set sw=2
endfunction


