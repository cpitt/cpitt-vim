" vim: set sw=2 ts=2 sts=2 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:

" Plug {
"
  " Install vim-plug if it doesn't exist already
  if empty(glob('~/.cpitt-vim/autoload/plug.vim'))
    silent !curl -fLo ~/.cpitt-vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    augroup plug
      autocmd!
      autocmd vimrc VimEnter * PlugInstall --sync | source $MYVIMRC
    augroup END
  endif

  call plug#begin('~/.cpitt-vim/plugins')
  " General Plugins {
    Plug 'vim-airline/vim-airline' "Cool looking status line
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ryanoasis/vim-devicons' " Filetype Icons for nerdtree
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " Highlight file icons different colors
    Plug 'edkolev/tmuxline.vim' " Keep tmux theme and vim theme in sync
    Plug 'scrooloose/nerdtree' " file explorer
    Plug 'chriskempson/base16-vim' "vim 16color colorschemes
    Plug 'morhetz/gruvbox' " Gruvbox theme for vim
    Plug 'tpope/vim-repeat' " repeat plugin action with . aswell
    Plug 'nathanaelkane/vim-indent-guides' " highlight indent depths
    Plug 'tpope/vim-abolish' "fancy replacement (mostly useful for switching casing snakeCase->crs camel_case->crc MixedCase->crm)
    Plug 'osyo-manga/vim-over' " Better command interaction
    Plug 'vim-scripts/restore_view.vim' " restore cursor position and fold info
    Plug 'bfredl/nvim-miniyank'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " fuzzy find files
    Plug 'junegunn/fzf.vim' " fzf integration
    Plug 'skywind3000/asyncrun.vim' " self explanatory
  " }

  " General Programming {
    Plug 'mbbill/undotree' " Undo history viewer
    Plug 'tpope/vim-surround' " surround text with char/s
    Plug 'jiangmiao/auto-pairs' " Automatically close quotes, brackets, ect
    Plug 'editorconfig/editorconfig-vim' " respect .editorconfig
    Plug 'tpope/vim-fugitive' " Useful git commands in vim
    Plug 'airblade/vim-gitgutter' " Gutter diff signs git only
    Plug 'rhysd/conflict-marker.vim' " Jump to merge conflict markers
    Plug 'tomtom/tcomment_vim'
    Plug 'godlygeek/tabular' " align on characters
    Plug 'roxma/nvim-completion-manager' " completion
    Plug 'roxma/vim-hug-neovim-rpc', !has('nvim') ? {} : {'on': []}
    Plug 'w0rp/ale', has('nvim') ? {}: {'on': []} " Async linting
  " }

  " Snippets {
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'epilande/vim-react-snippets'
    Plug 'mmozuras/snipmate-mocha'
    Plug 'bonsaiben/bootstrap-snippets'
  " }

  " Javascript Plugins {
    Plug 'elzr/vim-json'
    Plug 'pangloss/vim-javascript' " better Javascript support
    Plug 'isRuslan/vim-es6' " syntax highlighting improvements and es6 snippets
    Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
    Plug 'roxma/nvim-cm-tern',  {'do': 'yarn'}
    Plug 'mxw/vim-jsx' " Better jsx support
    Plug 'mvolkmann/vim-react' " Toggle react class and function definition, didn't work well consider removing
    Plug 'othree/jspc.vim' " Javascript parameter completion
  " }

  " GoLang {
    Plug 'fatih/vim-go'
  " }

  " Html Plugins {
    Plug 'alvan/vim-closetag'
    Plug 'tpope/vim-haml'
  " }

  " css {
    Plug 'groenewege/vim-less' " syntax support for less
    Plug 'hail2u/vim-css3-syntax'
    Plug 'calebeby/ncm-css' "completion
    Plug 'gorodinskiy/vim-coloresque' " Highlight colors
  " }

  " Misc {
    Plug 'takac/vim-hardtime'
  " }

  " Markdown {
    Plug 'dkarter/bullets.vim' " Add bullet support for markdown
    Plug 'tpope/vim-markdown' " Upstream markdown plugin
  " }

  call plug#end()
" }
