"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"                  Vim stuff for C file editing
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup java 
	au!

    """"""""""""""""""""""""Java"""""""""""""""""""""""""""""""""""""""""""""""""

	"  Options for Java editing
	autocmd BufEnter {*.java} set formatoptions+=croq2 formatoptions-=l
	autocmd BufEnter {*.java} set cindent 
	autocmd BufLeave {*.java} set nocindent 

	" Insert mode:  Typing an opening curly bracket will insert a pair of
    " curly brackets and move the cursor before the closing curly bracket:
	" this can be mildly annoying so comment if needed
	autocmd BufEnter {*.java} imap { {<CR>}<ESC><Up>$a
	autocmd BufLeave {*.java} iunmap {

    " Comment out a line with F7
	autocmd BufEnter *.java nmap <F7> I// +
	autocmd BufLeave *.java nunmap <F7>


    """""""""""""""""""""""""""""""""""""java"""""""""""""""""""""""""""""""""""" 

augroup end
