set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Tree explorer
Plugin 'scrooloose/nerdtree'

"Close Vim <tags>
Plugin 'alvan/vim-closetag'

"Autocomplete brackets, braces, and quotes
Plugin 'Raimondi/delimitMate'

"Syntax checking
Plugin 'vim-syntastic/syntastic'

"JavaScript syntax
Plugin 'pangloss/vim-javascript'

"JSX syntax
Plugin 'mxw/vim-jsx'

"Autocomplete
Plugin 'Valloric/YouCompleteMe'

"Stylus syntax highlighting
Plugin 'wavded/vim-stylus'

"vim fuzzy-find
Plugin 'ctrlpvim/ctrlp.vim'

"search util
Plugin 'rking/ag.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

" Coloration
syntax enable
set background=dark
colorscheme solarized

" Tabs
set backspace=indent,eol,start " Enable expected backspace behavior like other IDEs
set expandtab       " tabs are spaces
set softtabstop=2   " number of spaces in tab when editing
set shiftwidth=2

" Visuals
set number              " show line numbers
set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]

" Searching
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" Movement
" move vertically by visual line (if a line wraps, it'll still count as 2 lines)
nnoremap j gj
nnoremap k gk

" highlight last inserted text taken from https://dougblack.io/words/a-good-vimrc.html
nnoremap gV `[v`]

" jk is escape
inoremap jk <esc>

"Enable ctrlp
let g:ctrlp_map = '<c-p>'

"Ignore annoying dirs in Ctrl-P
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" Powerline
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

"Set font type and size. Depends on the resolution. Larger screens, prefer h20
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set termencoding=utf-8

if has("gui_running")
   let s:uname = system("uname")
   if s:uname == "Darwin\n"
      set background=dark
      colorscheme solarized
      set guifont=Inconsolata-dz\ for\ Powerline:h13
   endif
else
   let g:solarized_termtrans = 1
   set background=dark
   colorscheme solarized
   set guifont=Inconsolata-dz\ for\ Powerline:h13
endif

" Configure Syntastic to use ESLint
let g:syntastic_javascript_checkers = ['eslint']

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

" Strip trailing whitespace on each save
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Gets syntastic playing nicely with nvm
let g:syntastic_javascript_eslint_exe = '$(npm bin)/eslint'

let g:ag_working_path_mode="r"

" Relative line numbers
set relativenumber


