" 将<leader>设置成空格
let mapleader = " "

" 将光标所在行放在屏幕中间
nnoremap ff zz

" 设置编码方式为utf8
" set encoding=UTF-8

" 设置每隔1秒自动保存文件
let autosave = 1

" 设置在文件之间跳转时，自动保存文件
set autowriteall
  
" 保存配置后立马生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" 打开文件时，光标移动到上次关闭文件时光标所在的位置
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

nnoremap <leader>ev :vsplit $MYVIMRC<CR>

"设置光标在不同模式下的形状
if empty($TMUX)
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  let &t_SR = "\<Esc>]50;CursorShape=2\x7"
else
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
endif


" 用作为占位符，通过快捷键进行跳转
autocmd FileType tex,markdown inoremap <silent>.. <Esc>0/<++><CR>4x:nohlsearch<CR>i

" 在最后行尾添加一分号
autocmd FileType java,javascript,c,cpp inoremap <silent>;; <Esc>$a;

"设置vim在工作时不需要兼容vi
" 一般是关闭兼容性开关
set nocompatible


" 设置交换文件写入磁盘的时间默认值(4000ms)
" set updatetime=400


" 打开行号和相对行号的开关
 set number
 set relativenumber

" 设置光标线
set cursorline

" vim打开文件时，自动进行文件类型检测
 filetype on

" 根据文件的类型，自动进行缩进
 filetype indent on

" 自动加载对应文件类型的.vim插件
" 对应的.vim插件中会包括对应文件
" 类型的注释格式，智能补全函数等
 filetype plugin on

" filetype plugin indent on
" 相当于上面三个命令的简写体


" 设置鼠标在vim中是可用的
 set mouse=a

" 当一行写不下时，自动在下一行进行显示，但不是换行
 set nowrap

" 在光标上下滚动时，屏幕上下都会留有7行代码
set scrolloff=7


" 搜索高亮
 set hlsearch

" 开启实时搜索
 set incsearch

" 消除每次启动vim时高亮上一次搜索的结果
 exec "nohlsearch"

" 取消高亮
noremap <leader><CR> :nohlsearch<CR>

"在高亮的字符串中移动，并将光标放在屏幕中间
 nnoremap = nzz
 nnoremap - Nzz

 noremap \ =
  
" 设置在搜索时，忽略大小写
 set ignorecase
" 搜索时智能判断是否忽略大小写
 set smartcase

" set cursorline

" 在状态栏右下角显示输入的命令
 set showcmd

" 在命令行模式下输入命令
" 按tab键可以给予提示
set wildmenu

" 设置tab缩进的大小
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
autocmd FileType html,javascript,css set tabstop=2
autocmd FileType html,javascript,css set shiftwidth=2
autocmd FileType html,javascript,css set softtabstop=2

" 设置自动缩进
set autoindent
set smartindent


" 控制上下左右
noremap i k
noremap k j
noremap j h
noremap m i
noremap M I
nnoremap U 5k
nnoremap H 5j

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

set background=dark

" 将语法检测打开
syntax enable 
" 开启256色
set t_Co=256
" 颜色主题
colorscheme space-vim-dark
" colorscheme snazzy
" let g:SnazzyTransparent = 1

" 代码折叠
set foldmethod=manual


"======
"====== runcode
"======
func! RunCpp()
    exec "w"
    exec "AsyncRun -mode=term -pos=right g++ \"$(VIM_FILEPATH)\" -o \"$(VIM_FILENOEXT)\".out && ./\"$(VIM_FILENOEXT)\".out"
endfunc

" AsyncRun是异步执行的，
" 一个AsyncRun没有结束时不能够启动另外一个AsyncRun,否则会报错”
func! RunC()
    exec "w"   
    exec "AsyncRun -mode=term -pos=right gcc \"$(VIM_FILEPATH)\" -o \"$(VIM_FILENOEXT)\".out && ./\"$(VIM_FILENOEXT)\".out"
endfunc

func! RunPython()
    exec "w"
    exec "AsyncRun -mode=term -pos=right python3 \"$(VIM_FILEPATH)\""
endfunc

func! RunJava()
    exec "w"
    exec "AsyncRun -cwd=<root> -mode=term -pos=right javac \"$(VIM_FILEPATH)\" && java \"$(VIM_FILENOEXT)\""
endfunc

func! CompileCode()
    if &filetype == "cpp"
        exec "call RunCpp()"
    elseif &filetype == "c"
        exec "call RunC()"
    elseif &filetype == "python"
        exec "call RunPython()"
    elseif &filetype == "java"
        exec "call RunJava()"
    endif
endfunc

nnoremap <F5> :call CompileCode()<CR>
inoremap <F5> <ESC>:call CompileCode()<CR>
vnoremap <F5> <ESC>:call CompileCode()<CR>


"======
"====== filetype map
"======

" Tex File
autocmd FileType json,markdown,tex let g:indentLine_conceallevel=0


" 插件相关的配置
call plug#begin('~/.nvim/plugged/')

Plug 'vim-airline/vim-airline'

Plug 'connorholyday/vim-snazzy'

Plug 'preservim/nerdtree'

Plug 'junegunn/vim-easy-align'

Plug 'preservim/tagbar'

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

Plug 'dhruvasagar/vim-table-mode'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'kevinoid/vim-jsonc'

Plug 'mhinz/vim-startify'

Plug 'Yggdroot/LeaderF', {'do': ':LeaderfInstallCExtension'}

Plug 'honza/vim-snippets'

Plug 'Yggdroot/indentLine'

Plug 'mg979/vim-visual-multi', {'branch': 'master'}

Plug 'preservim/nerdcommenter'

Plug 'godlygeek/tabular'

Plug 'plasticboy/vim-markdown'

Plug 'lervag/vimtex'

Plug 'xuhdev/vim-latex-live-preview'

Plug 'skywind3000/asyncrun.vim'

Plug 'junegunn/vim-peekaboo'

Plug 'tpope/vim-surround'

Plug 'TaDaa/vimade'

Plug 'gcmt/wildfire.vim' 

Plug 'ryanoasis/vim-devicons'

Plug 'voldikss/vim-translator'

call plug#end()


" ======
" ====== NERDTree相关的配置  
" ======

" 切换NerdTree
nnoremap tt :NERDTreeToggle<CR>

" 将NERDTree默认的i键改成n键
let g:NERDTreeMapOpenSplit = get(g:, 'NERDTreeMapOpenSplit', 'n')

" 指定文件打开vim时，不打开NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif

" 更改默认的箭头
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'



"======
"====== markdown-preview.nvim相关的配置
"======

" 设置markdown-preview.nvim的映射
nnoremap tp :MarkdownPreviewToggle<CR>



" ======
" ====== easy-align插件相关的配置
" ======

" 设置easy-align插件的映射
nnoremap ga :EasyAlign<CR>*=
xnoremap ga :EasyAlign<CR>*=



"======
"====== coc.nvim
"======

" coc.nvim服务启动之后，自动安装列表中没有安装的插件
let g:coc_global_extensions = ['coc-snippets','coc-clangd','coc-highlight','coc-json','coc-python','coc-pairs','coc-java','coc-vimtex']

" 使用<tab>键和<S-tab>键在代码提示页中移动
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>" 

" 使用<CR>确定代码提示
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              " \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" 打开代码提示窗口
inoremap <silent><expr> <C-l> coc#refresh()

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.

" inoremap <silent><expr> <TAB>
      " \ pumvisible() ? "\<C-n>" :
      " \ <SID>check_back_space() ? "\<TAB>" :
      " \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
" nnoremap <silent><nowait> <space>cj  :<C-u>CocNext<CR>
" Do default action for previous item.
" nnoremap <silent><nowait> <space>ck  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


"======
"====== vim-table-mode
"======

" 进入tableMode
"nnoremap tm :TableModeToggle<CR>

" 使用与markdown语法的table
let g:table_mode_corner='|'


"======
"====== nerdcommenter
"======

" 注释符号与代码之间添加一个空格
let g:NERDSpaceDelims = 1


"======
"====== indentLine
"======

" 当文件类型是json或者markdown时，设置conceallevel为0
" autocmd FileType json,markdown let g:indentLine_conceallevel=0


"======
"====== Leaderf
"======

" 将Leaderf在浮动窗口中显示，同时在浮动窗口查看结果
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1


let g:Lf_DevIconsFont = "DroidSansMono Nerd Font Mono"
" If needs
set ambiwidth=double

" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1

" 将Leaderf在浮动窗口中显示，同时在浮动窗口查看结果
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

" 文件搜索快捷键
let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap go :<C-U>Leaderf! rg --recall<CR>

" should use `Leaderf gtags --update` first
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_Gtagslabel = 'native-pygments'
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>


"======
"====== vim-markdown
"======

" 禁用折叠
let g:vim_markdown_folding_disabled = 1

" 打开Latex语法
let g:vim_markdown_math = 1


"======
"====== vimtex
"======


" 设置Tex的语法风格:latex
let g:tex_flavor = 'latex'

" 设置编译的时候不出现弹窗
let g:vimtex_quickfix_mode=0

" 设置默认的pdf阅读器
let g:vimtex_vier_method='zathura'


" 使用xelatex作为默认的编译器，用以支持中文
let g:vimtex_compiler_latexmk_engines={'_': '-xelatex'}
let g:vimtex_compiler_latexrun_engines={'_': '-xelatex'}


" ======
" ====== vim-tex-live-preview
" ======

" let g:livepreview_previewer = 'zathura'
let g:livepreview_previewer = 'evince'
let g:livepreview_engine = 'xelatex'
" let g:livepreview_cursorhold_recompile = 0


" ======
" ====== asyncrun
" ======

" 自动打开quickfix窗口
let g:asyncrun_open=6


"======
"====== vim-nerd-font
"======
" set guifont=DroidSansMono\ Nerd\ Font\ 11
" set guifont=SauceCodePro\ Nerd\ Font\ Mono\ Semibold\ 11
set guifont=Hack\ Nerd\ Font\ 11
" let g:airline_powerline_fonts = 1


"======
"====== vim-translator
"======

" Display translation in a window
nmap <silent> <Leader>w <Plug>TranslateW
vmap <silent> <Leader>w <Plug>TranslateWV


