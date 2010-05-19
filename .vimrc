" basics
set t_Co=256            " set 256 color
set nocompatible        " use Vim defaults
set mouse=a             " make sure mouse is used in all cases.
colorscheme wombat256   " define syntax color scheme
set shortmess+=I        " disable the welcome screen
set complete+=k         " enable dictionary completion
set completeopt+=longest
set clipboard+=unnamed  " yank and copy to X clipboard
set backspace=2         " full backspacing capabilities
set history=100         " 100 lines of command line history
set ruler               " ruler display in status line
set showmode            " show mode at bottom of screen
set showcmd             " show incomplete command at bottom of screen
set ww=<,>,[,]          " whichwrap -- left/right keys can traverse up/down
set cmdheight=1         " set the command height
set showmatch           " show matching brackets (),{},[]
set matchpairs+=<:>     " match < and > as well
set mat=5               " show matching brackets for 0.5 seconds
set background=dark     " we don't like bright white terminals
set gfn=Bitstream\ Vera\ Sans\ Mono\ 9
set number              " show line numbers

" cursor settings
set cursorline          " highlight cursor line
set cursorcolumn        " highlight cursor column

" wrap like other editors
set wrap                " word wrap
autocmd FileType python :set textwidth=79
"set textwidth=79        " 
set lbr                 " line break
set display=lastline    " don't display @ with long paragraphs

" backup settings
set backup              " keep a backup file
set backupdir=/tmp      " backup dir
set directory=/tmp      " swap file directory

" tabs and indenting
set noexpandtab         " don't insert spaces instead of tab chars
set tabstop=4           " a n-space tab width
set shiftwidth=4        " allows the use of < and > for VISUAL indenting
set softtabstop=4       " counts n spaces when DELETE or BCKSPCE is used
set autoindent          " auto indents next new line
"set listchars=tab:→,trail:¸ " show trail spaces and tabstchars
"set list

" command mode
set wildmenu 
set wildmode=list:longest,full

" searching
set hlsearch            " highlight all search results
set incsearch           " increment search
set ignorecase          " case-insensitive search
set smartcase           " upper-case sensitive search

" syntax highlighting
syntax on               " enable syntax highlighting

" statusline
"set statusline=%<%f\ %y%h%m%r\ PWD:%{getcwd()}%=%-14.(%l,%c%V%)\ %P
"set laststatus=2

" plug-in settings
filetype plugin on
filetype indent on
autocmd Filetype tex,latex :set grepprg=grep\ -nH\ $*
autocmd Filetype tex,latex :set dictionary=~/.vim/dict/latex.dict
set ofu=syntaxcomplete#Complete
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
nnoremap <silent> <F8> :TlistToggle<CR>
inoremap <silent> <F8> <esc>:TlistToggle<CR>a
nnoremap <silent> <F7> :TlistUpdate<CR>
inoremap <silent> <F7> <esc>:TlistUpdate<CR>a
let Tlist_Use_Right_Window = 1
let Tlist_Compart_Format = 1
let Tlist_Show_Menu = 1
let Tlist_Exit_OnlyWindow = 1
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1 
set path +=/usr/include/**
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/gl
set tags+=~/.vim/tags/sdl
set tags+=~/.vim/tags/qt

set tags+=~/.vim/tags/ogre
set tags+=~/.vim/tags/ois
set tags+=~/.vim/tags/sfml
set tags+=~/.vim/tags/boost
" build tags of your own project with CTRL+F11
"map <C-F11> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview
nnoremap <silent> <F6> :NERDTreeToggle<CR>
inoremap <silent> <F6> <esc>:NERDTreeToggle<CR>a

" map : to ; in normal mode
map ; :

" spell check
map <F12> :w<CR>:!aspell -c %<CR><CR>:e<CR><CR> 

" python script run
map <F9> :w! <CR> :!python %<CR>

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
"autocmd FileType python set expandtab shiftwidth=4 softtabstop=4 

" gui
set guioptions-=m " remove menubar
set guioptions-=T " remove toolbar
