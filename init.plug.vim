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
    " Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " Highlight file icons different colors
    " Plug 'scrooloose/nerdtree' " file explorer
    Plug 'chriskempson/base16-vim' "vim 16color colorschemes
    Plug 'rakr/vim-one' " one colors
    Plug 'tomasiser/vim-code-dark'
    Plug 'tpope/vim-repeat' " repeat plugin action with . aswell
    Plug 'nathanaelkane/vim-indent-guides' " highlight indent depths
    Plug 'tpope/vim-abolish' "fancy replacement (mostly useful for switching casing snakeCase->crs camel_case->crc MixedCase->crm)
    Plug 'osyo-manga/vim-over' " Better command interaction
    Plug 'vim-scripts/restore_view.vim' " restore cursor position and fold info
    Plug 'bfredl/nvim-miniyank'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " fuzzy find files
    Plug 'junegunn/fzf.vim' " fzf integration
    Plug 'skywind3000/asyncrun.vim' " self explanatory
    Plug 'airblade/vim-rooter'
    Plug 'wellle/targets.vim' " additional text object
    " Plug 'jiangmiao/auto-pairs'
    Plug 'lambdalisue/suda.vim' "fixes sudo writes in nvim
    Plug 'lbrayner/vim-rzip'
    Plug 'github/copilot.vim'
    Plug 'robitx/gp.nvim'
    "
  " }

  " General Programming {
    Plug 'mbbill/undotree' " Undo history viewer
    Plug 'tpope/vim-surround' " surround text with char/s
    Plug 'editorconfig/editorconfig-vim' " respect .editorconfig
    Plug 'tpope/vim-fugitive' " Useful git commands in vim
    Plug 'airblade/vim-gitgutter' " Gutter diff signs git only
    Plug 'rhysd/conflict-marker.vim' " Jump to merge conflict markers
    Plug 'tomtom/tcomment_vim' " easy comment toggling
    Plug 'godlygeek/tabular' " align on characters
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'tpope/vim-dotenv'
  " }

    " Snippets {
    " Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
  " }

  " Javascript Plugins {
    Plug 'neoclide/jsonc.vim'
    Plug 'elzr/vim-json'
    Plug 'pangloss/vim-javascript' " better Javascript support
    Plug 'mxw/vim-jsx' " Better jsx support
    Plug 'posva/vim-vue' " Vue file syntax support
    Plug 'mlaursen/vim-react-snippets'
  " }

  "  TypeScript {
    Plug 'HerringtonDarkholme/yats.vim'
  "  }

  " Graphql {
    Plug 'jparise/vim-graphql'
  " }
  " Ruby {
    " Plug 'vim-ruby/vim-ruby'
    Plug 'roxma/vim-ruby'
    Plug 'osyo-manga/vim-monster', {'do': 'gem install solargraph'}
    Plug 'tpope/vim-rails'
  " }

  " GoLang {
    Plug 'fatih/vim-go'
  " }

  " Html Plugins {

    " Plug 'alvan/vim-closetag'
    Plug 'tpope/vim-haml'
  " }

  " css {
    Plug 'groenewege/vim-less' " syntax support for less
    Plug 'hail2u/vim-css3-syntax'
    Plug 'gorodinskiy/vim-coloresque' " Highlight colors
  " }

  " Misc {
    Plug 'takac/vim-hardtime'
    Plug 'ekalinin/Dockerfile.vim'
    Plug 'mattn/webapi-vim'
    Plug 'mattn/gist-vim'
    Plug 'junegunn/vader.vim'
  " }

  " Markdown {
    " Plug 'dkarter/bullets.vim' " Add bullet support for markdown
    Plug 'plasticboy/vim-markdown' " Upstream markdown plugin
    Plug 'jxnblk/vim-mdx-js'
    " Plug 'rhysd/vim-gfm-syntax' " Add gh flavored markdown support
  " }

  call plug#end()
" }
