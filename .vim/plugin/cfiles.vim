"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"                  Vim stuff for C file editing
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup c
	au!

    """"""""""""""""""""""""C/C++"""""""""""""""""""""""""""""""""""""""""""""""""
	" Read the c template automagically when starting a new c file
	autocmd BufNewFile *.c r ~/.vim/templates/temp.c
    autocmd BufNewFile *.h r ~/.vim/templates/temp.h
	autocmd BufNewFile *.cc r ~/.vim/templates/temp.cc
    autocmd BufNewFile *.hh r ~/.vim/templates/temp.hh


    " Dr. Chips rules!
    if filereadable(expand("hints"))
      au BufNewFile,BufReadPost *.c,*.C,*.cpp,*.CPP,*.cxx,*.cc  so hints<CR>
    endif

	"  Options for C editing
	autocmd BufEnter {*.[Cch],*.cpp,*.cc,*.CC,*.hh} set formatoptions+=croq2 formatoptions-=l
	autocmd BufEnter {*.[Cch],*.cpp,*.cc,*.CC,*.hh} set cindent 
	autocmd BufLeave {*.[Cch],*.cpp,*.cc,*.CC,*.hh} set nocindent 
	autocmd BufEnter {*.[Cch],*.cpp,*.cc,*.CC,*.hh} set path^=./,/usr/include/
	autocmd BufLeave {*.[Cch],*.cpp,*.cc,*.CC,*.hh} set path& 

	" Insert mode:  Typing an opening curly bracket will insert a pair of
    " curly brackets and move the cursor before the closing curly bracket:
	" this can be mildly annoying so comment if needed
	autocmd BufEnter {*.[Cch],*.cpp,*.cc,*.CC,*.hh} imap { {<CR>}<ESC><Up>$a
	autocmd BufLeave {*.[Cch],*.cpp,*.cc,*.CC,*.hh} iunmap {
	autocmd BufEnter *.C,*.cc,*.hh,*.cpp nmap <F7> I// +
	autocmd BufLeave *.C,*.cc,*.hh,*.cpp nunmap <F7>

	"  Ymain  insert "main" routine
    autocmd BufEnter {*.[Cch],*.cpp,*.cc,*.CC} iab  Ymain int main(int argc,char **argv)<CR>{ 
    """""""""""""""""""""""""""""""""""""C"""""""""""""""""""""""""""""""""""" 

	"    abbreviations of often typed C structs
	autocmd BufEnter *.[ch] iab loopi for ( i = 0; i <x; i ++ )Fxs
	autocmd BufEnter *.[ch] iab loopj for ( j = 0; j <x; j ++ )Fxs
	autocmd BufEnter *.[ch] iab loopk for ( k = 0; k <x; k ++ )Fxs
	autocmd BufLeave *.[ch] iunab loopi
	autocmd BufLeave *.[ch] iunab loopj
	autocmd BufLeave *.[ch] iunab loopk

    " comment out a line
	autocmd BufEnter *.[ch] nmap <F7> I/*<ESC>A*/<ESC>+
	autocmd BufLeave *.[ch] nunmap <F7>

    """""""""""""""""""""""""""""""""""""C"""""""""""""""""""""""""""""""""""" 

augroup end
