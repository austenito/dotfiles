" ideavim
let mapleader = ","

" map jk to Esc
imap <silent> jk <Esc>

" jump on code
nmap gd <Action>(GotoDeclaration)
nmap cc <Action>(CommentByLineComment)
nmap <leader>f <Action>(GotoFile)

nmap <leader>t <Action>(Run)
nmap <leader>tt  <Action>(Rerun)
