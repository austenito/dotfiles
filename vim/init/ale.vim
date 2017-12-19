let g:ale_go_gometalinter_options = '--vendor --fast --enable vetshadow --enable gofmt --enable goimports --enable staticcheck --enable gocyclo --enable errcheck --enable megacheck --disable goconst'
let g:ale_sign_column_always = 1
let g:ale_lint_delay = 500

let g:ale_linters = {
\   'go': [ 'go build', 'gometalinter' ],
\}

let g:ale_lint_on_text_changed = 'never'
