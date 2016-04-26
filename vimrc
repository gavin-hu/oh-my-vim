" 环境变量 {{{
        let oh_my_vim = $OH_MY_VIM		" 获取环境变量 $OH_MY_VIM 如果不存在默认为 ~/.oh-my-vim
        if strlen(oh_my_vim) == 0
            let $OH_MY_VIM = "~/.oh-my-vim"
        endif
" }}}

" 加载vimrc.options 文件 {{{
    " 加载 Oh My Vim 默认 vimrc.options 配置
	source $OH_MY_VIM/vimrc.options
    " 加载 Oh My Vim 用户 vimrc.options 配置 
    if  filereadable(expand("~/.vimrc.options"))
    	source ~/.vimrc.options
    endif
" }}}

" 加载 vimrc.bundles 文件 {{{
    " 加载 Oh My Vim 默认 vimrc.bundles 配置
    source $OH_MY_VIM/vimrc.bundles
    " 加载 Oh My Vim 用户 vimrc.bundles 配置
    if filereadable(expand("~/.vimrc.bundles"))
        source ~/.vimrc.bundles
    endif
" }}}

" 设置基础配置 {{{
    set nocompatible        " 设置非兼容模式
" }}}

" 设置配色方案 {{{
    set background=dark
    colorscheme molokai
" }}}

" 优化编辑体验 {{{

    set gcr=a:block-blinkon0       " 禁止光标闪烁
    
    set guioptions-=l              " 禁用左侧滚动条
    set guioptions-=L              " 当在垂直分割窗口中时，禁用左侧滚动条
    set guioptions-=r              " 禁用右侧滚动条
    set guioptions-=R              " 当在垂直分割窗口中时，禁用右侧滚动条
    
    set guioptions-=m              " 禁止显示菜单
    set guioptions-=T              " 禁止显示工具条

    set laststatus=2               " 总是显示状态栏
    set number                     " 启用行号

    set cursorline                 " 高亮显示当前行
    " set cursorcolumn             " 高亮显示当前列

    set hlsearch                   " 高亮显示搜索结果
    set incsearch                  " 启用实时搜索

    set nowrap                     " 禁止折行

    syntax enable                  " 开启语法高亮
    syntax on                      " 允许用指定的语法高亮配色方案替换默认方案

    filetype indent on             " 自适应不同语言的智能缩进
    set expandtab                  " 将制表符扩展为空格
    set tabstop=4                  " 设置编辑时制表符占用空格数
    set shiftwidth=4               " 设置格式化时制表符占用空格数
    set softtabstop=4              " 让 vim 把连续数量的空格视为一个制表符

    set foldenable                 " 启用折叠
    set foldmethod=marker          " 设置折叠方式
" }}}

" 加载 vimrc.local 文件 {{{
    if filereadable(expand("~/.vimrc.local"))
        source ~/.vimrc.local
    endif
" }}}

