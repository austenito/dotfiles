set background=dark
colorscheme molokai

let g:airline_theme='powerlineish'

if has("syntax")
  syntax on
endif

" show end of line
set list
set listchars=trail:·

set guifont=Inconsolata\ for\ Powerline:h15
set visualbell                " no error bells
set wildmenu                    " show autocomplete options
set wrap

" highlight line number
highlight CursorLineNR ctermbg=28 ctermfg=white

" highlight active tab
highlight TabLineSel ctermbg=28 ctermfg=White
