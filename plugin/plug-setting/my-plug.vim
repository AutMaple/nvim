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
