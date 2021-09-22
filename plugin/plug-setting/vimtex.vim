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
