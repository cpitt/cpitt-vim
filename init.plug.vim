" vim: set sw=2 ts=2 sts=2 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:

" Plug {
  " Install vim-plug if it doesn't exist already
  if empty(glob('~/.cpitt-vim/autoload/plug.vim'))
    silent !curl -fLo ~/.cpitt-vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif

  call plug#begin('~/.cpitt-vim/plugins')
  " General Plugins {
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'edkolev/tmuxline.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'mkitt/tabline.vim'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
    Plug 'chriskempson/base16-vim' "vim truecolor colorschemes
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'rhysd/conflict-marker.vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'matchit.zip'
    Plug 'mbbill/undotree'
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'mhinz/vim-signify'
    Plug 'tpope/vim-abolish'
    Plug 'osyo-manga/vim-over'
    Plug 'vim-scripts/restore_view.vim'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
  " }

  " General Programming {
    Plug 'tpope/vim-fugitive'
    Plug 'scrooloose/nerdcommenter'
    Plug 'tpope/vim-commentary'
    Plug 'godlygeek/tabular'
    Plug 'Shougo/deoplete.nvim', has('nvim') ? {} : { 'on': [], 'do': ':UpdateRemotePlugins' }
    Plug 'w0rp/ale'
    Plug 'airblade/vim-rooter'
  " }

  " Snippets {
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
  " }

  " Javascript Plugins {
    Plug 'elzr/vim-json'
    Plug 'groenewege/vim-less'
    Plug 'pangloss/vim-javascript'
    Plug 'briancollins/vim-jst'
    Plug 'isRuslan/vim-es6'
    Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
    Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
    Plug 'mmozuras/snipmate-mocha'
    Plug 'mxw/vim-jsx'
    " Toggle react class and function definition, didn't work well consider removing
    Plug 'mvolkmann/vim-react' 
    Plug 'othree/jspc.vim'
  " }

  " GoLang {
    Plug 'fatih/vim-go'
  " }

  " Html Plugins {
    Plug 'bonsaiben/bootstrap-snippets'
    Plug 'vim-scripts/HTML-AutoCloseTag'
    Plug 'hail2u/vim-css3-syntax'
    Plug 'gorodinskiy/vim-coloresque'
    Plug 'tpope/vim-haml'
    Plug 'mattn/emmet-vim'
  " }

  " Misc {
    Plug 'tpope/vim-markdown'
  " }

  call plug#end()
" }
