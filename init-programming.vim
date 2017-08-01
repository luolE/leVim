" 编程常用技能包

" 自动添加文件头部
function!  s:add_title()
    if &filetype == 'sh'
        call setline(1,'#!/usr/bin/env bash')
        call append(line('.'), '')
    elseif &filetype == 'python'
        call setline(1,'#!/usr/bin/env python')
        call append(line('.'), '# -*- coding: utf-8 -*-')
        call append(line('.')+1, '')
    elseif &filetype == 'ruby'
        call setline(1,'#!/usr/bin/env ruby')
        call append(line('.'), '# encoding: utf-8')
        call append(line('.')+1, '')
    elseif &filetype == 'cpp'
        call setline(1, '#include <iostream>')
        call append(line('.'), 'using namespace std;')
        call append(line('.')+1, '')
    elseif &filetype == 'c'
        call setline(1, '#include <stdio.h>')
        call append(line('.'), '')
    endif
endfunction

augroup SPACEVIM_NEWFILE
    autocmd!
    autocmd BufNewFile *.py,*.rb,*.cpp,*.c,*.sh,*.java execute "call s:add_title()"
    autocmd BufNewFile * normal 2G
augroup END
