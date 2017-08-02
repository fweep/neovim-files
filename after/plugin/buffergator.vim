let g:buffergator_show_full_directory_path = 0
let g:buffergator_split_size = 50

nnoremap <Leader>g :BuffergatorToggle<CR>
nnoremap <Leader>G :BuffergatorTabsToggle<CR>

if exists("g:loaded_surround") 
  augroup local_buffergator
    autocmd!
    autocmd BufEnter \[\[buffergator-buffers\]\] unmap ds
    autocmd BufLeave \[\[buffergator-buffers\]\] nmap ds <Plug>Dsurround
  augroup END
end
