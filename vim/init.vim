call plug#begin(expand('~/.config/nvim/plug/'))

" Language support
Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown'
Plug 'justinmk/vim-syntax-extra'
Plug 'tfnico/vim-gradle'
Plug 'rust-lang/rust.vim'
Plug 'sudar/vim-arduino-syntax'
Plug 'bfrg/vim-cpp-modern'
Plug 'JulesWang/css.vim'
Plug 'dart-lang/dart-vim-plugin'
Plug 'ekalinin/Dockerfile.vim'
Plug 'tpope/vim-git'
Plug 'tikhomirov/vim-glsl'
Plug 'NoahTheDuke/vim-just'
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
Plug 'nfnty/vim-nftables'

" Looks
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'ap/vim-css-color'

" Functionality
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
Plug 'preservim/nerdtree'               " file browser
Plug 'tpope/vim-repeat'                 " allow . to repeat more stuff
Plug 'tpope/vim-surround'               " neat surround motions
Plug 'tpope/vim-abolish'                " better substitutions
Plug 'dense-analysis/ale'               " various syntax checkers
Plug 'SirVer/ultisnips'                 " snippet engine
Plug 'honza/vim-snippets'               " snippet collections
Plug 'Lokaltog/vim-easymotion'          " some fun motions like jump-to-letter
Plug 'sjl/gundo.vim'                    " undo-tree visualizer
Plug 'chrisbra/SudoEdit.vim'            " add :SudoWrite to save file with sudo
Plug 'tpope/vim-speeddating'            " allow C-X and C-A to also work on dates
Plug 'mhinz/vim-sayonara'               " close buffers and make them actually disappear
Plug 'Chiel92/vim-autoformat'           " automatic formatting depending on filetype
Plug 'ntpeters/vim-better-whitespace'   " visualize trailing whitespaces
Plug 'bronson/vim-visual-star-search'   " allow for searching by current visual seleciton
Plug 'machakann/vim-highlightedyank'    " highlight what was just yanked
Plug 'junegunn/fzf'                     " fzf support
Plug 'junegunn/fzf.vim'                 " sweet fzf integration using :Files and such
Plug 'dyng/ctrlsf.vim'                  " search files for content and allow editing in search results
Plug 'neoclide/coc.nvim', {'branch': 'release'} " lots of LSP magic
Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}
Plug 'fannheyward/coc-pyright', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-java', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'josa42/coc-go', {'do': 'yarn install --frozen-lockfile'}
Plug 'josa42/coc-sh', {'do': 'yarn install --frozen-lockfile'}
Plug 'voldikss/coc-cmake', {'do': 'yarn install --frozen-lockfile'}
Plug 'clangd/coc-clangd', {'do': 'yarn install --frozen-lockfile'}
Plug 'fannheyward/coc-rust-analyzer', {'do': 'yarn install --frozen-lockfile'}
Plug 'iamcco/coc-flutter', {'do': 'yarn install --frozen-lockfile'}
call plug#end()

" basics
let mapleader = ","     " map leader to ,
set mouse=a             " make sure mouse is used in all cases.
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

" color settings
set termguicolors       " true color
set background=dark
" gruvbox settings. See https://github.com/morhetz/gruvbox/wiki/Configuration
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_sign_column='bg0'
colorscheme gruvbox      " define syntax color scheme

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
autocmd FileType markdown :set textwidth=99
autocmd FileType tex,latex :set spell spelllang=en

" make sure that we get system Python for neovim itself even if we are in a virtualenv
let g:python3_host_prog = '/usr/bin/python3'


" nvim terminal binds
au TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
au FileType fzf tunmap <buffer> <Esc>
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

autocmd BufNewFile,BufRead *.nomad set filetype=hcl
autocmd BufNewFile,BufRead *.tf,*.tfvars set filetype=terraform
autocmd BufWritePre *.rs :Autoformat
autocmd BufWritePre *.tf,*.tfvars :Autoformat
autocmd BufWritePre *.pkr.hcl :Autoformat terraform


" vim-airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_left_sep=''
let g:airline_left_alt_sep=''
let g:airline_right_sep=''
let g:airline_right_alt_sep=''
let g:airline#extensions#tabline#enabled = 1


" vim-sayonara
nnoremap <leader>q :Sayonara<cr>
nnoremap <leader>Q :Sayonara!<cr>


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


" vim-markdown
let g:vim_markdown_folding_disabled=1


" nerdtree
nnoremap <silent> <F6> :NERDTreeToggle<CR>
nnoremap <silent> <F7> :NERDTreeFind<CR>


" easymotion
map <Space> <Plug>(easymotion-prefix)
let g:EasyMotion_smartcase = 1
map <Plug>(easymotion-prefix)s <Plug>(easymotion-s)


" vim-better-whitespace
let g:better_whitespace_filetypes_blacklist=['ctrlsf']


" fzf.vim
" use proximity-sort to make sure that files are sorted according
function! s:list_cmd()
  let base = fnamemodify(expand('%'), ':h:.:S')
  return base == '.' ? 'fd -t f -H -E .git -E node_modules' : printf('fd -t f -H -E .git -E node_modules | proximity-sort %s', expand('%'))
endfunction

" run GFiles on the toplevel git dir, if found, otherwise fallback to Files from the current directory.
function! s:find_files()
    let git_dir = system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
    if git_dir != ''
        execute 'Files' git_dir
    else
        execute 'Files'
    endif
endfunction
command! ProjectFiles execute s:find_files()
nnoremap <C-p> :ProjectFiles<Cr>

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'source': s:list_cmd(),
  \                               'options': '--tiebreak=index'}), <bang>0)


" ctrlsf.vim
nmap <S-F> <Plug>CtrlSFPrompt


" coc.nvim - everything below!

" Some servers have issues with backup files, see #649.
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
" nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions.
" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" " Show commands.
" nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document.
" nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols.
" nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list.
" nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
