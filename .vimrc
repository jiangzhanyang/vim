" 设置配色方案
"colorscheme torte
"colorscheme murphy
"colorscheme desert 
"colorscheme desert 
"colorscheme elflord
"colorscheme ron

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 实用设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set shortmess=atI			" 启动的时候不显示那个援助乌干达儿童的提示  
"winpos 5 5					" 设定窗口位置  
"set lines=40 columns=155	" 设定窗口大小  
"color asmanian2			" 设置背景主题  
"set guifont=Courier_New:h10:cANSI	" 设置字体  
"autocmd InsertLeave * se nocul		" 用浅色高亮当前行  
"autocmd InsertEnter * se cul		" 用浅色高亮当前行  
set showcmd					" 输入的命令显示出来，看的清楚些  
set novisualbell			" 不要闪烁(不明白)  
"set foldenable				" 允许折叠  
"set foldmethod=manual		" 手动折叠  
"set background=dark		" 背景使用黑色
set autoread				" 设置当文件被改动时自动载入
set completeopt=preview,menu		"代码补全 
"set nobackup				" 从不备份  
set autowrite				" 自动保存
set ruler                   " 打开状态栏标尺
set cursorline              " 突出显示当前行
set magic                   " 设置魔术
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏
set foldcolumn=0
set foldlevel=3 
set nocompatible			" 不要使用vi的键盘模式，而是vim自己的
set syntax=on				" 语法高亮
set noeb					" 去掉输入错误的提示声音
set confirm					" 在处理未保存或只读文件的时候，弹出确认
set autoindent				" 自动缩进,延用上一行的缩紧
set cindent					" 缩进可以设置不同风格的缩进
set tabstop=4				" Tab键的宽度
set softtabstop=4			" 统一缩进为4
set shiftwidth=4			" 缩进的长度
set noexpandtab				" 不要用空格代替制表符
set smarttab				" 在行和段开始处使用制表符
set number					" 显示行号
set history=1000			" 历史记录数
"set nobackup				" 禁止生成临时文件
set noswapfile				" 不使用swp文件，推出后无法恢复
set ignorecase				" 搜索忽略大小写
set hlsearch				" 搜索逐字符高亮
set incsearch				" 查找在输入的过程中显示匹配点
set gdefault				" 行内替换
set enc=utf-8				" 编码设置
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936	"打开文件进行解码的猜测列表
set langmenu=zh_CN.UTF-8	
set helplang=cn				" 语言设置
set cmdheight=1				" 命令行（在状态行下）的高度，默认为1，这里是2
filetype on					" 侦测文件类型
filetype plugin on			" 载入文件类型插件
filetype indent on			" 为特定文件类型载入相关缩进文件
set viminfo+=!				" 保存全局变量
set iskeyword+=_,$,@,%,#,-	" 带有如下符号的单词不要被换行分割
set linespace=0				" 字符间插入的像素行数目
set wildmenu				" 增强模式中的命令行自动完成操作
set backspace=2				" 使回格键（backspace）正常处理indent, eol, start等
"set whichwrap+=<,>,h,l		" 允许backspace和光标键跨越行边界
set mouse=a					" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set selection=exclusive
set selectmode=mouse,key
set report=0				" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set showmatch				" 高亮显示匹配的括号
set matchtime=1				" 匹配括号高亮的时间（单位是十分之一秒）
set scrolloff=3				" 光标移动到buffer的顶部和底部时保持3行距离

" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\	

" 高亮显示普通txt文件（需要txt.vim脚本）
au BufRead,BufNewFile *  setfiletype txt

set laststatus=1			" 启动显示状态行(1),总是显示状态行(2)  
" 显示行的内状态容（包括文件类型和解码）
"set statusline=%f%m%r%h%w\ [format=%{&ff}]\ [type=%y]\ [pos=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %h:%m\")}
"set statusline=\ %<%f[%1*%m%*%n%r%h]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%l%)\
"set statusline=[%f]%y%r%m%*%=[line:%l/%l,column:%c][%p%%]

"自动补全
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {<CR>}<ESC>O
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
function! ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 文件标题
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()" 
"定义函数SetTitle，自动插入文件头 
func SetTitle() 
	"如果文件类型为.sh文件 
	if &filetype == 'sh' 
		call setline(1,"\#########################################################################") 
		call append(line("."), "\# File Name: ".expand("%")) 
		call append(line(".")+1, "\# Author: jiangzhanyang") 
		call append(line(".")+2, "\# mail: 499872907@qq.com") 
		call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
		call append(line(".")+4, "\#########################################################################") 
		call append(line(".")+5, "\#!/bin/bash") 
		call append(line(".")+6, "") 
	else 
		call setline(1,"/*************************************************************************") 
		call append(line("."), "	> File Name: ".expand("%")) 
		call append(line(".")+1, "	> Author: jiangzhanyang") 
		call append(line(".")+2, "	> Mail: 499872907@qq.com ") 
		call append(line(".")+3, "	> Created Time: ".strftime("%c")) 
		call append(line(".")+4, " ************************************************************************/") 
		call append(line(".")+5, "")
	endif
	if &filetype == 'cpp'
		call append(line(".")+6, "#include<iostream>")
		call append(line(".")+7, "using namespace std;")
		call append(line(".")+8, "")
	endif
	if &filetype == 'c'
		call append(line(".")+6, "#include<stdio.h>")
		call append(line(".")+7, "")
	endif
	"	if &filetype == 'java'
	"		call append(line(".")+6,"public class ".expand("%"))
	"		call append(line(".")+7,"")
	"	endif
	"新建文件后，自动定位到文件末尾
	autocmd BufNewFile * normal G
endfunc 

"NERDtree设定
let NERDChristmasTree=1
let NERDTreeAutoCenter=1
let NERDTreeBookmarksFile=$VIM.'\Data\NerdBookmarks.txt'
let NERDTreeMouseMode=2
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
let NERDTreeWinPos='left'
let NERDTreeWinSize=31
"nnoremap f :NERDTreeToggle
map <F7> :NERDTree<CR>  
