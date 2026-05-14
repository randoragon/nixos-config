setl expandtab shiftwidth=4 tabstop=4 softtabstop=4

function! ledger#InsertLastDate()
	let l:view = winsaveview()
	call search('^[0-9-]\+ ', "bW")
	let l:line = getline(".")
	call winrestview(l:view)
	call setline(".", l:line)
	normal 0ElD
endfunction

imap <buffer> <Leader>d <Esc>0C<Leader><C-d> 
imap <buffer> <Leader>s <Esc>:call ledger#InsertLastDate()<CR>A 
inoremap <buffer> <Leader>a Assets:
inoremap <buffer> <Leader>e Expenses:
inoremap <buffer> <Leader>i Income:
inoremap <buffer> <Leader>l Liabilities:
inoremap <buffer> <Leader>q Equity:
