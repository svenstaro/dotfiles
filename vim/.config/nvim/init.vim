call plug#begin(expand('~/.config/nvim/plug/'))

" Language support
Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'chase/vim-ansible-yaml'
Plug 'justinmk/vim-syntax-extra'
Plug 'tfnico/vim-gradle'
Plug 'sheerun/vim-polyglot'
Plug 'lervag/vimtex'

" Looks
Plug 'bling/vim-airline'
Plug 'flazz/vim-colorschemes'
Plug 'ap/vim-css-color'
Plug 'luochen1990/rainbow'

" Functionality
Plug 'vim-scripts/a.vim'
"Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-fugitive'
Plug 'mattn/webapi-vim' | Plug 'mattn/gist-vim'
Plug 'airblade/vim-gitgutter'
Plug 'michaeljsmith/vim-indent-object'
Plug 'Valloric/MatchTagAlways'
Plug 'tomtom/tcomment_vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'
Plug 'vim-scripts/taglist.vim'
Plug 'SirVer/ultisnips' "| Plug 'honza/vim-snippets'
Plug 'honza/vim-snippets'
Plug 'Lokaltog/vim-easymotion'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'nixprime/cpsm', { 'do': './install.sh' }
Plug 'dyng/ctrlsf.vim'
Plug 'thinca/vim-quickrun'
Plug 'sjl/gundo.vim'
Plug 'chrisbra/SudoEdit.vim'
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
Plug 'rhysd/vim-clang-format'
Plug 'tpope/vim-speeddating'
Plug 'mhinz/vim-sayonara'
Plug 'ryanmorillo/excel.vim'
Plug 'godlygeek/tabular'
Plug 'Valloric/YouCompleteMe', { 'do': 'python2 install.py --clang-completer --system-libclang --system-boost' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'mhinz/neovim-remote'

call plug#end()

" basics
let mapleader = ","     " map leader to ,
set mouse=a             " make sure mouse is used in all cases.
set t_Co=256            " set 256 color
colorscheme badwolf   " define syntax color scheme
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
set scrolloff=2         " keep 2 lines spacing between cursor and edge
set gfn=Input\ Mono\ 8
set number              " show line numbers
syntax on               " enable syntax highlighting
"set synmaxcol=200       " for performance reason, don't highlight long lines
filetype plugin indent on

map ; :

" cursor settings
set nocursorline        " don't highlight cursor line (this makes scrolling slow)
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
nnoremap <leader><space> :nohlsearch<CR>  " turn off search highlight


" vim-polyglot
let g:polyglot_disabled = ['latex']


" vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1


" vim-clang-format
let g:clang_format#style_options = {
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "AllowShortFunctionsOnASingleLine" : "false",
            \ "ColumnLimit" : "100",
            \ "BasedOnStyle" : "LLVM",
            \ "Standard" : "C++11"}

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc,opencl nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc,opencl vnoremap <buffer><Leader>cf :ClangFormat<CR>


" emmet-vim
let g:user_emmet_leader_key='<C-E>'


" vim-airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_left_sep=''
let g:airline_right_sep=''
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

" cpsm
let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}


" ctrlp-funky
nnoremap <C-l> :CtrlPFunky<cr>
let g:ctrlp_funky_matchtype = 'path'
let g:ctrlp_funky_syntax_highlight = 1


" vim-sayonara
nnoremap <leader>q :Sayonara<cr>
nnoremap <leader>Q :Sayonara!<cr>


" ctrlsf
nmap <C-k> <Plug>CtrlSFPrompt


" syntastic
let g:syntastic_check_on_open = 1         " Don't check for errors until save
let g:syntastic_python_checkers = ['flake8', 'python']


" rainbow
let g:rainbow_active = 0


" auto completion stuff
set ofu=syntaxcomplete#Complete
set complete+=k         " enable dictionary completion
set completeopt=menuone,menu,longest,preview

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif


" YCM/YouCompleteMe
let g:ycm_global_ycm_extra_conf = "~/.ycm_extra_conf.py"
let g:ycm_extra_conf_globlist = ['~/prj/*']

" ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

nnoremap <C-]> :YcmCompleter GoTo<CR>

" tagbar
nnoremap <silent> <F8> :TagbarToggle<CR>


" vimtex
let g:vimtex_fold_enabled = 0
let g:vimtex_view_method = 'zathura'
let g:vimtex_latexmk_progname = '/home/svenstaro/.config/nvim/plug/neovim-remote/nvr'
let g:vimtex_latexmk_options = '-shell-escape'
let g:vimtex_quickfix_ignore_all_warnings = 1

" allow vimtex cite/ref completion with YouCompleteMe
if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = [
            \ 're!\\[A-Za-z]*(ref|cite)[A-Za-z]*([^]]*])?{([^}]*, ?)*'
            \ ]


" vim-markdown
let g:vim_markdown_folding_disabled=1


" nerdtree
nnoremap <silent> <F6> :NERDTreeToggle<CR>


" easymotion
map <Space> <Plug>(easymotion-prefix)
let g:EasyMotion_smartcase = 1
map <Plug>(easymotion-prefix)s <Plug>(easymotion-s)


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
autocmd Filetype tex,latex :set textwidth=99
autocmd Filetype tex,latex :set spell spelllang=en
autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

" vim-excel (stop vim from opening excel files as zip)
let g:zipPlugin_ext = '*.zip,*.jar,*.xpi,*.ja,*.war,*.ear,*.celzip,*.oxt,*.kmz,*.wsz,*.xap,*.docx,*.docm,*.dotx,*.dotm,*.potx,*.potm,*.ppsx,*.ppsm,*.pptx,*.pptm,*.ppam,*.sldx,*.thmx,*.crtx,*.vdw,*.glox,*.gcsx,*.gqsx'

" gui
set guioptions=agi
