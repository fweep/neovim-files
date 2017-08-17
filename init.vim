" ~/.config/nvim/init.vim

if has('unix')
  let g:python_host_prog = $HOME . '/.virtualenvs/neovim2/bin/python'
  let g:python3_host_prog = $HOME . '/.virtualenvs/neovim3/bin/python'
endif

call plug#begin('~/.config/nvim/plugged')

" General-purpose plugins.

Plug 'altercation/vim-colors-solarized'

Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-scriptease'

Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/switch.vim'

Plug 'mileszs/ack.vim'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/syntastic'
Plug 'godlygeek/tabular'

" My plugins (if you're not me, get rid of these g:plug_url_format lines to use https GitHub URLs).
let g:plug_url_format = 'git@github.com:%s.git'
Plug 'fweep/vim-tabber'
Plug 'fweep/vim-cscope'
unlet g:plug_url_format

Plug 'jeetsukumaran/vim-buffergator'
let g:buffergator_suppress_keymaps = 1

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme = 'solarized'
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1

" Ruby/Rails plugins
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'

call plug#end()

runtime macros/matchit.vim

" Shared options.
source $HOME/.config/nvim/vim-shared/options.vim

" Shared theme/visualization config.
source $HOME/.config/nvim/vim-shared/theme.vim

" Shared key mappings/bindings.
source $HOME/.config/nvim/vim-shared/mappings.vim

" Neovim-specific config.

" Save more history for marks, commands, searches, etc. between invocations.
set shada='100,/1000,:1000,<50,s100,h,c

" Local overrides.

if filereadable(expand('~/.local/share/nvim/init.vim')) | source ~/.local/share/nvim/init.vim | endif
if filereadable('.vimrc-project') | source .vimrc-project | endif
