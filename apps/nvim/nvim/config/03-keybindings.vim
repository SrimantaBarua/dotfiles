" Configure custom keybindings

let mapleader=','

" Interface
nnoremap <leader>rl :setlocal relativenumber!<cr>
nnoremap <leader>nu :setlocal number!<cr>

" Fast buffer switching
nnoremap <leader><leader> :b#<cr>

" Edit ~/.vimrc
nnoremap <leader>ev :edit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Add quotes/brackets around current word
nnoremap <leader>" :viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' :viw<esc>a'<esc>bi'<esc>lel
nnoremap <leader>( :viw<esc>a)<esc>bi(<esc>lel
nnoremap <leader>{ :viw<esc>a}<esc>bi{<esc>lel
nnoremap <leader>[ :viw<esc>a]<esc>bi[<esc>lel

" Capitalize current word
nnoremap <leader><c-u> viwU
inoremap <leader><c-u> <esc>lviwUi

" Fzf
nnoremap <leader>ff :Files<cr>
nnoremap <leader>fb :Buffers<cr>
nnoremap <leader>fr :Rg<cr>
nnoremap <leader>fl :Lines<cr>
nnoremap <leader>fc :Commands<cr>

" LanguageClient - Maps K to hover, gd to goto definition, F2 to rename
nnoremap <silent> K :call LanguageClient_textDocument_hover()<cr>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<cr>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<cr>
