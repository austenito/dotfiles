map <Leader>a :Ack!<space>
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
