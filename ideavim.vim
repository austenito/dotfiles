source ~/dotfiles/vim/init/settings.vim

set commentary

" ideavim
let mapleader = ","

" map jk to Esc
imap <silent> jk <Esc>

" jump on code
nnoremap gd :action GotoDeclaration<CR>
nnoremap <C-o> :action Back<CR>
nnoremap <C-i> :action Forward<CR>

nmap gu <Action>(FindUsages)

nmap <leader>ff <Action>(GotoFile)
nmap <leader>fa <Action>(GotoAction)
nmap <leader>fs <Action>(FileStructurePopup)
nmap <leader>fy <Action>(GotoSymbol)

nmap <leader>tt <Action>(RunClass)
nmap <leader>tr <Action>(Rerun)

nmap <leader>at <Action>(ActivateTerminalToolWindow)
