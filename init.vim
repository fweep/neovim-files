" ~/.config/nvim/init.vim

if has('unix')
  let g:python_host_prog = $HOME . '/.virtualenvs/neovim2/bin/python'
  let g:python3_host_prog = $HOME . '/.virtualenvs/neovim3/bin/python'
endif

" Add vim-shared to runtimepath for autoload.
set runtimepath+=$HOME/.config/nvim/vim-shared

" Shared plugins.
source $HOME/.config/nvim/vim-shared/plugins.vim

" Shared options.
source $HOME/.config/nvim/vim-shared/options.vim

" Shared theme/visualization config.
source $HOME/.config/nvim/vim-shared/theme.vim

" Shared key mappings/bindings.
source $HOME/.config/nvim/vim-shared/mappings.vim

" This probably belongs in shared/options.vim or something.
runtime macros/matchit.vim

" Add vim-shared/after to override plugin defaults.
set runtimepath+=$HOME/.config/nvim/vim-shared/after
