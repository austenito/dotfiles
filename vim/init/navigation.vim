" Copy current absolute file path to system pasteboard
map <silent> ,cf :let @* = expand("%:p")<CR>:echo "Copied: ".expand("%:p")<CR>

" Go to buffer
map th :bfirst<CR>
map tj :bprev<CR>
map tk :bnext<CR>
map tl :blast<CR>

" buffer resizing mappings (shift + arrow key)
nnoremap <S-Up> <c-w>-
noremap <S-Down> <c-w>+
nnoremap <S-Left> <c-w>>
nnoremap <S-Right> <c-w><

