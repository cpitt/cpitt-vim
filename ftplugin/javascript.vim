let b:ale_linters = ['eslint']
let b:ale_fixers = ['eslint']

" Use tern_for_vim. {
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']
let g:tern#filetypes = ['javascript', 'jsx', 'javascript.jsx']
let b:tern_show_signature_in_pum=1
let b:tern_show_argument_hints='on_hold'
" }
"
let b:ale_javascript_prettier_use_local_config = 1

" javascript lsp
" if executable('javascript-typescript-stdio')
"   au User lsp_setup call lsp#register_server({
"         \ 'name': 'javascript-typescript-stdio',
"         \ 'cmd': { server_info->[&shell, &shellcmdflag, 'javascript-typescript-stdio']},
"         \ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git'))},
"         \ 'whitelist': ['javascript', 'javascript.jsx']
"         \ })
" endif
