" 切换NerdTree
nnoremap tt :NERDTreeToggle<CR>

" 将NERDTree默认的i键改成n键
let g:NERDTreeMapOpenSplit = get(g:, 'NERDTreeMapOpenSplit', 'n')

" 指定文件打开vim时，不打开NERDTree
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif

" 更改默认的箭头
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
