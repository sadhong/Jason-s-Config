"关闭与 Vi 的兼容
set nocompatible

"文件类型检测及相关功能
filetype on
filetype plugin on
filetype indent on

autocmd BufRead,BufNew *.md,*.mkd,*.markdown set filetype=markdown.mkd

"新建 Shell 脚本及 Python 文件时自动添加文件头信息
autocmd BufNewFile *.sh,*.py exec ":call AutoSetFileHead()"
    function! AutoSetFileHead()
    " .sh "
        if &filetype == 'sh'
            call setline(1, "\#!/bin/bash")
        endif

    " python"
        if &filetype == 'python'
            call setline(1, "\#!/usr/bin/env python")
            call append(1, "\# encoding: utf-8")
        endif
    
        normal G
        normal o
        normal o
    endfunc

"设置 vim 主题配色
syntax enable 
set background=dark
colorscheme solarized

"设置 vim 和系统剪贴板共用
set clipboard=unnamed

"设置覆盖文件时不保留备份
set nobackup

"高亮显示光标所在的行/列
set cursorline
set cursorcolumn

"在处理未保存或只读文件的时候，弹出确认
set confirm

"保存 500 条命令历史纪录
set history=500

"显示行号
set number

"搜索过程中智能忽略大小写
set ignorecase
set smartcase

"显示配对括号，时间为 2 秒
set showmatch
set matchtime=2

"高亮显示搜索结果
set hlsearch

"在搜索过程中实时高亮显示所输入的内容
set incsearch

"设置编码及相关
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936,big5,euc-jp,euc-kr,latin1
set langmenu=zh_CN.UTF-8
set helplang=cn

"启用鼠标
set mouse=a
set selection=exclusive
set selectmode=mouse,key

"设置鼠标右键黏贴
set paste

"制表符设置
set expandtab
set smarttab
set shiftround

"设置缩进及设置按下 tab 键后缩进的长度为 4 个空格
set shiftwidth=4
set tabstop=4
set softtabstop=4

"设置自动读取文件的外部改动
set autoread

"显示当前所处模式
set showmode

"在屏幕最后显示命令
set showcmd

"让 Vim 改变的配置即刻生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC 

"设置 setList 时的特殊字符样式
set listchars=space:▓,tab:¤¤,trail:◢

"设置状态行
set laststatus=2
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%][%{strftime(\"%Y年%m月%d日\ \%H:%M\")}]
