" 如果在当前行的末尾输入{, 会自动进行换行并格式化的操作
function! AutoBraces()
    if col(".") - 1 == strchars(getline("."))
        return "{\<Enter>\<Enter>}\<ESC>ki\t"
    else
        return "{}"
    endif
endfunction

" 如果当前光标位于反括号、单引号或者双引号的的前面
" 按下 tab 键光标自动跳转对应符号的后面
function! JumpToPairs()
    let curPos = col(".")
    let chars = getline(".")
    let curChar = chars[curPos - 1]
    if curChar == "\'" || curChar == "\"" || curChar == ")" || curChar == "]" || curChar == "}"
        return "\<Esc>la"
    else
        return "\<Tab>"
    endif 
endfunction

inoremap <expr>{ AutoBraces()
inoremap " ""<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap ' ''<ESC>i

inoremap <expr><Tab> JumpToPairs()

