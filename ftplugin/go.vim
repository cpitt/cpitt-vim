set autowrite
let g:go_fmt_command = 'goimports'
let g:go_list_type = 'quickfix'
let g:go_fmt_fail_silently = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:ale_fixers.go = ['goimports']
let g:ale_linters.go = ['go build', 'gofmt']
setlocal noexpandtab tabstop=2 shiftwidth=2

nmap <leader>b  <Plug>(go-build)
nmap <leader>r <Plug>(go-run)
nmap <leader>t  <Plug>(go-test)






