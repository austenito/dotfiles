set tags+=gems.tags

" Regenerate ctags-exuberant
map <Leader>ce :!/usr/local/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q *<CR>
let Tlist_Ctags_Cmd='/usr/local/bin/ctags' 

autocmd FileType ruby map gd <C-]>
autocmd FileType javascript map gd <C-]>
