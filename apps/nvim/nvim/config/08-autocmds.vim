" Override syntax
augroup filetype_syntax
	autocmd!
	" asm files
	autocmd BufRead,BufNewFile *.asm setlocal filetype=nasm
	autocmd BufRead,BufNewFile *.asm setlocal syntax=nasm
	" C header files
	autocmd BufRead,BufNewFile *.h,*.c setlocal filetype=c
augroup END


" Set custom indentation for specific syntax
augroup filetype_indent
	autocmd!
	" Shell, ZSH, Python
	autocmd FileType sh,zsh,python,lua,json,javascript setlocal tabstop=4
	autocmd FileType sh,zsh,python,lua,json,javascript setlocal shiftwidth=4
	autocmd FileType sh,zsh,python,lua,json,javascript setlocal expandtab
	" XML, HTML
	autocmd FileType tex,css,html,xml setlocal tabstop=2
	autocmd FileType tex,css,html,xml setlocal shiftwidth=2
	autocmd FileType tex,css,html,xml setlocal expandtab
augroup END
