func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        set splitbelow
        exec "!gcc % -o %<"
        :sp
        :res -10
        :term ./%<
    elseif &filetype == 'cpp'
        set splitbelow
        :!g++ -std=c++11 % -Wall -o %<
        :sp
        :res -10
        :term ./%<
        :normal i
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        set splitbelow
        :sp
        :res -10
        :term python3 %
    elseif &filetype == 'html'
        silent! exec "!reload -p 4444&"
        silent! exec "!surf 127.0.0.1:4444"
    elseif &filetype == 'markdown'
        exec "MarkdownPreview"
    elseif &filetype == 'go'
        set splitbelow
        :sp
        :term go run %
    endif
endfunc

func! PanGuSpacing()
    if &ft != "diff"
        let b:curcol = col(".")
        let b:curline = line(".")
        " 汉字与其前后的英文字符、英文标点、数字间增加空白。
        silent! %s/\([\u4e00-\u9fa5\u3040-\u30FF]\)\([a-zA-Z0-9@&=\[\$\%\^\-\+(\/\\]\)/\1 \2/g " 汉字在前。
        silent! %s/\([a-zA-Z0-9!&;=\]\,\.\:\?\$\%\^\-\+\)\/\\]\)\([\u4e00-\u9fa5\u3040-\u30FF]\)/\1 \2/g " 汉字在后。
        call cursor(b:curline, b:curcol)
    endif
endfunc
