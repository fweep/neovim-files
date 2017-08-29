" FIXME: figure out how to move after/* stuff to vim-shared repo
setlocal foldmethod=indent foldlevel=20 formatoptions-=o
setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=99
setlocal completeopt-=preview

" Disable python-mode's linelength column highlight.
setlocal colorcolumn=""

" Enable cursor line for the currently-focused window, disable for others.
autocmd BufWinEnter,BufEnter,WinEnter       * if &ft ==# 'python' | setlocal cursorline | endif
autocmd BufWinLeave,BufLeave,WinLeave       * if &ft ==# 'python' | setlocal nocursorline | endif
