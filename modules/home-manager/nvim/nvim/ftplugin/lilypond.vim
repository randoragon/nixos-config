setl tabstop=4 shiftwidth=4

" Preview
nnoremap <buffer> <Leader>m :write \| AsyncRun lilypond -o "$VIM_PREVIEW_HOME/vim-preview" "%:p" 2>"$VIM_PREVIEW_HOME/vim-preview.log"<CR>
nnoremap <buffer> <Leader>M :write \| AsyncRun lyplay "%:p"<CR>
nnoremap <buffer> <Leader>.m :view $VIM_PREVIEW_HOME/vim-preview.log"<CR>:syn match Error '[Ee]rror:'<CR>:syn match DbgBreakPt '[Ww]arning:'<CR>GM
nnoremap <buffer> <Leader>p :AsyncRun setsid xdg-open "$VIM_PREVIEW_HOME/vim-preview.pdf"<CR>

" Commands
inoremap <buffer> <Leader>r \relative
inoremap <buffer> <Leader>t \time
inoremap <buffer> <Leader>.t \tempo
inoremap <buffer> <Leader>c \clef
inoremap <buffer> <Leader>k \key

" Common words
inoremap <buffer> <Leader>V Verse
inoremap <buffer> <Leader>C Chorus
inoremap <buffer> <Leader>P Prechorus
inoremap <buffer> <Leader>B Bridge
inoremap <buffer> <Leader>O Outro
inoremap <buffer> <Leader>I Intro
inoremap <buffer> <Leader>S Solo
inoremap <buffer> <Leader>R Breakdown
