call plug#begin(expand('~/.config/nvim/plug/'))

" Language support
Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown'
Plug 'justinmk/vim-syntax-extra'
Plug 'tfnico/vim-gradle'
Plug 'rust-lang/rust.vim'
Plug 'lervag/vimtex'
Plug 'pearofducks/ansible-vim'
Plug 'sudar/vim-arduino-syntax'
Plug 'bfrg/vim-cpp-modern'
Plug 'JulesWang/css.vim'
Plug 'dart-lang/dart-vim-plugin'
Plug 'ekalinin/Dockerfile.vim'
Plug 'tpope/vim-git'
Plug 'tikhomirov/vim-glsl'
Plug 'fatih/vim-go'
Plug 'mustache/vim-mustache-handlebars'
Plug 'othree/html5.vim'
Plug 'digitaltoad/vim-jade'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'sheerun/vim-json'
Plug 'nginx/nginx', {'rtp': 'contrib/vim'}
Plug 'zah/nim.vim'
Plug 'petRUShka/vim-opencl'
Plug 'vim-perl/vim-perl'
Plug 'StanAngeloff/php.vim'
Plug 'uarun/vim-protobuf'
Plug 'vim-python/python-syntax'
Plug 'peterhoeg/vim-qml'
Plug 'vim-ruby/vim-ruby'
Plug 'kurayama/systemd-vim-syntax'
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'Firef0x/PKGBUILD.vim'
Plug 'Quramy/tsuquyomi'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'
Plug 'hashivim/vim-terraform'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'pest-parser/pest.vim'
Plug 'thosakwe/vim-flutter'

" Looks
Plug 'bling/vim-airline'
Plug 'flazz/vim-colorschemes'
Plug 'ap/vim-css-color'

" Functionality
Plug 'mhinz/neovim-remote'              " for vimtex remote editor
Plug 'vim-scripts/a.vim'                " alternate between headers and implementations
Plug 'Raimondi/delimitMate'             " automatically place closing parenthesis and such
Plug 'mg979/vim-visual-multi'           " multicursor supports via C-X
Plug 'tpope/vim-unimpaired'             " better bracket mappings
Plug 'tpope/vim-fugitive'               " git functionality
Plug 'tpope/vim-rhubarb'                " GitHub addon for fugitibe :Gbrowse
Plug 'airblade/vim-gitgutter'           " show git gutter
Plug 'michaeljsmith/vim-indent-object'  " make indentation level into a text object
Plug 'Valloric/MatchTagAlways'          " show matching tags
Plug 'tomtom/tcomment_vim'              " language-aware commetning
Plug 'scrooloose/nerdtree'              " file browser
Plug 'tpope/vim-repeat'                 " allow . to repeat more stuff
Plug 'tpope/vim-surround'               " neat surround motions
Plug 'tpope/vim-abolish'                " better substitutions
Plug 'dense-analysis/ale'               " various syntax checkers
Plug 'SirVer/ultisnips'                 " snippet engine
Plug 'honza/vim-snippets'               " snippet collections
Plug 'Lokaltog/vim-easymotion'          " some fun motions like jump-to-letter
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'nixprime/cpsm', { 'do': './install.sh' }
Plug 'dyng/ctrlsf.vim'
Plug 'thinca/vim-quickrun'
Plug 'sjl/gundo.vim'                    " undo-tree visualizer
Plug 'chrisbra/SudoEdit.vim'            " add :SudoWrite to save file with sudo
Plug 'tpope/vim-speeddating'            " allow C-X and C-A to also work on dates
Plug 'mhinz/vim-sayonara'               " close buffers and make them actually disappear
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-ultisnips'
Plug 'ncm2/ncm2-html-subscope'
Plug 'ncm2/ncm2-markdown-subscope'
Plug 'ncm2/ncm2-rst-subscope'
Plug 'roxma/nvim-yarp'
Plug 'Chiel92/vim-autoformat'           " automatic formatting depending on filetype
Plug 'ntpeters/vim-better-whitespace'   " visualize trailing whitespaces
Plug 'bronson/vim-visual-star-search'   " allow for searching by current visual seleciton
Plug 'machakann/vim-highlightedyank'    " highlight what was just yanked
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'junegunn/fzf'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
call plug#end()

" basics
let mapleader = ","     " map leader to ,
set mouse=a             " make sure mouse is used in all cases.
set termguicolors       " true color
colorscheme gruvbox     " define syntax color scheme
set background=dark
set shortmess+=I        " disable the welcome screen
set clipboard+=unnamedplus " yank and copy to X clipboard
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
set number              " show line numbers
set signcolumn=yes      " always show signcolumn
syntax on               " enable syntax highlighting
filetype plugin indent on

map ; :

" cursor settings
set nocursorline        " don't highlight cursor line (this makes scrolling slow)
set cursorcolumn      " don't highlight cursor column (breaks completion preview)

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
set backupcopy=yes      " to make parceljs happy (https://en.parceljs.org/hmr.html#safe-write)

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

" restore last position in file
autocmd BufReadPost *
            \ if line("'\"") > 1 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif
augroup END

" file type specific stuff
autocmd FileType python let python_highlight_all = 1
autocmd FileType tex,latex :set textwidth=99
autocmd FileType tex,latex :set spell spelllang=en


" nvim terminal binds
tnoremap <Esc> <C-\><C-n>
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Always enter terminal in insert mode
autocmd BufWinEnter,WinEnter term://* startinsert


" vim-autoformat
noremap <Leader>f :Autoformat<CR>
"let g:formatdef_clangformat = "'clang-format -lines='.a:firstline.':'.a:lastline.' --assume-filename='.bufname('%').' -style=\"{BasedOnStyle: LLVM, AlignTrailingComments: true, AlwaysBreakTemplateDeclarations: true, ColumnLimit: 100, AllowShortFunctionsOnASingleLine: false, Standard: C++11, '.(&textwidth ? 'ColumnLimit: '.&textwidth.', ' : '').(&expandtab ? 'UseTab: Never, IndentWidth: '.shiftwidth() : 'UseTab: Always').'}\"'"
let g:formatters_opencl = ['clangformat']
let g:formatters_glsl = ['clangformat']


" emmet-vim
let g:user_emmet_leader_key='<C-E>'


" vim-better-whitespace
let g:better_whitespace_filetypes_blacklist=['ctrlsf']


" vim-airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_left_sep=''
let g:airline_left_alt_sep=''
let g:airline_right_sep=''
let g:airline_right_alt_sep=''
let g:airline#extensions#tabline#enabled = 1


" ctrlp
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_user_command = 'rg %s --files -i --color=never --glob ''!.git'' --glob ''!.DS_Store'' --glob ''!node_modules'' --no-messages --hidden -g ""'
let g:ctrlp_extensions = ['funky']

" MRU relative to current working directory
let g:ctrlp_mruf_relative = 1

" No one needs caching when you have rg
let g:ctrlp_use_caching = 0
let g:ctrlp_clear_cache_on_exit = 1

" cpsm
let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}
let g:loaded_python_provider = 1        " disable Python 2 support
let g:python3_host_prog = '/usr/bin/python3'

" ctrlp-funky
nnoremap <C-l> :CtrlPFunky<cr>
let g:ctrlp_funky_matchtype = 'path'
let g:ctrlp_funky_syntax_highlight = 1


" vim-sayonara
nnoremap <leader>q :Sayonara<cr>
nnoremap <leader>Q :Sayonara!<cr>


" ctrlsf
nmap <C-k> <Plug>CtrlSFPrompt


" gitgutter
set updatetime=250


" force cursor to be in proper I shape in insert mode even if neovim thinks
" that the terminal doesn't support it.
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor


" ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

autocmd FileType help unmap <C-]>


" vimtex
let g:vimtex_fold_enabled = 0
let g:vimtex_view_method = 'zathura'
let g:vimtex_latexmk_progname = '/home/svenstaro/.config/nvim/plug/neovim-remote/nvr'
let g:vimtex_latexmk_options = '-pdf -verbose -file-line-error -synctex=1 -interaction=nonstopmode -shell-escape'


" LanguageClient-neovim
let g:LanguageClient_serverCommands = {
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'typescript': ['javascript-typescript-stdio'],
    \ 'rust': ['rust-analyzer'],
    \ 'python': ['pyls'],
    \ 'dart': ['dart_language_server'],
    \ 'sh': ['bash-language-server', 'start'],
    \ 'c': ['clangd'],
    \ 'cpp': ['clangd'],
    \ 'cuda': ['clangd'],
    \ 'obcj': ['clangd'],
    \ 'java': ['jdtls', '-data', getcwd()],
    \ }

let $RUST_BACKTRACE = 1
let g:LanguageClient_loggingLevel = 'INFO'
let g:LanguageClient_loggingFile = expand('~/.local/share/nvim/LanguageClient.log')
let g:LanguageClient_serverStderr = expand('~/.local/share/nvim/LanguageServer.log')

function SetLSPShortcuts()
  nnoremap <F5> :call LanguageClient_contextMenu()<CR>
  nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
  nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
  nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
endfunction()

augroup LSP
  autocmd!
  autocmd FileType typescript,javascript,rust,python,dart,sh,c,cpp,cude,obj,java call SetLSPShortcuts()
augroup END


" ncm2
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" NOTE: you need to install completion sources to get completions. Check
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki

" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" wrap existing omnifunc
" Note that omnifunc does not run in background and may probably block the
" editor. If you don't want to be blocked by omnifunc too often, you could
" add 180ms delay before the omni wrapper:
"  'on_complete': ['ncm2#on_complete#delay', 180,
"               \ 'ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
" au User Ncm2Plugin call ncm2#register_source({
"         \ 'name' : 'css',
"         \ 'priority': 9,
"         \ 'subscope_enable': 1,
"         \ 'scope': ['css','scss'],
"         \ 'mark': 'css',
"         \ 'word_pattern': '[\w\-]+',
"         \ 'complete_pattern': ':\s*',
"         \ 'on_complete': ['ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
"         \ })


" vim-markdown
let g:vim_markdown_folding_disabled=1


" nerdtree
nnoremap <silent> <F6> :NERDTreeToggle<CR>
nnoremap <silent> <F6> :NERDTreeFind<CR>


" easymotion
map <Space> <Plug>(easymotion-prefix)
let g:EasyMotion_smartcase = 1
map <Plug>(easymotion-prefix)s <Plug>(easymotion-s)
