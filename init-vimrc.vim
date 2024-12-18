"关闭vi兼容
set nocompatible
let mapleader = "\<Space>"


" 设置控制台颜色
set t_Co=256

" 设置主题(http://bytefluent.com/vivify/)
colorscheme BusyBee

" 自动切换当前目录
set autochdir

" Windows GUI
if has("gui")
    " 设置启动窗口大小
    set lines=35 columns=118
    
    " 语言设置
    set langmenu=zh_CN.UTF-8
    language message zh_CN.UTF-8
    set helplang=cn
endif

" 检测文件类型
filetype plugin indent on

" 编码设置
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936


" 设置中文编码后需重置菜单
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" ----------------------- Vundle End ---------------------------
if has("win32")
    call plug#begin('$VIM/vimfiles/bundle/')
else
    call plug#begin('~/.vim/bundle/')
endif

" 控制台光标显示(I/N模式)插件
Plug 'jszakmeister/vim-togglecursor'

" 主题选择插件
Plug 'vim-scripts/Color-Scheme-Explorer'

" git集成
Plug 'tpope/vim-fugitive'

" 启动显示最近文件以及保存的Session(SSave/SLoad)
Plug 'mhinz/vim-startify'

" 模板插件(ultisnips)
" 自动弹出补全提示(AutoComplPop)
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'jordwalke/VimCompleteLikeAModernEditor'
Plug 'jordwalke/AutoComplPop'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<C-R>=UltiSnips#ExpandSnippet()"

" Ctrl-P 一键搜索
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
let g:ctrlp_map = '<Leader>p'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_extensions = ['line', 'funky']
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_funky_syntax_highlight = 1

" AirLine 增强状态栏
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"这个是安装字体后 必须设置此项"
if has("win32")
    let g:airline_powerline_fonts = 1
endif
"打开tabline功能,方便查看Buffer和切换，这个功能比较不错"
"我还省去了minibufexpl插件，因为我习惯在1个Tab下用多个buffer"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
"设置切换Buffer快捷键"
nnoremap <C-n> :bn<CR>
nnoremap <C-p> :bp<CR>

" 光标定位神器
Plug 'easymotion/vim-easymotion'
let g:EasyMotion_leader_key = '<space>'
let g:EasyMotion_keys = 'qwerasdfuiopjkl;'
let g:EasyMotion_smartcase = 1
"let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap <Leader>s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

nmap <Leader>w <Plug>(easymotion-bd-w)
xmap <Leader>w <Plug>(easymotion-bd-w)
omap <Leader>w <Plug>(easymotion-bd-w)

nmap <Leader>W <Plug>(easymotion-bd-W)
xmap <Leader>W <Plug>(easymotion-bd-W)
omap <Leader>W <Plug>(easymotion-bd-W)

map <Leader><Leader> <Plug>(easymotion-overwin-w)


" 编程常用技能包
source $MYVIM/init-programming.vim

" 语法检测插件ale
source $MYVIM/init-plug-ale.vim

" Python语言配置
source $MYVIM/init-plug-python.vim

" 批量注释代码
Plug 'scrooloose/nerdcommenter'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }
" NERDTree快捷键
nmap <F2> :NERDTreeToggle  <CR>
nnoremap <leader>ma :set mouse=a<cr>
nnoremap <leader>mu :set mouse=<cr>
" 显示行号
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
" 是否显示隐藏文件
let NERDTreeShowHidden=1
" 设置宽度
let NERDTreeWinSize=30
" 显示书签列表
let NERDTreeShowBookmarks=1
" 改变nerdtree的箭头
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'


call plug#end()
" ----------------------- Vundle End ---------------------------



" ========================== 备份相关设置 ============================
" 开启备份
set backup 
" 指定备份文件辍
set backupext=.vbak
" 备份目录
if !isdirectory($VIMFILES.'/_backup_file')
    call mkdir($VIMFILES.'/_backup_file')
endif
set backupdir=$VIMFILES/_backup_file

" 重启后撤销历史可用 persistent undo 
if !isdirectory($VIMFILES.'/_undo_file')
    call mkdir($VIMFILES.'/_undo_file')
endif

set undofile
set undodir=$VIMFILES/_undo_file
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000

" 临时备份目录
if !isdirectory($VIMFILES.'/_swap_file')
    call mkdir($VIMFILES.'/_swap_file')
endif
set directory=$VIMFILES/_swap_file
" ====================================================================


"搜索忽略大小写
set ignorecase 

"搜索逐字符高亮
set incsearch

"命令行tab补全方式改为列表式
set wildmode=list:full

"行内替换
set gdefault

"始终显示行号
set nu

"显示光标的坐标
set ruler

"设置Tab键的宽度
set shiftwidth=4
set tabstop=4

"将Tab键更改为四个空格
set expandtab

" 设置按BackSpace的时候可以一次删除掉4个空格
set softtabstop=4

" 设置Backspace删除模式(解决设置缩进模式后中文无法删除问题)
set backspace=indent,eol,start

" 智能自动缩进
set smartindent
"显示括号配对情况
set showmatch

" 显示Tab符
set list
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<

"根据编辑模式更改输入法光标颜色，同时禁用IME自动切换
if has('multi_byte_ime')
    hi Cursor guifg=bg guibg=Orange gui=NONE
    hi CursorIM guifg=NONE guibg=Skyblue gui=NONE
    set iminsert=0 imsearch=0
endif

" 切换Buffer时,不被(未保存)打断
set hidden

"与Windows共享剪贴板
set clipboard+=unnamed

if !exists('g:VimrcIsLoad') && has("win32")
    set guioptions-=m " 隐藏菜单栏
    set guioptions-=T " 隐藏工具栏
    "set guioptions-=L " 隐藏左侧滚动条
    "set guioptions-=r " 隐藏右侧滚动条
    "set guioptions-=b " 隐藏底部滚动条
    "set showtabline=0 " Tab栏
    " 显示状态栏 (默认值为 1, 无法显示状态栏)
    set laststatus=2
    " 设置在状态行显示的信息
    "set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ [%{(&fenc==\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ %c:%l/%L%)
endif

" 插入模式下上下左右移动光标
inoremap <a-h> <left>
inoremap <a-l> <right>
inoremap <a-j> <c-o>gj
inoremap <a-k> <c-o>gk

" 重置所有窗口布局为垂直分割
nnoremap <F12> :windo wincmd H<CR>

" 重定义窗口移动快捷键
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" 设置窗口分割方式
"set splitbelow
set splitright
