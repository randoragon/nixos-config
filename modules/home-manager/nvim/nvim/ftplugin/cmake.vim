command LSPFileToggleCMake    lua lsp_toggle({
            \   name = "neocmakelsp",
            \   cmd  = {"neocmakelsp", "--stdio"},
            \   settings = require("lsp.settings.neocmakelsp"),
            \ })
command LSPProjectToggleCMake lua lsp_toggle({
            \   name = "neocmakelsp",
            \   cmd  = {"neocmakelsp", "--stdio"},
            \   settings = require("lsp.settings.neocmakelsp"),
            \ },
            \ {
            \  ".git",
            \  "Makefile", "makefile", "GNUmakefile",
            \  "CMakeLists.txt"
            \ })
nnoremap <buffer> <silent> <Leader>l :LSPFileToggleCMake<CR>
nnoremap <buffer> <silent> <Leader>L :LSPProjectToggleCMake<CR>
