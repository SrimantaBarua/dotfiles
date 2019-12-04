" Configuration for the LanguageClient plugin

set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript' : ['javascript-typescript-stdio'],
    \ 'cpp' : ['clangd'],
    \ 'c' : ['clangd'],
    \ 'python' : ['pyls'],
    \ }

let g:LanguageClient_autoStart = 1

let g:LanguageClient_diagnosticsSignsMax = 0
