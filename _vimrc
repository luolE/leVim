" Identify platform {
let g:MAC = has('macunix')
let g:LINUX = has('unix') && !has('macunix') && !has('win32unix')
let g:WINDOWS = has('win32') || has('win64')
" }

"设置配置目录
if has("win32")
    let $VIMFILES = $VIM.'/vimfiles'
    let $MYVIM = 'D:/Software/leVim'
else
    let $VIMFILES = $HOME.'/.vim'
    let $MYVIM = $HOME.'/leVim'
endif

let $V = $MYVIM.'/init-vimrc.vim'
set runtimepath+=$VIMFILES
set runtimepath+=$MYVIM


" 自定义配置(leVim配置加载之前)
if !exists('g:VimrcIsLoad') && has("win32")

else

endif


"调用配置文件入口
source $V


" 自定义配置(leVim配置加载之后)
if !exists('g:VimrcIsLoad') && has("win32")
    " 字体设置(可以用set gfn=*指令查看字体名称)
    set guifont=DejaVuSansMonoForPowerline_Nerd:h10:cANSI:qDRAFT
    " 中文字体设置(同上，或在注册表中查询)
    set gfw=NSimsun:h10
    let g:airline_theme="molokai"
else
    set gfn=Monaco:h12
endif

