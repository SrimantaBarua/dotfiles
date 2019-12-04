" This file loads all plugins using Vim-Plug as the plugin manager

call plug#begin('~/.local/share/nvim/plugged')


" -------- Git ----------------

Plug 'tpope/vim-fugitive'


" -------- Fuzzy finding ----------------

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'


" -------- Language syntax ----------------

Plug 'rust-lang/rust.vim'   " Rust
Plug 'ziglang/zig.vim'      " Zig
Plug 'cespare/vim-toml'     " TOML


" -------- Language Server Protocol ----------------

Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }


" -------- Completion ----------------

Plug 'neoclide/coc.nvim', {'branch': 'release'}


" -------- Snippets ----------------

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'


" -------- Colorscheme ----------------

Plug 'srcery-colors/srcery-vim'


call plug#end()