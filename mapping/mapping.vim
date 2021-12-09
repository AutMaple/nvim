" 打开配置文件
nnoremap <leader>ev :vsplit $MYVIMRC<CR>

" 取消高亮
noremap <leader><CR> :nohlsearch<CR>

"将光标所在行放在屏幕中间
nnoremap ff zz                          

"在高亮的字符串中移动，并将光标放在屏幕中间
nnoremap = nzz
nnoremap - Nzz

noremap \ =

" 光标移动
noremap i k
noremap k j
noremap j h
noremap m i
noremap M I
noremap I 4k
noremap K 4j
" 复制内容到系统剪切板
noremap Y "+y
" 全选
noremap <C-a> ggVG

" 去行尾
noremap gl $
" 到改行的第一个非空白字符处
noremap gj ^

" 取消高亮
noremap <leader><CR> :nohlsearch<CR>

"在高亮的字符串中移动，并将光标放在屏幕中间
nnoremap = nzz
nnoremap - Nzz

" ===========复制相关的操作============
nnoremap yw yiw
nnoremap y" yi"
nnoremap y( yi(
nnoremap y{ yi{
nnoremap yl yw
" 复制当前行
nnoremap yr yy

" 删除相关的操作
nnoremap <silent> dw diw
nnoremap <silent> d" di"
nnoremap <silent> d( di(
nnoremap <silent> d{ di{
nnoremap <silent> dl dw

" 删除并进入插入模式
nnoremap <silent> cw ciw
nnoremap <silent> c" ci"
nnoremap <silent> c( ci(
nnoremap <silent> c{ ci{
nnoremap <silent> cl cw

" 加载vim的配置文件
nnoremap R :source $MYVIMRC<CR>

noremap ; :

" 分屏操作
noremap sl :set splitright<CR>:vsplit<CR>
noremap sj :set nosplitright<CR>:vsplit<CR>
noremap si :set nosplitbelow<CR>:split<CR>
noremap sk :set splitbelow<CR>:split<CR>

" 分屏之间的切换
noremap <LEADER>i <C-w>k
noremap <LEADER>k <C-w>j
noremap <LEADER>j <C-w>h
noremap <LEADER>l <C-w>l

" 控制分屏的大小
noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize -5<CR>
noremap <right> :vertical resize +5<CR>

" 水平与垂直分屏之间的切换
noremap sv <C-w>t<C-w>H
noremap sh <C-w>t<C-w>K

" 当前光标在`'`, `"`, `]`, `]`, `}` 之前时
" 按下 tab 键光标自动跳转到`'`, `"`, `]`, `]`, `}` 的后面
func SkipPair()  
    if getline('.')[col('.') - 1] == ')' || getline('.')[col('.') - 1] == ']' || getline('.')[col('.') - 1] == '"' || getline('.')[col('.') - 1] == "'" || getline('.')[col('.') - 1] == '}'  
        return "\<ESC>la"
    else  
        return "\t"  
    endif  
endfunc 
inoremap <TAB> <c-r>=SkipPair()<CR>


