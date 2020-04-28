" vim:fileencoding=utf-8:foldmethod=marker

" vim-plug {{{

call plug#begin('~/.local/share/nvim/plugged')

" language syntax {{{

Plug 'rust-lang/rust.vim'

" }}}

" lsp {{{

" Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }

" }}}

" completion {{{

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" }}}

" fuzzy find {{{

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" }}}

" snippets {{{

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" }}}

" ui {{{

" Startify for the startup screen
Plug 'mhinz/vim-startify'

" Plug 'chriskempson/base16-vim'
Plug 'ayu-theme/ayu-vim'

" Lightline as a status line
Plug 'itchyny/lightline.vim'

" Ayu-theme for lightline
Plug 'yarisgutierrez/ayu-lightline'

"}}}

" ux {{{

" vim-vinegar to enhance netrw
Plug 'tpope/vim-vinegar'

" auto-pair for automatic pair completion
Plug 'jiangmiao/auto-pairs'

" vim-surround to manipulate surrounding context
Plug 'tpope/vim-surround'

" Smooth scrolling with vim-smoothie
" Plug 'psliwka/vim-smoothie'

" }}}

call plug#end()

" }}}

" basic setup {{{

set nocompatible
filetype plugin indent on
syntax enable

set tabstop=8
set softtabstop=8
set noexpandtab
set autoindent
set smartindent

set cursorline
set textwidth=100
set colorcolumn=100

set wildmenu

set showcmd

set number

set hlsearch
set incsearch

set lazyredraw

" }}}

" theme {{{

set termguicolors
set background=dark

" colorscheme base16-classic-dark
let ayucolor="mirage"
colorscheme ayu

" }}}

" open man pages inside neovim
runtime ftplugin/man.vim

" custom code {{{

" floating fzf {{{

function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')
 
  let height = float2nr(&lines / 2)
  let width = float2nr(&columns / 2)
  let horizontal = float2nr(&columns / 4)
  let vertical = 2
 
  let opts = {
        \ 'relative': 'editor',
        \ 'row': vertical,
        \ 'col': horizontal,
        \ 'width': width,
        \ 'height': height,
        \ 'style': 'minimal'
        \ }
 
  call nvim_open_win(buf, v:true, opts)
endfunction

" }}}

" }}}

" plugin config {{{

" language client {{{

" set hidden

" let g:LanguageClient_serverCommands = {
    " \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    " \ 'javascript' : ['javascript-typescript-stdio'],
    " \ 'cpp' : ['clangd'],
    " \ 'c' : ['clangd'],
    " \ 'python' : ['pyls'],
    " \ }

" let g:LanguageClient_autoStart = 1
" let g:LanguageClient_diagnosticsSignsMax = 0

" }}}

" fzf {{{

" customize fzf colors to match the color scheme
let g:fzf_colors =
    \ { 'fg':    ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'Comment'],
    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    \ 'hl+':     ['fg', 'Statement'],
    \ 'info':    ['fg', 'PreProc'],
    \ 'border':  ['fg', 'Ignore'],
    \ 'prompt':  ['fg', 'Conditional'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'marker':  ['fg', 'Keyword'],
    \ 'spinner': ['fg', 'Label'],
    \ 'header':  ['fg', 'Comment'] }

" fzf in floating window
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

" }}}

" ultisnips {{{

let g:UltiSnipsSnippetDirectories=["UltiSnips", "my_snippets"]

" }}}

" lightline {{{

let g:lightline = {
\    'colorscheme' : 'ayu',
\    'active' : {
\        'left' : [ [ 'mode', 'paste' ],
\                   [ 'readonly', 'filename', 'modified' ] ],
\        'right' : [ [ 'lineinfo' ],
\                    [ 'percent' ],
\                    [ 'fileformat', 'fileencoding', 'filetype' ] ]
\    }
\}

let g:lightline.separator = {
	\   'left': '', 'right': ''
  \}
let g:lightline.subseparator = {
	\   'left': '', 'right': '' 
  \}

" }}}

" coc.nvim {{{

" TextEdit may fail if hidden is not set
set hidden

" Some servers have issues with backup files
set nobackup
set nowritebackup

" Shorter update times (default is 4000 = 4s)
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time diagnostics appear/become
" resolved.
set signcolumn=yes

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" }}}

" }}}

" autocmds {{{

" override filetype and syntax for file extensions {{{

augroup filetype_syntax
    autocmd!
    " asm files
    autocmd BufRead,BufNewFile *.asm setlocal filetype=nasm
    autocmd BufRead,BufNewFile *.asm setlocal syntax=nasm

    " C header files
    autocmd BufRead,BufNewFile *.h,*.c setlocal filetype=c
augroup END

" }}}

" set custom indentation for specific filetypes {{{

augroup filetype_indent
    autocmd!
    " Shell, ZSH, Python
    autocmd FileType vim,toml,yaml,sh,zsh,python,lua,json,javascript setlocal tabstop=4
    autocmd FileType vim,toml,yaml,sh,zsh,python,lua,json,javascript setlocal shiftwidth=4
    autocmd FileType vim,toml,yaml,sh,zsh,python,lua,json,javascript setlocal expandtab

    " XML, HTML
    autocmd FileType tex,css,html,xml setlocal tabstop=2
    autocmd FileType tex,css,html,xml setlocal shiftwidth=2
    autocmd FileType tex,css,html,xml setlocal expandtab

    " Markdown
    autocmd FileType markdown setlocal expandtab
augroup END

" }}}

" keybindings for filetypes {{{

lua require("float_term")

augroup filetype_keybind
    autocmd!
    " Rust
    autocmd FileType rust nnoremap <buffer> <leader>lf :RustFmt<cr>
    autocmd FileType rust nnoremap <buffer> <leader>C :lua FloatTerm("cargo build")<cr>
    autocmd FileType rust nnoremap <buffer> <leader>R :lua FloatTerm("cargo run")<cr>
    autocmd FileType rust nnoremap <buffer> <leader>T :lua FloatTerm("cargo test")<cr>

    " C++
    autocmd FileType cpp nnoremap <buffer> <leader>C :lua FloatTerm("g++ " . expand("%:p") . " -o " . expand("%:p:r"))<cr>
    autocmd FileType cpp nnoremap <buffer> <leader>R :lua FloatTerm("g++ " . expand("%:p") . " -o " . expand("%:p:r") . " && " . expand("%:p:r"))<cr>
augroup END

" }}}

" coc.nvim {{{

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup coc_group
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" }}}

" }}}

" keybindings {{{

let mapleader=','

" interface {{{

" toggle relative line numbers
nnoremap <leader>rl :setlocal relativenumber!<cr>

" toggle line numbers
nnoremap <leader>ll :setlocal number!<cr>

" open floating terminal
nnoremap <leader>tt :lua FloatTerm({"/bin/zsh"})<cr>

" }}}

" buffer switching {{{

" switch to last buffer
nnoremap <leader><leader> :b#<cr>

" }}}

" edit ~/.vimrc {{{

" edit vimrc
nnoremap <leader>ev :edit $MYVIMRC<cr>

" source vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" }}}

" add quotes/brackets around current word {{{

nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
nnoremap <leader>( viw<esc>a)<esc>bi(<esc>lel
nnoremap <leader>{ viw<esc>a}<esc>bi{<esc>lel
nnoremap <leader>[ viw<esc>a]<esc>bi[<esc>lel

" }}}

" capitalize current word {{{

nnoremap <leader><c-u> viwU
inoremap <leader><c-u> <esc>lviwUi

"}}}

" fzf {{{

nnoremap <leader>ff :Files<cr>
nnoremap <leader>fb :Buffers<cr>
nnoremap <leader>fr :Rg<cr>
nnoremap <leader>fl :Lines<cr>
nnoremap <leader>fc :Commands<cr>

" }}}

" coc.nvim {{{

if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>ca  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>ce  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>cc  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>co  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>cs  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>cj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>ck  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>cp  :<C-u>CocListResume<CR>

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin before
" putting this into your config.
" inoremap <silent><expr> <TAB>
      " \ pumvisible() ? "\<C-n>" :
      " \ <SID>check_back_space() ? "\<TAB>" :
      " \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" function! s:check_back_space() abort
  " let col = col('.') - 1
  " return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" Use <c-space> to trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position. Coc only
" does snippet and additional edit on confirm.

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
" nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
" nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
" xmap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap if <Plug>(coc-funcobj-i)
" omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
" nmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <TAB> <Plug>(coc-range-select)

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" }}}

" copying to clipboard {{{

vnoremap Y :w !xclip -selection c<cr><cr>
nnoremap YY gg0vG$Y

" }}}
