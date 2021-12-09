" 插件相关的配置
call plug#begin('~/.nvim/plugged/')
Plug 'vim-airline/vim-airline'
Plug 'junegunn/vim-easy-align'
Plug 'preservim/tagbar'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'dhruvasagar/vim-table-mode'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'kevinoid/vim-jsonc'
Plug 'mhinz/vim-startify'
Plug 'honza/vim-snippets'
Plug 'Yggdroot/indentLine'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'preservim/nerdcommenter'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'lervag/vimtex'
Plug 'xuhdev/vim-latex-live-preview'
Plug 'junegunn/vim-peekaboo'
Plug 'tpope/vim-surround'
Plug 'TaDaa/vimade'
Plug 'gcmt/wildfire.vim' 
Plug 'ryanoasis/vim-devicons'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'christianchiarulli/nvcode-color-schemes.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
call plug#end()
