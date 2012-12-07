" ===================================================================
" file:  texfiles.vim
" Started: Sat Mar 17 11:56:06 PST 2001
" Last Modified: 2001-Mar-17 11:56:21 AM
" ===================================================================

augroup tex
	au!

  " Variables for texing
	autocmd BufEnter *.tex set wrapmargin=5 wrapscan
	autocmd BufEnter *.tex set cpoptions=BFst%
	autocmd BufEnter *.tex set include=\\\\\\(include\\\|input\\)
	autocmd BufLeave *.tex set include& wrapscan&

	" run latex on current file
	autocmd BufEnter *.tex map ,rl :!latex % 
	autocmd BufLeave *.tex unmap ,rl
	autocmd BufEnter *.tex map ,rx :!xdvi % 
	autocmd BufLeave *.tex unmap ,rx

augroup end
