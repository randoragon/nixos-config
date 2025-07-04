setl tabstop=4 shiftwidth=4

" Preview
nnoremap <buffer> <Leader>m :write \| AsyncRun typst compile -- "%:p" "$VIM_PREVIEW_HOME/vim-preview.pdf" 2>"$VIM_PREVIEW_HOME/vim-preview.log"<CR>
nnoremap <buffer> <Leader>M :write \| 5split \| terminal typst watch -- "%:p" "$VIM_PREVIEW_HOME/vim-preview.pdf"<CR><C-\><C-n>G<C-w>k
nnoremap <buffer> <Leader>.m :view $VIM_PREVIEW_HOME/vim-preview.log"<CR>:syn match Error '[Ee]rror:'<CR>:syn match DbgBreakPt '[Ww]arning:'<CR>GM
nnoremap <buffer> <Leader>p :AsyncRun setsid xdg-open "$VIM_PREVIEW_HOME/vim-preview.pdf"<CR>

" Misc
inoremap <buffer> <Leader>= #let  = [<,,>]<C-o>8h
inoremap <buffer> <Leader>- / : <,,><C-o>F:
inoremap <buffer> <Leader>C #columns()[<,,>]<C-o>F)
inoremap <buffer> <Leader>.C #colbreak()
inoremap <buffer> <Leader>f #footnote[] <,,><C-o>F]
inoremap <buffer> <Leader>f #footnote[] <,,><C-o>F]
inoremap <buffer> <Leader>P #pagebreak(weak: true)

" Text formatting
inoremap <buffer> <Leader>h #highlight[]<Left>
inoremap <buffer> <Leader>l #link("") <,,><C-o>F"
inoremap <buffer> <Leader>u #underline[]<Left>
inoremap <buffer> <Leader>s #strike[]<Left>
inoremap <buffer> <Leader>o #overline[]<Left>
inoremap <buffer> <Leader>_ #sub[]<Left>
inoremap <buffer> <Leader>^ #super[]<Left>
inoremap <buffer> <Leader>c #smallcaps[]<Left>
inoremap <buffer> <Leader>e $$ <,,><C-o>F$
inoremap <buffer> <Leader>E $  $<Left><Left>

" Figures
inoremap <buffer> <Leader>F #figure(<CR><CR><Tab>caption: [<,,>],<CR>) <,,><Esc>2kS
inoremap <buffer> <Leader>I image("", width: 100%),<C-o>F"
nnoremap <buffer> <Leader>is :call sshot#ImportScreenshot(function('sshot#TypstScreenshot'), '.png')<CR>

" Tables
inoremap <buffer> <Leader>tt #table(<CR><Tab>columns: (),<CR><Tab>align: (<,,>),<CR><Tab>table.header[<,,>],<CR>)<Esc><<3kf)i
inoremap <buffer> <Leader>th table.hline()
inoremap <buffer> <Leader>tv table.vline()
inoremap <buffer> <Leader>tc table.cell(colspan: , [<,,>])<C-o>8h
inoremap <buffer> <Leader>tr table.cell(rowspan: , [<,,>])<C-o>8h

" Shortcut for inserting a new subfile
function NewSubfileTypst()
    let filepath = expand('<cfile>')
    if empty(filepath)
        return 0
    endif
    let filepath = filepath.'.typ'

    if filepath[0] == '/'
        let bufnr = bufadd(filepath)
    else
        let filedir = system(['dirname', '--', filepath])[0:-2]
        let bufnr = bufadd(expand('%:p:h').'/'.filepath)
    endif
    call setline('.', '#include("'.filepath.'")')
    write

    return bufnr
endfunction
nnoremap <silent> <buffer> <Leader>if :silent let _newsubfile = NewSubfileTypst()<CR>
    \ :echo _newsubfile . " " . type(_newsubfile) \|
    \ :silent if type(_newsubfile) == v:t_number \| call bufload(_newsubfile) \|
    \ exec 'buf '._newsubfile[0] \| endif<CR>

command LSPFileToggleTypst    lua lsp_toggle({
            \   name = "tinymist",
            \   cmd  = {"tinymist"},
            \   settings = require("lsp.settings.tinymist"),
            \ })
command LSPProjectToggleTypst lua lsp_toggle({
            \   name = "tinymist",
            \   cmd  = {"tinymist"},
            \   settings = require("lsp.settings.tinymist"),
            \ },
            \ {
            \  ".git",
            \  "Makefile", "makefile", "GNUmakefile",
            \  "main.typ"
            \ })
function TinymistPinMainFile()
    " https://forum.typst.app/t/how-can-i-make-label-references-work-across-multiple-files-with-neovim-tinymist/2275
    " b:active_lsp_client is my own conventional variable
    if !exists("b:active_lsp_client")
        echom "[TinymistPinMainFile] Tinymist is not running."
        return
    endif
    lua vim.lsp.get_client_by_id(vim.b.active_lsp_client):exec_cmd({
            \ command = "tinymist.pinMain",
            \ arguments = { vim.api.nvim_buf_get_name(0) }
            \ })
    echom "[TinymistPinMainFile] Pinned current file as main."
endfunction
nnoremap <buffer> <silent> <Leader>l :LSPFileToggleTypst<CR>
nnoremap <buffer> <silent> <Leader>L :LSPProjectToggleTypst<CR>
nnoremap <buffer> <silent> <Leader>./L :call TinymistPinMainFile()<CR>
