" 语法检测插件ale
Plug 'w0rp/ale'

let g:ale_linters = {
            \   'sh' : ['shellcheck'],
            \   'vim' : ['vint'],
            \   'html' : ['tidy'],
            \   'python' : ['flake8'],
            \   'markdown' : ['mdl'],
            \   'javascript' : ['eslint'],
            \}

let g:ale_set_highlights = 0
" If emoji not loaded, use default sign
try
    let g:ale_sign_error = emoji#for('boom')
    let g:ale_sign_warning = emoji#for('small_orange_diamond')
catch
    " Use same sign and distinguish error and warning via different colors.
    let g:ale_sign_error = '•'
    let g:ale_sign_warning = '•'
endtry
let g:ale_echo_msg_format = '[#%linter%#] %s [%severity%]'
let g:ale_statusline_format = ['E•%d', 'W•%d', 'OK']

" For a more fancy ale statusline
function! ALEGetError()
    let l:res = ale#statusline#Status()
    if l:res ==# 'OK'
        return ''
    else
        let l:e_w = split(l:res)
        if len(l:e_w) == 2 || match(l:e_w, 'E') > -1
            return ' •' . matchstr(l:e_w[0], '\d\+') .' '
        endif
    endif
endfunction

function! ALEGetWarning()
    let l:res = ale#statusline#Status()
    if l:res ==# 'OK'
        return ''
    else
        let l:e_w = split(l:res)
        if len(l:e_w) == 2
            return ' •' . matchstr(l:e_w[1], '\d\+')
        elseif match(l:e_w, 'W') > -1
            return ' •' . matchstr(l:e_w[0], '\d\+')
        endif
    endif
endfunction

let g:ale_echo_msg_error_str = '✹ Error'
let g:ale_echo_msg_warning_str = '⚠ Warning'

nmap <Leader>en <Plug>(ale_next)
nmap <Leader>ep <Plug>(ale_previous)
nnoremap <Leader>ts :ALEToggle<CR>
