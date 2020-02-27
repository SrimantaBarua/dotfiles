" Configure neovim theme

set termguicolors
set background=dark

" let g:srcery_bold = 1
" let g:srcery_italic = 1
" colorscheme srcery

" colorscheme apprentice

" let ayucolor="dark"
" let ayucolor="mirage"
" colorscheme ayu

colorscheme base16-classic-dark

" Statusline
set laststatus=2
set statusline=%.20f  " Path to file
set statusline+=%m    " Modified flag
set statusline+=%r    " Modified flag
set statusline+=\ -\  " Separator
set statusline+=%y    " FileType of the file
set statusline+=%=    " Switch over to the right
set statusline+=%c    " Current column
set statusline+=%V    " Current column (virtual column)
set statusline+=:     " Separator
set statusline+=%l    " Current line
set statusline+=/     " Separator
set statusline+=%L    " Total lines
