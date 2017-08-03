" ~/.config/nvim/init.vim

if has('unix')
  if has('mac')
    let g:python_host_prog = '/Users/jimstewart/.virtualenvs/neovim2/bin/python'
    let g:python3_host_prog = '/Users/jimstewart/.virtualenvs/neovim3/bin/python'
  else
    let g:python_host_prog = '/home/jim/.virtualenvs/neovim2/bin/python'
    let g:python3_host_prog = '/home/jim/.virtualenvs/neovim3/bin/python'
  endif
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

Plug 'mileszs/ack.vim'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/syntastic'

" FIXME: why isn't tabber autoloading?
Plug 'fweep/vim-tabber'

let g:buffergator_suppress_keymaps = 1
Plug 'jeetsukumaran/vim-buffergator'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme = 'solarized'
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1

Plug 'Shougo/deoplete.nvim'

" Ruby/Rails plugins
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'

call plug#end()

" Use dark solarized color theme.
set background=dark
colorscheme solarized

" Disable underline for folds.
highlight Folded cterm=NONE

" Honor modeline settings in files.
set modeline modelines=5

" disable automatic comment leader insertion except on textwidth wrap
set formatoptions-=ro

" Keep files open even if there's no active window into them.
set hidden

" Save 10000 lines of history.
set history=10000

" Yank to system clipboard.
set clipboard=unnamed

" Replace tabs with the appropriate number of spaces in insert mode.
set expandtab

" Tabs are 2 spaces.
set tabstop=2

" Backspace deletes to previous tabstop.
set softtabstop=2

" Shift lines left/right by 2 spaces with <<, >>, indent with ==
set shiftwidth=2

" Allow backspace over everything in insert mode.
set backspace=indent,eol,start

" No line wrapping.
set nowrap

" Scroll window sideways by 1 character at a time.
set sidescroll=1

" Keep cursor 20 characters from edge of window when scrolling horizontally.
set sidescrolloff=20

" Keep cursor 8 lines from top/bottom of window when scrolling vertically.
set scrolloff=8

" Don't create backup files.
set nobackup
set nowritebackup

" Save more history for marks, commands, searches, etc. between invocations.
set shada='100,/1000,:1000,<50,s100,h,c

" Save undo history between Vim invocations.
set undofile

" Prepend .git/tags to tag file search path.
set tags^=.git/tags

" Set window title.
set title

" Always show statusline.
set laststatus=2

" Always show tabline.
set showtabline=2

" Reload externally-changed files when there are no changes in Vim.
set autoread

" Allow the cursor to move beyond EOL in visual mode block selections.
set virtualedit=block

" Show line numbers, width 4 in the column by default.
set number
set numberwidth=4

" Disable error bells when error messages are printed.
set noerrorbells

" Disable visual flash on error bells.
set visualbell t_vb=

" Reduce the number of hit-enter prompts from status messages.
set shortmess=aTI

" Flash to matching paren/bracket/brace when matching pair is typed.
set showmatch

" Instantly flash back to current character are showing match.
set matchtime=0

" For multi-character mappings and keycodes, wait 500ms and 50ms respectively
" for the next key press before timing out and running the command.
set timeout timeoutlen=500 ttimeoutlen=50

" Highlight matching patterns when searching.
set hlsearch

" Move to matches as a search is performed.
set incsearch

" Case-insensitive searching when the pattern contains only lowercase.
set ignorecase

" Override ignorecase when the pattern contains uppercase characters.
set smartcase

" :substitute is global by default (append /g to patterns toggle off).
set gdefault

" Display tokens for leading/trailing whitespace, literals tabs and nbsp.
set list listchars=tab:>·,trail:·,nbsp:·,extends:>

" Allow <BS>, <Space>, <Left>, <Right> to line-wrap in normal mode.
set whichwrap=b,s,<,>

" Enable filename completion on <Tab> in command-line.
set wildmenu

" First <Tab> completes longest common match, second <Tab> opens wildmenu.
set wildmode=list:longest,list:full

" Ignore files matching these patterns when completing.
set wildignore+=*/.git
set wildignore+=*/*.swp
set wildignore+=*/tmp/*

" Ignore some sources for faster autocompletion of tags.
" Current file, other open windows/buffers, included files, tags.
set complete=.,w,b,i,t

" Don't save open help windows in session.
set sessionoptions-=help

" Enable mouse in all modes.
set mouse=a

" Hide the mouse while typing (default; just being explicit here).
set mousehide

" Don't redraw while executing macros.
set lazyredraw

" Expand the default preview window size (used by Fugitive for Gstatus, etc).
set previewheight=20

" Make ~ for case-swapping require a motion by default.
set tildeop

" Key bindings.

" Change leader from default \.
let mapleader = ','

" Toggle search highlighting off more easily.
nnoremap <silent> <space> :nohlsearch<CR>

" Make Y behave like C and D.
nnoremap Y y$

" Make X like D into a black hole.
nnoremap X "_D

" Map jk to <Esc> in insert mode.
inoremap jk <Esc>

" Disable <F1> help because I always fat-finger <Esc> on tiny keyboards.
nnoremap <F1> <Nop>

" <F2> toggles paste mode in normal/insert modes.
nnoremap <silent> <F2> :set paste!<CR>
set pastetoggle=<F2>

" Disabled paste mode when leaving insert mode.
autocmd InsertLeave * set nopaste

" Visually select entire buffer.
nnoremap <Leader>a ggVG

" Make . on a visual selection sensible.
vnoremap . :normal .<CR>

" Swap behavior of ' and ` for easier typing.
nnoremap ' `
nnoremap ` '

" Default to "very magic" mode for searching.
nnoremap / /\v
vnoremap / /\v

" Use C-a to move to beginning of ex command line.
cnoremap <C-a> <Home>

" Make <Home> alternately jump between column 0 and the first non-whitespace column.
" FIXME: make this a plugin
nnoremap <silent> <Home> :call Home()<CR>
inoremap <silent> <Home> <C-O>:call Home()<CR>

if !exists("*Home")
  function Home()
    let curcol = wincol()
    normal ^
    let newcol = wincol()
    if newcol == curcol
      normal 0
    endif
  endfunction
endif

" Delete trailing whitespace from all lines in current buffer.
" FIXME: make this a plugin
nnoremap <silent> <Leader>w :call DeleteTrailingWhitespace()<CR>

function! DeleteTrailingWhitespace()
    let line = line(".")
    let col = col(".")
    %s/\s\+$//e
    call cursor(line, col)
endfunction

" FIXME: make this a plugin
function! DeleteHiddenBuffers()
    " http://stackoverflow.com/a/8459043/719547
    let tpbl=[]
    call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
        silent execute 'bwipeout' buf
    endfor
endfunction

runtime macros/matchit.vim
