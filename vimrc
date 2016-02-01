
"================================
" General Settings
"================================

" IMPORTANT
" change lead key
let mapleader = ','
let g:mapleader = ','

syntax on

" TODO: install bundle

set history=2000

filetype on
" enable indent based on file type detection
filetype indent on
" enable plugin
filetype plugin on
" ensure file type detection works by  including this after bundle
" installation
filetype plugin indent on

" uncomment following line and comment nobackup
" if need backup file
" set backup
" set backupext=.bak
" set backupdir=/tmp/bimbk
" no backup file
set nobackup
" no swap file
set noswapfile

" remember info about open buffers on close
set viminfo^=%

" for regular expressions turn magic on
set magic

set autoread

"================================
" Display Settings
"================================

" highlight cursor
set cursorcolumn
set cursorline
" show current line number and column number in right down corner
set ruler

" show inputting command
set showcmd
" show vim mode in left down corner
set showmode

" show line number
set number

" cancel wrap
set nowrap

" match and highlight brackets
set showmatch
" how many thenths of second to blink when matching brackets
set matchtime=2

" indent config
set smartindent
set autoindent

" tab config
set tabstop=4
" indent width for each tab
set shiftwidth=4
" space width to be deleted when remove tab
set softtabstop=4
" insert tabs on the start of a line according to shiftwidth, not tabstop
set smarttab
" auto transfer tab to space
" use [Ctrl + V + Tab] to input tab if needed
set expandtab
" use multiple of shiftwieth when indenting with '<' and '>'
set shiftround

" 相对行号: 行号变成相对，可以用 nj/nk 进行跳转
set relativenumber number
au FocusLost * :set norelativenumber number
au FocusGained * :set relativenumber
" 插入模式下用绝对行号, 普通模式下用相对
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber
function! NumberToggle()
    if(&relativenumber == 1)
        set norelativenumber number
    else
        set relativenumber
    endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>

"===============================
" File Encode Settings
"===============================

set encoding=utf-8
" use following order when trying to encode & decode
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" use Unix as the standard file type
set ffs=unix,dos,mac


" to accelearte inputting
" 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=m
" 合并两行中文时，不在中间加空格
set formatoptions+=B

"===============================
" Others
"===============================

" auto reload vimrc when it is modified (Windows)
autocmd! bufwritepost _vimrc source %
" auto reload vimrc when it is modified (Linux)
autocmd! bufwritepost .vimrc source %

" auto complete for vimrc config
" see VimTip1228
set completeopt=longest,menu

" 增强模式中的命令行自动完成操作
set wildmenu
" ignore compiled files
set wildignore=*.o,*~,*.pyc,*.class

" 打开自动定位到最后编辑的位置, 需要确认 .viminfo 当前用户可写
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"===============================
" File Type Settings
"===============================

autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType ruby,javascript,html,css,xml set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
autocmd BufRead,BufNewFile *.md,*.mkd,*.markdown set filetype=markdown.mkd
autocmd BufRead,BufNewFile *.part set filetype=html

" 定义函数AutoSetFileHead，自动插入文件头
" autocmd BufNewFile *.sh,*.py exec ":call AutoSetFileHead()"
function! AutoSetFileHead()
    " 如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1, "\#!/bin/bash")
    endif

    "如果文件类型为python
    if &filetype == 'python'
        call setline(1, "\#!/usr/bin/env python")
        call append(1, "\# encoding: utf-8")
    endif

    normal G
    normal o
    normal o
endfunc

" 设置可以高亮的关键字
if has("autocmd")
    " Highlight TODO, FIXME, NOTE, etc.
    if v:version > 701
        autocmd Syntax * call matchadd('Todo', '\W\zs\(TODO\|FIXME\|CHANGED\|DONE\|XXX\|BUG\|HACK\)')
        autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)')
    endif
endif

"===============================
" Theme Settings
"===============================

set background=dark
set t_Co=256

" colorscheme solarized
" colorscheme molokai
" colorscheme desert
