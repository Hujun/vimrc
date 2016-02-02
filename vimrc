
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

set title

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

" search text highlight
set hlsearch
" increasement search, instant search with input
set incsearch
" case insensitive when search
set ignorecase
" case sensitive when there is more than one upcase
set smartcase

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

"===============================
" Hotkey Settings
"===============================

" quick enter command mode by mapping ; to :
nnoremap ; :

" treat long lines as break lines (useful when moving around in them)
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

" smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h 
map <C-l> <C-W>l 

" easy way to go to start and end of line
noremap H ^
noremap L $

" command mode enhancement, Ctrl-a to start of line, Ctrl-e to end of line
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" F1 ~ F6 settings

" disable F1 to avoid vim system help
noremap <F1> <Esc>

" F2 行号开关，用于鼠标复制代码用
" 为方便复制，用<F2>开启/关闭行号显示:
function! HideNumber()
    if(&relativenumber == &number)
        set relativenumber! number!
    elseif(&number)
        set number!
    else
        set relativenumber!
    endif
    set number?
endfunc
nnoremap <F2> :call HideNumber()<CR>

" F3 显示可打印字符开关
nnoremap <F3> :set list! list?<CR>

" F4 换行开关
nnoremap <F4> :set wrap! wrap?<CR>

" when in insert mode, press <F5> to go to paste mode
" where you can paste mass data that won't be autoindented
set pastetoggle=<F5>
" disable paste mode when leaving insert mode
au InsertLeave * set nopaste
" auto set paste mode when pasting in insert mode
" NOTE: seems not work....
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

" F6 语法开关，关闭语法可以加快大文件的展示
nnoremap <F6> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>

" map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
" 进入搜索Use sane regexes"
nnoremap / /\v
vnoremap / /\v

" keep search pattern at the center of the screen
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
" remove search highlight
noremap <silent><leader>/ :nohls<CR>

" switch # *
" nnoremap # *
" nnoremap * #

" tab swtich
map <leader>th :tabfirst<cr>
map <leader>tl :tablast<cr>

map <leader>tj :tabnext<cr>
map <leader>tk :tabprev<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprev<cr>

map <leader>te :tabedit<cr>
map <leader>td :tabclose<cr>
map <leader>tm :tabm<cr>

" normal模式下切换到确切的tab
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" new tab by Ctrl-t
nnoremap <C-t> :tabnew<CR> 
inoremap <C-t> <Esc>:tabnew<CR>

" y& -> Y
map Y y$

" copy to sys clipboard
vnoremap <leader>y "+y

" select block
nnoremap <leader>v V`}

" kj -> <Esc> in insert mode
inoremap kj <Esc>

" speed up scrolling of the viewport slightly
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

" U to <C-r> for easier redo
nnoremap U <C-r>

" quick edit/reload vimrc
nmap <silent> <leader>ev :e &MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" w!! to sudo & write a file
cmap w!! w !sudo tee >/dev/null %

"===============================
" Others
"===============================
" auto reload vimrc when it is modified (Windows)
autocmd! bufwritepost _vimrc source %
" auto reload vimrc when it is modified (Linux)
" NOTE: .vimrc dir
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

