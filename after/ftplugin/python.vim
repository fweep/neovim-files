" FIXME: figure out how to move after/* stuff to vim-shared repo
setlocal foldmethod=indent foldlevel=20 formatoptions-=o
setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=99
setlocal completeopt-=preview
autocmd BufWinEnter,BufEnter,WinEnter       * if &ft ==# 'python' | setlocal cursorline | endif
autocmd BufWinLeave,BufLeave,WinLeave       * if &ft ==# 'python' | setlocal nocursorline | endif
