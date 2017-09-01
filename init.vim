" ~/.config/nvim/init.vim

if has('unix')
  let g:python_host_prog = $HOME . '/.virtualenvs/neovim2/bin/python'
  let g:python3_host_prog = $HOME . '/.virtualenvs/neovim3/bin/python'
endif

" Shared plugins.
source $HOME/.config/nvim/vim-shared/plugins.vim

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
