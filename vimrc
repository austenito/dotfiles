"" Follow me on Twitter @ryanka
" --------------------------------------------------------------------------- "
" abbreviations
" --------------------------------------------------------------------------- "
        
iab _me Ryan Kanno <ryankanno@localkinegrinds.com>
iab _date <C-R>=strftime("%A, %B %e %Y %I:%M:%S %p %Z")<CR>

" --------------------------------------------------------------------------- "
" general
" --------------------------------------------------------------------------- "
let mapleader=","               " set mapleader
set nocompatible                " disable older vi compatibility 
set modeline                    " respect other
set encoding=utf-8              " use utf-8 encoding 

set number                      " set line numbers 

set ruler                       " show ruler 
set rulerformat=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%)

set laststatus=1                " always show last status

set history=1000                " 1000 lines of history 
set undolevels=500              " 500 levels of undo
set clipboard=unnamed           " share clipboard with win
set ffs=unix,dos,mac            " set file format to unix, win, then old mac
set hidden                      " enable hidden files 
set backspace=indent,eol,start  " enable backspace over indent, EOL, START

set backupext=.bak              " append .bak to backup files
set backupdir=$HOME/.vim_backups    " directory to store backup files 
set directory=$HOME/.vim_swaps      " directory to store swap files 
set autowrite                   " enable buffers to be saved on suspend

cmap cwd lcd %:p:h              " change working directory to that of file

" --------------------------------------------------------------------------- "
" themes
" --------------------------------------------------------------------------- "

if has("syntax")
    syntax on
endif
set background=dark             " sets the background color (I like it dark)
"colorscheme desert             " <3 desert/molokai ftw.
colorscheme molokai             " <3 colorscheme ftw.

" --------------------------------------------------------------------------- "
" visual
" --------------------------------------------------------------------------- "

set cursorline                  " highlight current line
set nocompatible                " disable older vi compatibility 

set guifont=Monaco:h12
set showcmd                     " show cmd
set showmatch                   " show matching brackets
set showbreak=...               " show '...' if line is longer than screen
set mat=5                       " how many tenths of a second to blink matching brackets
set incsearch                   " show search matches as you type
set visualbell                " no error bells
set noerrorbells                " no error bells
set title                       " sets the title
set wildmenu                    " show autocomplete options
set textwidth=79                " sets the text width
set hlsearch

"settings that cause tmux to explode
set t_Co=256
"set lines=58                    " height

" highlight lines over 80 characters
highlight OverLength ctermbg=darkred ctermfg=white guibg=#AE0000
match OverLength /\%100v.\+/

" show color column
if exists('+colorcolumn')
  set colorcolumn=100
endif

" --------------------------------------------------------------------------- "
" search
" --------------------------------------------------------------------------- "

set ignorecase                  " case insensitive search
set smartcase
set magic                       " enable advanced regular expressions
set hlsearch                    " enables highlighting search

" --------------------------------------------------------------------------- "
" text
" --------------------------------------------------------------------------- "

set autoindent                  " use curr line's indent to set indent of new line 
set smartindent                 " vim guesses indent level 
set tabstop=2     
set softtabstop=2 
set shiftwidth=2
set expandtab
set gdefault					" the /g flag on :s substitutions by default

" --------------------------------------------------------------------------- "
" folding
" --------------------------------------------------------------------------- "

set foldenable                  " enable folding
set foldmethod=manual
set foldlevel=0
set commentstring=\ #\ %s

" --------------------------------------------------------------------------- "
" folding
" --------------------------------------------------------------------------- "

autocmd FileType css setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

" --------------------------------------------------------------------------- "
" Load matchit (% to bounce from do to end, etc.)  
" --------------------------------------------------------------------------- "
runtime! macros/matchit.vim

" --------------------------------------------------------------------------- "
" command line
" --------------------------------------------------------------------------- "

" bash like commands
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" --------------------------------------------------------------------------- "
" keyboard mapping
" --------------------------------------------------------------------------- "

" simplify window navigation with ctrl
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h

" simplify tabbed navigation with shift
map <S-H> gT
map <S-L> gt

" <Leader>f to start an Ack search
map <Leader>f :Ack<space>

" <Leader>o to open bufExplorer
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
map <Leader>o :BufExplorerVerticalSplit<CR>

" <F2> to toggle invisible characters
map <silent> <F2> :set invlist<CR>

" <Leader>W to clean whitespace
map <Leader>W :%s/\s\+$//<CR>:let @/=''<CR>

" <Leader>g to create public Gist of entire buffer
map <Leader>g :Gist<CR>
cmap <Leader>g Gist<CR>

" <Leader>pg to create private Gist of entire buffer
map <Leader>pg :Gist -p<CR>
cmap <Leader>pg Gist -p<CR>

" Source a local config to override stuffs
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif

" --------------------------------------------------------------------------- "
" plugins
" --------------------------------------------------------------------------- "

" allow pathogen to update runtime path
filetype off 
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

" buffer resizing mappings (shift + arrow key)
nnoremap <S-Up> <c-w>+
noremap <S-Down> <c-w>-
nnoremap <S-Left> <c-w><
nnoremap <S-Right> <c-w>>

" insert blank lines without going into insert mode
  nmap go o<esc>
  nmap gO O<esc>
  
" shortcuts for frequenly used files
  nmap gs :e db/schema.rb<cr>
  nmap gr :e config/routes.rb<cr>
  
" delete all buffers
  map <Leader>dd :bufdo bd<cr>
  
" Yank from the cursor to the end of the line, to be consistent with C and D.
  nnoremap Y y$

" select the lines which were just pasted
  nnoremap vv `[V`]
  
" shortcut for =>
  imap <C-l> <Space>=><Space>
  
" map ;; to Esc
imap <silent> jk <Esc>
                               
" Ctrl-n to open  Nerd Tree
nmap <silent> <C-n> :NERDTreeToggle<CR>


map <Leader>t :CtrlP<CR>
map <Leader>tr :CtrlPClearCache<CR>

" open browser after creating Gist
let g:gist_open_browser_after_post = 1

map { [e
map } ]e

" Hide MacVim Toolbar
if has("gui_running")
    set guioptions=egmrt
endif

" Regenerate ctags-exuberant
map <Leader>ce :!/usr/local/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q *<CR>
let Tlist_Ctags_Cmd='/usr/local/bin/ctags' 

" clear highlighting
map <Leader><Space> :nohl<CR>
nmap <Leader>r :NERDTreeFind<CR>

" Powerline settings
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs"
set guifont=Menlo\ Regular\ for\ Powerline\:h14

let g:Powerline_symbols = 'fancy'

let g:fugitive_github_domains = ['https://github.com']
