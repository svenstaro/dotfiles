" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc.vim', {
    \ 'build' : {
    \     'linux' : 'make',
    \   },
    \ }

" Language support
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'dart-lang/dart-vim-plugin'
NeoBundle 'groenewege/vim-less'
NeoBundle 'plasticboy/vim-markdown', {'depends': 'godlygeek/tabular'}
NeoBundle 'vim-scripts/DoxygenToolkit.vim'
NeoBundle 'lervag/vim-latex'
NeoBundle 'chase/vim-ansible-yaml'
NeoBundle 'mitsuhiko/vim-jinja'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'othree/html5.vim'
NeoBundle 'hail2u/vim-css3-syntax'

" Looks
NeoBundle 'bling/vim-airline'
NeoBundle 'flazz/vim-colorschemes'
"NeoBundle 'gorodinskiy/vim-coloresque' " breaks . keyword
NeoBundle 'chrisbra/Colorizer'
NeoBundle 'luochen1990/rainbow'

" Functionality
NeoBundle 'vim-scripts/a.vim'
"NeoBundle 'Raimondi/delimitMate'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'mattn/gist-vim', {'depends': 'mattn/webapi-vim'}
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'michaeljsmith/vim-indent-object'
NeoBundle 'Valloric/MatchTagAlways'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'vim-scripts/taglist.vim'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'tacahiroy/ctrlp-funky'
NeoBundle 'dyng/ctrlsf.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'xuhdev/vim-latex-live-preview'
NeoBundle 'rhysd/vim-clang-format'
NeoBundle 'tpope/vim-speeddating'

NeoBundle 'Valloric/YouCompleteMe', {
    \ 'build': {
    \   'linux': './install.sh --clang-completer --system-libclang --system-boost',
    \   'directory': 'YouCompleteMe'
    \   },
    \ }

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" basics
let mapleader = ","     " map leader to ,
set mouse=a             " make sure mouse is used in all cases.
set t_Co=256            " set 256 color
colorscheme wombat256   " define syntax color scheme
set shortmess+=I        " disable the welcome screen
set clipboard+=unnamed  " yank and copy to X clipboard
set backspace=2         " full backspacing capabilities
set history=100         " 100 lines of command line history
set ruler               " ruler display in status line
set hidden              " enable buffer switching without saving
set showmode            " show mode at bottom of screen
set showcmd             " show incomplete command at bottom of screen
set ww=<,>,[,]          " whichwrap -- left/right keys can traverse up/down
set cmdheight=1         " set the command height
set showmatch           " show matching brackets (),{},[]
set matchpairs+=<:>     " match < and > as well
set mat=5               " show matching brackets for 0.5 seconds
set scrolloff=2         " keep 2 lines spacing between cursor and edge"
"set background=dark     " we don't like bright white terminals
"set gfn=Bitstream\ Vera\ Sans\ Mono\ 8
set gfn=GohuFont\ 8
set number              " show line numbers
syntax on               " enable syntax highlighting
"set synmaxcol=200       " for performance reason, don't highlight long lines

" cursor settings
set nocursorline        " don't highlight cursor line (for performance reasons)
set nocursorcolumn      " don't highlight cursor column (breaks completion preview)

" wrap like other editors
set wrap                " word wrap
"set textwidth=100        "
set lbr                 " line break
set display=lastline    " don't display @ with long paragraphs

" backup settings
set noswapfile          " don't create a swap file
set nobackup            " don't keep a backup file
set backupdir=/tmp      " backup dir
set directory=/tmp      " swap file directory

" tabs and indenting
set expandtab           " insert spaces instead of tab chars
set tabstop=4           " a n-space tab width
set shiftwidth=4        " allows the use of < and > for VISUAL indenting
set softtabstop=4       " counts n spaces when DELETE or BCKSPCE is used
set autoindent          " auto indents next new line
set smarttab            " remember indent
set listchars=tab:→,trail:¸ " show trail spaces and tabstchars
nnoremap <silent> <F2> :set list!<CR>
inoremap <silent> <F2> <esc>:set list!<CR>a

" command mode
set wildmenu
set wildmode=list:longest,full

" searching
set hlsearch            " highlight all search results
set incsearch           " increment search
set ignorecase          " case-insensitive search
set smartcase           " upper-case sensitive search


" vim-clang-format
let g:clang_format#style_options = {
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "BasedOnStyle" : "LLVM",
            \ "Standard" : "C++11"}

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>


" emmet-vim
let g:user_emmet_leader_key='<C-S>'

" vim-airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'


" ctrlp
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_user_command = 'ag %s --files-with-matches -i --nocolor --nogroup --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'' --hidden -g ""'
let g:ctrlp_extensions = ['funky']

" MRU relative to current working directory
let g:ctrlp_mruf_relative = 1

" ag is fast enough that CtrlP doesn't need to cache
let g:ctrlp_use_caching = 0


" ctrlp-funky
nnoremap <C-l> :CtrlPFunky<cr>
let g:ctrlp_funky_matchtype = 'path'
let g:ctrlp_funky_syntax_highlight = 1


" ctrlsf
nmap <C-k> <Plug>CtrlSFPrompt


" syntastic
let g:syntastic_check_on_open = 1         " Don't check for errors until save
let g:syntastic_python_checkers = ['flake8', 'python']


" rainbow
let g:rainbow_active = 0


" colorizer
let g:colorizer_auto_color_filetype='css,html'


" auto completion stuff
set ofu=syntaxcomplete#Complete
set complete+=k         " enable dictionary completion
set completeopt=menuone,menu,longest,preview

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

let g:ycm_global_ycm_extra_conf = "~/.ycm_extra_conf.py"
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

nnoremap <silent> <F8> :TagbarToggle<CR>


" vim-latex
let g:latex_fold_enabled = 0


" vim-markdown
let g:vim_markdown_folding_disabled=1


" vim-latex-live-preview
let g:livepreview_previewer = 'okular'

" nerdtree
nnoremap <silent> <F6> :NERDTreeToggle<CR>
inoremap <silent> <F6> <esc>:NERDTreeToggle<CR>a

" map : to ; in normal mode
map ; :

" spell check
map <F12> :w<CR>:!aspell -c %<CR><CR>:e<CR><CR>

" restore position
autocmd BufReadPost *
            \ if line("'\"") > 1 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif
augroup END

" file types
autocmd FileType python let python_highlight_all = 1
autocmd FileType python let python_highlight_space_errors = 1
autocmd FileType python let python_slow_sync = 1
autocmd Filetype tex,latex :set dictionary=~/.vim/dict/latex.dict
autocmd Filetype tex,latex :set textwidth=99
autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

" gui
set guioptions-=m " remove menubar
set guioptions-=T " remove toolbar
