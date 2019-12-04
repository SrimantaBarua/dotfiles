" 1. Load all plugins ================
source ~/.config/nvim/config/01-vim-plug.vim


" 2. Standard editor options ================
set nocompatible
set tabstop=8
set softtabstop=8
set noexpandtab
filetype plugin indent on
syntax enable
set number
set showcmd
set wildmenu
set autoindent
set smartindent
set lazyredraw
set hlsearch
set incsearch
set cursorline
set textwidth=100
set colorcolumn=100
set showmatch
set path+=**


" 3. View man pages in vim ================
runtime ftplugin/man.vim


" 4. Configure theme ================
source ~/.config/nvim/config/02-theme.vim


" 5. Keybindings ================
source ~/.config/nvim/config/03-keybindings.vim


" 6. Plugin configs ===============
source ~/.config/nvim/config/04-language-client.vim
source ~/.config/nvim/config/05-fzf.vim
source ~/.config/nvim/config/06-ultisnips.vim
source ~/.config/nvim/config/07-coc.vim


" 7. Autocmds ================
source ~/.config/nvim/config/08-autocmds.vim

" Deoplete ----------------
" let g:deoplete#enable_at_startup = 1
" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | silent! pclose | endif
