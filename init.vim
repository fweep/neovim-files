" ~/.config/nvim/init.vim

if has('unix')
  let g:python_host_prog = $HOME . '/.virtualenvs/neovim2/bin/python'
  let g:python3_host_prog = $HOME . '/.virtualenvs/neovim3/bin/python'
endif

call plug#begin('~/.config/nvim/plugged')

" General-purpose plugins.

" Colorscheme.
Plug 'altercation/vim-colors-solarized'

" See GitHub for details of tpope plugins.
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

" See GitHub for details of AndrewRadev plugins.
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/switch.vim'

" Ack search results in quickfix window.
Plug 'mileszs/ack.vim'

" Fuzzy file finder.
Plug 'kien/ctrlp.vim'

" Mark syntax/linter errors and populate location list.
Plug 'scrooloose/syntastic'

" Format regions as tables.
Plug 'godlygeek/tabular'

" Makes */g* highlight without moving the cursor.
Plug 'vim-scripts/SearchHighlighting'

" My plugins (if you're not me, get rid of these g:plug_url_format lines to use https GitHub URLs).
let g:plug_url_format = 'git@github.com:%s.git'

" Powerline-style tabs and other tab labeling functionality.
Plug 'fweep/vim-tabber'

" Bind cscope search commands and list results in quickfix window.
Plug 'fweep/vim-cscope'
unlet g:plug_url_format

" Buffer list in a tray-style window.
Plug 'jeetsukumaran/vim-buffergator'
let g:buffergator_suppress_keymaps = 1

" Lighter-weight Powerline-style statusline.
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme = 'solarized'
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1

" Autocompletion.
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1

" Ruby/Rails plugins
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'

" Python plugins
Plug 'python-mode/python-mode'
let g:pymode_python = 'python3'
let g:pymode_options_colorcolumn = 0
" Prefer Syntastic for linting.
let g:pymode_lint = 0
" Disable Rope for now.
let g:pymode_rope = 0

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

" Tabber autolabel {{{1

function! UpdateTabberLabel(label)
  let tab_number = tabpagenr()
  let tabber_properties = gettabvar(tab_number, 'tabber_properties')
  let tabber_properties.label = a:label
  call settabvar(tab_number, 'tabber_properties', tabber_properties)
  redraw!
endfunction

function! SetTabberLabelToRubyClassName()
  let line = getline(1)
  let class_name_match = matchlist(line, '^\s*class\s\+\(\w\+\)')
  if len(class_name_match) > 1
    let class_name = class_name_match[1]
    call UpdateTabberLabel(class_name)
  endif
endfunction

augroup tabber_autolabel
  autocmd!
  autocmd BufRead,BufWrite *.rb call SetTabberLabelToRubyClassName()
augroup END

" }}}

" Local overrides.

if filereadable(expand('~/.local/share/nvim/init.vim')) | source ~/.local/share/nvim/init.vim | endif
if filereadable('.vimrc-project') | source .vimrc-project | endif
