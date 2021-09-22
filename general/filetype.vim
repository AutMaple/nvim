autocmd FileType html,javascript,css set tabstop=2
autocmd FileType html,javascript,css set shiftwidth=2
autocmd FileType html,javascript,css set softtabstop=2

" Tex File
autocmd FileType json,markdown,tex let g:indentLine_conceallevel=0

" 用作为占位符，通过快捷键进行跳转
autocmd FileType tex,markdown inoremap <silent>.. <Esc>0/<++><CR>4x:nohlsearch<CR>i

" 在最后行尾添加一分号
autocmd FileType java,javascript,c,cpp inoremap <silent>;; <Esc>$a;
