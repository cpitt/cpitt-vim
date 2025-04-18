set encoding=utf-8
scriptencoding utf-8
" vim: set sw=2 ts=2 sts=2 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:
" ____     ____    ______  ______  ______          __  __  ______
"/\  _`\  /\  _`\ /\__  _\/\__  _\/\__  _\        /\ \/\ \/\__  _\   /'\_/`\
"\ \ \/\_\\ \ \L\ \/_/\ \/\/_/\ \/\/_/\ \/        \ \ \ \ \/_/\ \/  /\      \
" \ \ \/_/_\ \ ,__/  \ \ \   \ \ \   \ \ \  _______\ \ \ \ \ \ \ \  \ \ \__\ \
"  \ \ \L\ \\ \ \/    \_\ \__ \ \ \   \ \ \/\______\\ \ \_/ \ \_\ \__\ \ \_/\ \
"   \ \____/ \ \_\    /\_____\ \ \_\   \ \_\/______/ \ `\___/ /\_____\\ \_\\ \_\
"    \/___/   \/_/    \/_____/  \/_/    \/_/          `\/__/  \/_____/ \/_/ \/_/
"
" This is the personal vim configuration of Cameron Pitt
" Created as I transitioned from vim to neovim. May not be compatible with vim

" General {
  filetype plugin indent on   " Automatically detect file types.
  syntax on                   " Syntax highlighting

  if has('clipboard')
    if has('unnamedplus')  " When possible use + register for copy-paste
      set clipboard=unnamed,unnamedplus
    else         " On mac and Windows, use * register for copy-paste
      set clipboard=unnamed
    endif
  endif

  set undofile                        " turn on persistent undo
  set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
  set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
  set virtualedit=onemore             " Allow for cursor beyond last character
  set history=1000                    " Store a ton of history (default is 20)
  set spell                           " Spell checking on
  set hidden                          " Allow buffer switching without saving
  set iskeyword-=.                    " '.' is an end of word designator
  set iskeyword-=#                    " '#' is an end of word designator
  set iskeyword-=-                    " '-' is an end of word designator
  set iskeyword-=_                    " '_' is an end of word designator
"}

" init vim-plug {
  if filereadable(expand('~/.cpitt-vim/init.plug.vim'))
    source ~/.cpitt-vim/init.plug.vim
  endif
"}

" Key Remappings {
  " The default leader is '\', but many people prefer ',' as it's in a standard
  " location. To override this behavior and set it back to '\' (or any other
  " character) add the following to your .vimrc.before.local file:
  let g:mapleader = ','

  " Accidental shift key fixes
  if has('user_commands')
    command! -bang -nargs=* -complete=file E e<bang> <args>
    command! -bang -nargs=* -complete=file W w<bang> <args>
    command! -bang -nargs=* -complete=file Wq wq<bang> <args>
    command! -bang -nargs=* -complete=file WQ wq<bang> <args>
    command! -bang Wa wa<bang>
    command! -bang WA wa<bang>
    command! -bang Q q<bang>
    command! -bang QA qa<bang>
    command! -bang Qa qa<bang>
  endif

  cmap Tabe tabe

  " Visual shifting (does not exit Visual mode)
  vnoremap < <gv
  vnoremap > >gv

  " Yank from the cursor to the end of the line, to be consistent with C and D.
  nnoremap Y y$

  " For when you forget to sudo.. Really Write the file.
  cmap w!! :w suda://%

  " Clear search
  nmap <silent> <leader>/ :nohlsearch<CR>

  " }

  " Formatting {
  set nowrap                      " Do not wrap long lines
  set autoindent                  " Indent at the same level of the previous line
  set shiftwidth=2                " Use indents of 2 spaces
  set expandtab                   " Tabs are spaces, not tabs
  set tabstop=2                   " An indentation every four columns
  set softtabstop=2               " Let backspace delete indent
  set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
  set splitright                  " Puts new vsplit windows to the right of the current
  set splitbelow                  " Puts new split windows to the bottom of the current
  set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
  " Remove trailing whitespaces and ^M chars
  " To disable the stripping of whitespace, add the following to your
  augroup format
    autocmd!
    autocmd FileType c,cpp,java,php,javascript,puppet,python,rust,twig,xml,yml,perl,sql,vim autocmd BufWritePre <buffer> call StripTrailingWhitespace()
  augroup END
" }

" Vim UI {
  " Set termguicolors if neovim
  if has('termguicolors')
    set termguicolors
  endif

  let g:one_allow_italics=1 " I love italic for comments
  set background=dark
  color base16-material

  set tabpagemax=15               " Only show 15 tabs
  set showmode                    " Display the current mode
  set cursorline                  " Highlight current line

  " set background to transparent
  " highlight Normal guibg=NONE ctermbg=NONE
  " highlight clear SignColumn      " SignColumn should match background
  " highlight clear LineNr          " Current line number row will have same background color in relative mode

  if has('cmdline_info')
    set ruler                   " Show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
    set showcmd                 " Show partial commands in status line and
    " Selected characters/lines in visual mode
  endif

  if has('statusline')
    set laststatus=2

    " Broken down into easily includeable segments
    set statusline=%<%f\                     " Filename
    set statusline+=%w%h%m%r                 " Options
    set statusline+=%{fugitive#statusline()} " Git Hotness
    set statusline+=\ [%{&ff}/%Y]            " Filetype
    set statusline+=\ [%{getcwd()}]          " Current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
  endif

  " set lazyredraw                  " Speeds up redraw a bit
  set backspace=indent,eol,start  " Backspace for dummies
  set linespace=0                 " No extra spaces between rows
  set number                      " Line numbers on
  set relativenumber              " relative lines
  set showmatch                   " Show matching brackets/parenthesis
  set incsearch                   " Find as you type search
  set hlsearch                    " Highlight search terms
  set winminheight=0              " Windows can be 0 line high
  set ignorecase                  " Case insensitive search
  set smartcase                   " Case sensitive when uc present
  set wildmenu                    " Show list instead of just completing
  set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
  set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
  set scrolljump=5                " Lines to scroll when cursor leaves screen
  set scrolloff=3                 " Minimum lines to keep above and below cursor
  set foldenable                  " Auto fold code
  set list
  set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

  " }

" Plugin configuration {
  " Airline {
    let g:airline_theme='base16_material'
    let g:airline_powerline_fonts=1
    let g:airline#extensions#tabline#enabled=1
    let g:airline#extensions#tabline#show_buffers=0
    let g:airline#extensions#tabline#tab_nr_type = 1
    let g:airline#extensions#tabline#show_close_button = 0
    let g:airline#extensions#tabline#fnamemod = ':t'
    let g:airline#extensions#tabline#fnamecollapse = 0
    let g:airline_detect_spell=0
    let g:airline#extensions#coc#enabled = 1
    nmap <leader>1 <Plug>AirlineSelectTab1
    nmap <leader>2 <Plug>AirlineSelectTab2
    nmap <leader>3 <Plug>AirlineSelectTab3
    nmap <leader>4 <Plug>AirlineSelectTab4
    nmap <leader>5 <Plug>AirlineSelectTab5
    nmap <leader>6 <Plug>AirlineSelectTab6
    nmap <leader>7 <Plug>AirlineSelectTab7
    nmap <leader>8 <Plug>AirlineSelectTab8
    nmap <leader>9 <Plug>AirlineSelectTab9
    nmap <leader>- <Plug>AirlineSelectPrevTab
    nmap <leader>+ <Plug>AirlineSelectNextTab
  " }

  " Ultisnips {
    " remap Ultisnips for compatibility for deoplete tab
    let g:UltiSnipsExpandTrigger = '<C-j>'
    let g:UltiSnipsListSnippets = '<C-l>'
    let g:UltiSnipsJumpForwardTrigger = '<C-j>'
    let g:UltiSnipsJumpBackwardTrigger = '<C-k>'


    let g:UltiSnipsEditSplit='vertical'
    let g:UltiSnipsSnippetDir='~/.vim/UltiSnips/'
  " }
  " coc {
     source ~/.cpitt-vim/init.coc.vim
  " }


  " NerdTree {
    nmap <C-e> :CocCommand explorer<CR>
    " map <C-e> :NERDTreeToggle<CR>
    " map <leader>e :NERDTreeFind<CR>
    " nmap <leader>nt :NERDTreeFind<CR>

    let g:NERDTreeShowBookmarks=1
    let g:NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
    let g:NERDTreeChDirMode=0
    let g:NERDTreeQuitOnOpen=1
    let g:NERDTreeMouseMode=2
    let g:NERDTreeShowHidden=1
    let g:NERDTreeKeepTreeInNewTab=1
    let g:nerdtree_tabs_open_on_gui_startup=0
    " }

  " Indent Guides {
    let g:indent_guides_start_level = 2
    let g:indent_guides_guide_size = 1
    let g:indent_guides_enable_on_vim_startup = 1
    " }

  " Vim Fugitive {
    nnoremap <silent> <leader>gs :G<CR>
    nnoremap <silent> <leader>gd :Gdiff<CR>
    nnoremap <silent> <leader>gc :G commit -v<CR>
    nnoremap <silent> <leader>gb :G blame<CR>
    nnoremap <silent> <leader>gl :Gclog<CR>
    nnoremap <silent> <leader>gp :G push<CR>
    nnoremap <silent> <leader>gr :Gread<CR>
    nnoremap <silent> <leader>gw :Gwrite<CR>
    nnoremap <silent> <leader>ge :Gedit<CR>
    nnoremap <silent> <leader>gm :G mergetool<CR>

    " Mnemonic _i_nteractive
    nnoremap <silent> <leader>gi :Git add -p %<CR>
    " }

  " jsx {
    let g:jsx_ext_required = 0 " Allow jsx in js files
  " }

  " fzf {

    let g:fzf_layout = { 'down': '~20%' }
    let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
    let $FZF_DEFAULT_OPTS = '--multi --bind ctrl-a:select-all'

    function! s:build_quickfix_list(lines)
      call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
      copen
      cc
    endfunction

    let g:fzf_action = {
          \ 'ctrl-q': function('s:build_quickfix_list'),
          \ 'ctrl-t': 'tab split',
          \ 'ctrl-x': 'split',
          \ 'ctrl-v': 'vsplit' }


    " <C-p> or <C-t> to search files
    nnoremap <silent> <C-p> :Files<cr>

    " <M-p> for open buffers
    nnoremap <silent> <C-b> :Buffers<cr>

    " <M-S-p> for MRU
    nnoremap <silent> <M-S-p> :History<cr>

    " Use fuzzy completion relative filepaths across directory
    imap <expr> <c-x><c-f> fzf#vim#complete#path('git ls-files $(git rev-parse --show-toplevel)')
    "
    " Better command history with q:
    command! CmdHist call fzf#vim#command_history()
    nnoremap q: :CmdHist<CR>

    " Better search history
    command! QHist call fzf#vim#search_history()
    nnoremap q/ :QHist<CR>

    " Customize fzf colors to match your color scheme
    let g:fzf_colors =
    \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }
  " }

  " NerdCommentor {
    let g:NERDSpaceDelims = 1 " add space after comment char
    let g:NERDCustomDelimiters = {
          \ 'javascriptreact': { 'left': '//', 'leftAlt': '{}/*', 'rightAlt': '*/}' },
          \ 'typescriptreact': { 'left': '//', 'leftAlt': '{/*', 'rightAlt': '*/}' }
          \ }
  " }

  " closetag{
    let g:closetag_filenames = '*.html,*.xhtml,*.xml,*.js,*.jsx,*.tsx,*.vue'
  "}

  " hardmode {
    let g:hardtime_showmsg = 1
    let g:hardtime_showmsg = 1
    let g:hardtime_maxcount = 2
    let g:hardtime_ignore_buffer_patterns = [  'NERD.*' ]
    nnoremap <leader>h <Esc>:call HardTimeToggle()<CR>
  " }

  " undotree {
    nnoremap <Leader>u :UndotreeToggle<cr>
  " }

  " vim-over {
    map <leader>s :OverCommandLine<CR> %s/
    vmap <leader>s :OverCommandLine<CR> s/
  "}

  " Miniyank {
    map p <Plug>(miniyank-autoput)
    map P <Plug>(miniyank-autoPut)

    map <leader>p <Plug>(miniyank-startput)
    map <leader>P <Plug>(miniyank-startPut)

    map <M-p> <Plug>(miniyank-cycle)

    map <Leader>c <Plug>(miniyank-tochar)
    map <Leader>l <Plug>(miniyank-toline)
    map <Leader>b <Plug>(miniyank-toblock)
  " }

  " autopairs{
    let g:AutoPairsShortcutToggle = ''
  " }

  " Vim Rooter {
    " Trigger Rooter even when file isn' opened
    let g:rooter_patterns = ['.vscode', '.git']
  " }
" }

" Functions {
  " Strip whitespace {
  function! StripTrailingWhitespace()
    " Preparation: save last search, and cursor position.
    let l:_s=@/
    let l:l = line('.')
    let l:c = col('.')
    " do the business:
    silent! execute '%s/\s\+$//e'
    " clean up: restore previous search history, and cursor position
    let @/=l:_s
    call cursor(l:l, l:c)
  endfunction
  " }

  " Initialize directories {
  function! InitializeDirectories()
    let l:parent = $HOME
    let l:prefix = 'vim'
    let l:dir_list = {
          \ 'backup': 'backupdir',
          \ 'views': 'viewdir',
          \ 'swap': 'directory' }

    if has('persistent_undo')
      let l:dir_list['undo'] = 'undodir'
    endif

    " To specify a different directory in which to place the vimbackup,
    " vimviews, vimundo, and vimswap files/directories, add the following to
    " your .vimrc.before.local file:
    let l:common_dir = l:parent . '/.' . l:prefix

    for [l:dirname, l:settingname] in items(l:dir_list)
      let l:directory = l:common_dir . l:dirname . '/'
      if exists('*mkdir')
        if !isdirectory(l:directory)
          call mkdir(l:directory)
        endif
      endif
      if !isdirectory(l:directory)
        echo 'Warning: Unable to create backup directory: ' . l:directory
        echo 'Try: mkdir -p ' . l:directory
      else
        let l:directory = substitute(l:directory, ' ', '\\\\ ', 'g')
        exec 'set ' . l:settingname . '=' . l:directory
      endif
    endfor
  endfunction
  call InitializeDirectories()
  " }

  " find_git_root {
    function! s:find_git_root()
      return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
    endfunction
  " }
" }

" Use local vimrc if available {
    if filereadable(expand('~/.vimrc.local'))
        source ~/.vimrc.local
    endif
" }
