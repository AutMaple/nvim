set nocompatible                        "设置vim在工作时不需要兼容vi, 一般是关闭兼容性开关
let mapleader = " "                     " 将<leader>设置成空格
set encoding=utf8                       " 设置编码方式为utf8
set autowriteall                        " 设置在文件之间跳转时，自动保存文件
set number                              " 打开行号和相对行号的开关
set relativenumber
set cursorline                          " 设置光标线
filetype on                             " vim打开文件时，自动进行文件类型检测
filetype indent on                      " 根据文件的类型，自动进行缩进
filetype plugin on                      " 自动加载对应文件类型的.vim插件,对应的.vim插件中会包括对应文件,类型的注释格式，智能补全函数等
set mouse=a                             " 设置鼠标在vim中是可用的
set nowrap                              " 当一行写不下时，自动在下一行进行显示，但不是换行
set scrolloff=7                         " 在光标上下滚动时，屏幕上下都会留有7行代码
set hlsearch                            " 搜索高亮
set incsearch                           " 开启实时搜索
set ignorecase                          " 设置在搜索时，忽略大小写
set smartcase                           " 搜索时智能判断是否忽略大小写
set showcmd                             " 在状态栏右下角显示输入的命令
set wildmenu                            " 在命令行模式下输入命令,按tab键可以给予提示
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent                          " 设置自动缩进
set smartindent
set background=dark
syntax on                               " 将语法检测打开
set foldmethod=manual                   " 代码折叠
" set t_Co=256                                  " 开启256色
" set updatetime=400                    " 设置交换文件写入磁盘的时间默认值(4000ms)
" filetype plugin indent on             " 相当于上面三个命令的简写体

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

let g:onedark_termcolors=256
colorscheme onedark

autocmd BufWritePost $MYVIMRC source $MYVIMRC       " 保存配置后立马生效

" 打开文件时，光标移动到上次关闭文件时光标所在的位置
autocmd BufReadPost *                               
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" 消除每次启动vim时高亮上一次搜索的结果
exec "nohlsearch"                       
