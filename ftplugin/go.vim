set autowrite
setlocal noexpandtab tabstop=2 shiftwidth=2

let b:go_fmt_command = 'goimports'
let b:go_list_type = 'quickfix'
let b:go_fmt_fail_silently = 1
let b:go_highlight_types = 1
let b:go_highlight_fields = 1
let b:go_highlight_functions = 1
let b:go_highlight_methods = 1
let b:ale_fixers = ['goimports']
let b:ale_linters = ['go build', 'gofmt']

nmap <leader>b  <Plug>(go-build)
nmap <leader>r <Plug>(go-run)
nmap <leader>t  <Plug>(go-test)






