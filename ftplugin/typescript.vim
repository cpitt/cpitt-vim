" syn clear foldBraces
"
nnoremap <leader>ti :TSImport<CR>
nnoremap <leader>td :TSDef<CR>
nnoremap <leader>tdp :TSDefPreview<CR>
nnoremap <leader>tr :TSRename

let b:ale_linters = ['tslint', 'tsserver']
let b:ale_fixers = ['tslint']


