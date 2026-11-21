setl expandtab shiftwidth=4 tabstop=4 softtabstop=4

function! ledger#InsertLastDate()
	let l:view = winsaveview()
	call search('^[0-9-]\+ ', "bW")
	let l:line = getline(".")
	call winrestview(l:view)
	call setline(".", l:line)
	normal 0ElD
endfunction

imap <buffer> <Leader>./ <Esc>0C<Leader><C-d> 
imap <buffer> <Leader>.<Space> <Esc>:call ledger#InsertLastDate()<CR>A 

inoremap <buffer> <Leader>E <Esc>0C<Tab>; Event: 

inoremap <buffer> <Leader>a <Esc>0C<Tab>automotive<Tab><Tab><Tab><Tab>
inoremap <buffer> <Leader>b <Esc>0C<Tab>bills<Tab><Tab><Tab><Tab><Tab>
inoremap <buffer> <Leader>ca <Esc>0C<Tab>cash<Tab><Tab><Tab><Tab><Tab>
inoremap <buffer> <Leader>cs <Esc>0C<Tab>clutch_savings<Tab><Tab><Tab>
inoremap <buffer> <Leader>cn <Esc>0C<Tab>commissions<Tab><Tab><Tab><Tab>
inoremap <buffer> <Leader>ct <Esc>0C<Tab>commute<Tab><Tab><Tab><Tab><Tab>
inoremap <buffer> <Leader>cp <Esc>0C<Tab>computer<Tab><Tab><Tab><Tab>
inoremap <buffer> <Leader>d <Esc>0C<Tab>dental<Tab><Tab><Tab><Tab><Tab>
inoremap <buffer> <Leader>eo <Esc>0C<Tab>eating_out<Tab><Tab><Tab><Tab>
inoremap <buffer> <Leader>el <Esc>0C<Tab>electronics<Tab><Tab><Tab><Tab>
inoremap <buffer> <Leader>es <Esc>0C<Tab>emergency_savings<Tab><Tab>
inoremap <buffer> <Leader>en <Esc>0C<Tab>entertainment<Tab><Tab><Tab>
inoremap <buffer> <Leader>ev <Esc>0C<Tab>events<Tab><Tab><Tab><Tab><Tab>
inoremap <buffer> <Leader>fa <Esc>0C<Tab>fashion<Tab><Tab><Tab><Tab><Tab>
inoremap <buffer> <Leader>fi <Esc>0C<Tab>fitness<Tab><Tab><Tab><Tab><Tab>
inoremap <buffer> <Leader>fo <Esc>0C<Tab>food<Tab><Tab><Tab><Tab><Tab>
inoremap <buffer> <Leader>fd <Esc>0C<Tab>food_delivery<Tab><Tab><Tab>
inoremap <buffer> <Leader>gg <Esc>0C<Tab>given_gifts<Tab><Tab><Tab><Tab>
inoremap <buffer> <Leader>gl <Esc>0C<Tab>glovo<Tab><Tab><Tab><Tab><Tab>
inoremap <buffer> <Leader>gs <Esc>0C<Tab>goal_savings<Tab><Tab><Tab>
inoremap <buffer> <Leader>go <Esc>0C<Tab>government<Tab><Tab><Tab><Tab>
inoremap <buffer> <Leader>gr <Esc>0C<Tab>groceries<Tab><Tab><Tab><Tab>
inoremap <buffer> <Leader>ho <Esc>0C<Tab>hobbies<Tab><Tab><Tab><Tab><Tab>
inoremap <buffer> <Leader>ib <Esc>0C<Tab>ibkr<Tab><Tab><Tab><Tab><Tab>
inoremap <buffer> <Leader>in <Esc>0C<Tab>ing<Tab><Tab><Tab><Tab><Tab><Tab>
inoremap <buffer> <Leader>ii <Esc>0C<Tab>ing_interest<Tab><Tab><Tab>
inoremap <buffer> <Leader>if <Esc>0C<Tab>invest_fees<Tab><Tab><Tab><Tab>
inoremap <buffer> <Leader>jd <Esc>0C<Tab>jakdojade<Tab><Tab><Tab><Tab>
inoremap <buffer> <Leader>ko <Esc>0C<Tab>koleo<Tab><Tab><Tab><Tab><Tab>
inoremap <buffer> <Leader>md <Esc>0C<Tab>medical<Tab><Tab><Tab><Tab><Tab>
inoremap <buffer> <Leader>mi <Esc>0C<Tab>mikronika<Tab><Tab><Tab><Tab>
inoremap <buffer> <Leader>me <Esc>0C<Tab>misc_expenses<Tab><Tab><Tab>
inoremap <buffer> <Leader>ml <Esc>0C<Tab>misc_liabilities<Tab><Tab>
inoremap <buffer> <Leader>*m <Esc>0C<Tab>* misc_liabilities<Tab><Tab>
inoremap <buffer> <Leader>!m <Esc>0C<Tab>! misc_liabilities<Tab><Tab>
inoremap <buffer> <Leader>mp <Esc>0C<Tab>misplaced<Tab><Tab><Tab><Tab>
inoremap <buffer> <Leader>mo <Esc>0C<Tab>mobilet<Tab><Tab><Tab><Tab><Tab>
inoremap <buffer> <Leader>mu <Esc>0C<Tab>music<Tab><Tab><Tab><Tab><Tab>
inoremap <buffer> <Leader>na <Esc>0C<Tab>namecheap<Tab><Tab><Tab><Tab>
inoremap <buffer> <Leader>pa <Esc>0C<Tab>paypal<Tab><Tab><Tab><Tab><Tab>
inoremap <buffer> <Leader>pc <Esc>0C<Tab>personal_care<Tab><Tab><Tab>
inoremap <buffer> <Leader>ps <Esc>0C<Tab>personal_savings<Tab><Tab>
inoremap <buffer> <Leader>ph <Esc>0C<Tab>phone<Tab><Tab><Tab><Tab><Tab>
inoremap <buffer> <Leader>pp <Esc>0C<Tab>ppk<Tab><Tab><Tab><Tab><Tab><Tab>
inoremap <buffer> <Leader>pi <Esc>0C<Tab>ppk_interest<Tab><Tab><Tab>
inoremap <buffer> <Leader>rg <Esc>0C<Tab>received_gifts<Tab><Tab><Tab>
inoremap <buffer> <Leader>rn <Esc>0C<Tab>rent<Tab><Tab><Tab><Tab><Tab>
inoremap <buffer> <Leader>rv <Esc>0C<Tab>revolut<Tab><Tab><Tab><Tab><Tab>
inoremap <buffer> <Leader>sh <Esc>0C<Tab>shipping<Tab><Tab><Tab><Tab>
inoremap <buffer> <Leader>sn <Esc>0C<Tab>snacks<Tab><Tab><Tab><Tab><Tab>
inoremap <buffer> <Leader>so <Esc>0C<Tab>software<Tab><Tab><Tab><Tab>
inoremap <buffer> <Leader>sf <Esc>0C<Tab>student_fund<Tab><Tab><Tab>
inoremap <buffer> <Leader>ta <Esc>0C<Tab>tangible<Tab><Tab><Tab><Tab>
inoremap <buffer> <Leader>tr <Esc>0C<Tab>travel<Tab><Tab><Tab><Tab><Tab>
inoremap <buffer> <Leader>un <Esc>0C<Tab>university<Tab><Tab><Tab><Tab>
inoremap <buffer> <Leader>vi <Esc>0C<Tab>velobank_interest<Tab><Tab>
inoremap <buffer> <Leader>ve <Esc>0C<Tab>velokonto<Tab><Tab><Tab><Tab>
inoremap <buffer> <Leader>vs <Esc>0C<Tab>vision<Tab><Tab><Tab><Tab><Tab>
inoremap <buffer> <Leader>vp <Esc>0C<Tab>vps<Tab><Tab><Tab><Tab><Tab><Tab>
inoremap <buffer> <Leader>wi <Esc>0C<Tab>wise<Tab><Tab><Tab><Tab><Tab>
inoremap <buffer> <Leader>xt <Esc>0C<Tab>xtb<Tab><Tab><Tab><Tab><Tab><Tab>
