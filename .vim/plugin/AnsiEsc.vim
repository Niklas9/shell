" AnsiEsc.vim: Uses the 6.0 syntax highlighting.
" Language:		Text with ansi escape sequences
" Maintainer:	Dr. Charles E. Campbell, Jr. <Charles.E.Campbell.1@gsfc.nasa.gov>
" Version:		2
" Date:		November 21, 2001

if exists("b:current_syntax")
 finish
endif

syn clear

" Ansi-escape Sequence Handling
" =============================
syn region ansiBlack		matchgroup=Ignore start="\e\[30m" end="\e\["me=e-2
syn region ansiRed		matchgroup=Ignore start="\e\[31m" end="\e\["me=e-2
syn region ansiGreen		matchgroup=Ignore start="\e\[32m" end="\e\["me=e-2
syn region ansiYellow		matchgroup=Ignore start="\e\[33m" end="\e\["me=e-2
syn region ansiBlue		matchgroup=Ignore start="\e\[34m" end="\e\["me=e-2
syn region ansiMagenta		matchgroup=Ignore start="\e\[35m" end="\e\["me=e-2
syn region ansiCyan		matchgroup=Ignore start="\e\[36m" end="\e\["me=e-2
syn region ansiWhite		matchgroup=Ignore start="\e\[37m" end="\e\["me=e-2

syn region ansiBoldBlack	matchgroup=Ignore start="\e\[\(1;30\|30;1\)m" end="\e\["me=e-2
syn region ansiBoldRed		matchgroup=Ignore start="\e\[\(1;31\|31;1\)m" end="\e\["me=e-2
syn region ansiBoldGreen	matchgroup=Ignore start="\e\[\(1;32\|32;1\)m" end="\e\["me=e-2
syn region ansiBoldYellow	matchgroup=Ignore start="\e\[\(1;33\|33;1\)m" end="\e\["me=e-2
syn region ansiBoldBlue		matchgroup=Ignore start="\e\[\(1;34\|34;1\)m" end="\e\["me=e-2
syn region ansiBoldMagenta	matchgroup=Ignore start="\e\[\(1;35\|35;1\)m" end="\e\["me=e-2
syn region ansiBoldCyan		matchgroup=Ignore start="\e\[\(1;36\|36;1\)m" end="\e\["me=e-2
syn region ansiBoldWhite	matchgroup=Ignore start="\e\[\(1;37\|37;1\)m" end="\e\["me=e-2

syn region ansiStandoutBlack	matchgroup=Ignore start="\e\[\(3;30\|30;3\)m" end="\e\["me=e-2
syn region ansiStandoutRed	matchgroup=Ignore start="\e\[\(3;31\|31;3\)m" end="\e\["me=e-2
syn region ansiStandoutGreen	matchgroup=Ignore start="\e\[\(3;32\|32;3\)m" end="\e\["me=e-2
syn region ansiStandoutYellow	matchgroup=Ignore start="\e\[\(3;33\|33;3\)m" end="\e\["me=e-2
syn region ansiStandoutBlue	matchgroup=Ignore start="\e\[\(3;34\|34;3\)m" end="\e\["me=e-2
syn region ansiStandoutMagenta	matchgroup=Ignore start="\e\[\(3;35\|35;3\)m" end="\e\["me=e-2
syn region ansiStandoutCyan	matchgroup=Ignore start="\e\[\(3;36\|36;3\)m" end="\e\["me=e-2
syn region ansiStandoutWhite	matchgroup=Ignore start="\e\[\(3;37\|37;3\)m" end="\e\["me=e-2

syn region ansiItalicBlack	matchgroup=Ignore start="\e\[\(2;30\|30;2\)m" end="\e\["me=e-2
syn region ansiItalicRed	matchgroup=Ignore start="\e\[\(2;31\|31;2\)m" end="\e\["me=e-2
syn region ansiItalicGreen	matchgroup=Ignore start="\e\[\(2;32\|32;2\)m" end="\e\["me=e-2
syn region ansiItalicYellow	matchgroup=Ignore start="\e\[\(2;33\|33;2\)m" end="\e\["me=e-2
syn region ansiItalicBlue	matchgroup=Ignore start="\e\[\(2;34\|34;2\)m" end="\e\["me=e-2
syn region ansiItalicMagenta	matchgroup=Ignore start="\e\[\(2;35\|35;2\)m" end="\e\["me=e-2
syn region ansiItalicCyan	matchgroup=Ignore start="\e\[\(2;36\|36;2\)m" end="\e\["me=e-2
syn region ansiItalicWhite	matchgroup=Ignore start="\e\[\(2;37\|37;2\)m" end="\e\["me=e-2

syn region ansiUnderlineBlack	matchgroup=Ignore start="\e\[\(4;30\|30;4\)m" end="\e\["me=e-2
syn region ansiUnderlineRed	matchgroup=Ignore start="\e\[\(4;31\|31;4\)m" end="\e\["me=e-2
syn region ansiUnderlineGreen	matchgroup=Ignore start="\e\[\(4;32\|32;4\)m" end="\e\["me=e-2
syn region ansiUnderlineYellow	matchgroup=Ignore start="\e\[\(4;33\|33;4\)m" end="\e\["me=e-2
syn region ansiUnderlineBlue	matchgroup=Ignore start="\e\[\(4;34\|34;4\)m" end="\e\["me=e-2
syn region ansiUnderlineMagenta	matchgroup=Ignore start="\e\[\(4;35\|35;4\)m" end="\e\["me=e-2
syn region ansiUnderlineCyan	matchgroup=Ignore start="\e\[\(4;36\|36;4\)m" end="\e\["me=e-2
syn region ansiUnderlineWhite	matchgroup=Ignore start="\e\[\(4;37\|37;4\)m" end="\e\["me=e-2

syn region ansiRVBlack	matchgroup=Ignore start="\e\[\(7;30\|30;7\)m" end="\e\["me=e-2
syn region ansiRVRed	matchgroup=Ignore start="\e\[\(7;31\|31;7\)m" end="\e\["me=e-2
syn region ansiRVGreen	matchgroup=Ignore start="\e\[\(7;32\|32;7\)m" end="\e\["me=e-2
syn region ansiRVYellow	matchgroup=Ignore start="\e\[\(7;33\|33;7\)m" end="\e\["me=e-2
syn region ansiRVBlue	matchgroup=Ignore start="\e\[\(7;34\|34;7\)m" end="\e\["me=e-2
syn region ansiRVMagenta	matchgroup=Ignore start="\e\[\(7;35\|35;7\)m" end="\e\["me=e-2
syn region ansiRVCyan	matchgroup=Ignore start="\e\[\(7;36\|36;7\)m" end="\e\["me=e-2
syn region ansiRVWhite	matchgroup=Ignore start="\e\[\(7;37\|37;7\)m" end="\e\["me=e-2

syn match ansiStop		"\e\[m"
syn match ansiIgnore	"\e\[\([56];3[0-9]\|3[0-9];[56]\)m"
syn match ansiIgnore	"\e\[\([0-9]\+;\)\{2,}[0-9]\+m"

" Some Color Combinations - can't do 'em all, the qty of highlighting groups is limited!
" =======================
syn region ansiRedBlack	matchgroup=Ignore start="\e\[31;40m" end="\e\["me=e-2
syn region ansiGreenBlack	matchgroup=Ignore start="\e\[32;40m" end="\e\["me=e-2
syn region ansiYellowBlack	matchgroup=Ignore start="\e\[33;40m" end="\e\["me=e-2
syn region ansiBlueBlack	matchgroup=Ignore start="\e\[34;40m" end="\e\["me=e-2
syn region ansiMagentaBlack	matchgroup=Ignore start="\e\[35;40m" end="\e\["me=e-2
syn region ansiCyanBlack	matchgroup=Ignore start="\e\[36;40m" end="\e\["me=e-2
syn region ansiWhiteBlack	matchgroup=Ignore start="\e\[37;40m" end="\e\["me=e-2

syn region ansiBlackRed		matchgroup=Ignore start="\e\[30;41m" end="\e\["me=e-2
syn region ansiGreenRed		matchgroup=Ignore start="\e\[32;41m" end="\e\["me=e-2
syn region ansiYellowRed	matchgroup=Ignore start="\e\[33;41m" end="\e\["me=e-2
syn region ansiBlueRed		matchgroup=Ignore start="\e\[34;41m" end="\e\["me=e-2
syn region ansiMagentaRed	matchgroup=Ignore start="\e\[35;41m" end="\e\["me=e-2
syn region ansiCyanRed		matchgroup=Ignore start="\e\[36;41m" end="\e\["me=e-2
syn region ansiWhiteRed		matchgroup=Ignore start="\e\[37;41m" end="\e\["me=e-2

syn region ansiBlackGreen	matchgroup=Ignore start="\e\[30;42m" end="\e\["me=e-2
syn region ansiRedGreen		matchgroup=Ignore start="\e\[31;42m" end="\e\["me=e-2
syn region ansiYellowGreen	matchgroup=Ignore start="\e\[33;42m" end="\e\["me=e-2
syn region ansiBlueGreen	matchgroup=Ignore start="\e\[34;42m" end="\e\["me=e-2
syn region ansiMagentaGreen	matchgroup=Ignore start="\e\[35;42m" end="\e\["me=e-2
syn region ansiCyanGreen	matchgroup=Ignore start="\e\[36;42m" end="\e\["me=e-2
syn region ansiWhiteGreen	matchgroup=Ignore start="\e\[37;42m" end="\e\["me=e-2

syn region ansiBlackYellow	matchgroup=Ignore start="\e\[30;43m" end="\e\["me=e-2
syn region ansiRedYellow	matchgroup=Ignore start="\e\[31;43m" end="\e\["me=e-2
syn region ansiGreenYellow	matchgroup=Ignore start="\e\[32;43m" end="\e\["me=e-2
syn region ansiBlueYellow	matchgroup=Ignore start="\e\[34;43m" end="\e\["me=e-2
syn region ansiMagentaYellow	matchgroup=Ignore start="\e\[35;43m" end="\e\["me=e-2
syn region ansiCyanYellow	matchgroup=Ignore start="\e\[36;43m" end="\e\["me=e-2
syn region ansiWhiteYellow	matchgroup=Ignore start="\e\[37;43m" end="\e\["me=e-2

syn region ansiBlackBlue	matchgroup=Ignore start="\e\[30;44m" end="\e\["me=e-2
syn region ansiRedBlue	matchgroup=Ignore start="\e\[31;44m" end="\e\["me=e-2
syn region ansiGreenBlue	matchgroup=Ignore start="\e\[32;44m" end="\e\["me=e-2
syn region ansiYellowBlue	matchgroup=Ignore start="\e\[33;44m" end="\e\["me=e-2
syn region ansiMagentaBlue	matchgroup=Ignore start="\e\[35;44m" end="\e\["me=e-2
syn region ansiCyanBlue	matchgroup=Ignore start="\e\[36;44m" end="\e\["me=e-2
syn region ansiWhiteBlue	matchgroup=Ignore start="\e\[37;44m" end="\e\["me=e-2

syn region ansiBlackMagenta	matchgroup=Ignore start="\e\[30;45m" end="\e\["me=e-2
syn region ansiRedMagenta	matchgroup=Ignore start="\e\[31;45m" end="\e\["me=e-2
syn region ansiGreenMagenta	matchgroup=Ignore start="\e\[32;45m" end="\e\["me=e-2
syn region ansiYellowMagenta	matchgroup=Ignore start="\e\[33;45m" end="\e\["me=e-2
syn region ansiBlueMagenta	matchgroup=Ignore start="\e\[34;45m" end="\e\["me=e-2
syn region ansiCyanMagenta	matchgroup=Ignore start="\e\[36;45m" end="\e\["me=e-2
syn region ansiWhiteMagenta	matchgroup=Ignore start="\e\[37;45m" end="\e\["me=e-2

syn region ansiBlackCyan	matchgroup=Ignore start="\e\[30;46m" end="\e\["me=e-2
syn region ansiRedCyan		matchgroup=Ignore start="\e\[31;46m" end="\e\["me=e-2
syn region ansiGreenCyan	matchgroup=Ignore start="\e\[32;46m" end="\e\["me=e-2
syn region ansiYellowCyan	matchgroup=Ignore start="\e\[33;46m" end="\e\["me=e-2
syn region ansiBlueCyan		matchgroup=Ignore start="\e\[34;46m" end="\e\["me=e-2
syn region ansiMagentaCyan	matchgroup=Ignore start="\e\[35;46m" end="\e\["me=e-2
syn region ansiWhiteCyan	matchgroup=Ignore start="\e\[37;46m" end="\e\["me=e-2

syn region ansiBlackWhite	matchgroup=Ignore start="\e\[30;47m" end="\e\["me=e-2
syn region ansiRedWhite	matchgroup=Ignore start="\e\[31;47m" end="\e\["me=e-2
syn region ansiGreenWhite	matchgroup=Ignore start="\e\[32;47m" end="\e\["me=e-2
syn region ansiYellowWhite	matchgroup=Ignore start="\e\[33;47m" end="\e\["me=e-2
syn region ansiBlueWhite	matchgroup=Ignore start="\e\[34;47m" end="\e\["me=e-2
syn region ansiMagentaWhite	matchgroup=Ignore start="\e\[35;47m" end="\e\["me=e-2
syn region ansiCyanWhite	matchgroup=Ignore start="\e\[36;47m" end="\e\["me=e-2

" Highlighting
" ============
hi link ansiIgnore		ansiStop
hi link ansiStop		Ignore

if &t_Co == 8
  hi ansiBlack		cterm=none gui=none ctermfg=0 guifg=black
  hi ansiRed		cterm=none gui=none ctermfg=1 guifg=red
  hi ansiGreen		cterm=none gui=none ctermfg=2 guifg=green
  hi ansiYellow		cterm=none gui=none ctermfg=3 guifg=yellow
  hi ansiBlue		cterm=none gui=none ctermfg=4 guifg=blue
  hi ansiMagenta		cterm=none gui=none ctermfg=5 guifg=magenta
  hi ansiCyan		cterm=none gui=none ctermfg=6 guifg=cyan
  hi ansiWhite		cterm=none gui=none ctermfg=7 guifg=white
  
  hi ansiBoldBlack		cterm=bold gui=bold ctermfg=0 guifg=black
  hi ansiBoldRed		cterm=bold gui=bold ctermfg=1 guifg=red
  hi ansiBoldGreen		cterm=bold gui=bold ctermfg=2 guifg=green
  hi ansiBoldYellow		cterm=bold gui=bold ctermfg=3 guifg=yellow
  hi ansiBoldBlue		cterm=bold gui=bold ctermfg=4 guifg=blue
  hi ansiBoldMagenta		cterm=bold gui=bold ctermfg=5 guifg=magenta
  hi ansiBoldCyan		cterm=bold gui=bold ctermfg=6 guifg=cyan
  hi ansiBoldWhite		cterm=bold gui=bold ctermfg=7 guifg=white
  
  hi ansiStandoutBlack		cterm=standout gui=standout ctermfg=0 guifg=black
  hi ansiStandoutRed		cterm=standout gui=standout ctermfg=1 guifg=red
  hi ansiStandoutGreen		cterm=standout gui=standout ctermfg=2 guifg=green
  hi ansiStandoutYellow		cterm=standout gui=standout ctermfg=3 guifg=yellow
  hi ansiStandoutBlue		cterm=standout gui=standout ctermfg=4 guifg=blue
  hi ansiStandoutMagenta	cterm=standout gui=standout ctermfg=5 guifg=magenta
  hi ansiStandoutCyan		cterm=standout gui=standout ctermfg=6 guifg=cyan
  hi ansiStandoutWhite		cterm=standout gui=standout ctermfg=7 guifg=white
  
  hi ansiItalicBlack		cterm=italic gui=italic ctermfg=0 guifg=black
  hi ansiItalicRed		cterm=italic gui=italic ctermfg=1 guifg=red
  hi ansiItalicGreen		cterm=italic gui=italic ctermfg=2 guifg=green
  hi ansiItalicYellow		cterm=italic gui=italic ctermfg=3 guifg=yellow
  hi ansiItalicBlue		cterm=italic gui=italic ctermfg=4 guifg=blue
  hi ansiItalicMagenta		cterm=italic gui=italic ctermfg=5 guifg=magenta
  hi ansiItalicCyan		cterm=italic gui=italic ctermfg=6 guifg=cyan
  hi ansiItalicWhite		cterm=italic gui=italic ctermfg=7 guifg=white
  
  hi ansiUnderlineBlack		cterm=underline gui=underline ctermfg=0 guifg=black
  hi ansiUnderlineRed		cterm=underline gui=underline ctermfg=1 guifg=red
  hi ansiUnderlineGreen		cterm=underline gui=underline ctermfg=2 guifg=green
  hi ansiUnderlineYellow	cterm=underline gui=underline ctermfg=3 guifg=yellow
  hi ansiUnderlineBlue		cterm=underline gui=underline ctermfg=4 guifg=blue
  hi ansiUnderlineMagenta	cterm=underline gui=underline ctermfg=5 guifg=magenta
  hi ansiUnderlineCyan		cterm=underline gui=underline ctermfg=6 guifg=cyan
  hi ansiUnderlineWhite		cterm=underline gui=underline ctermfg=7 guifg=white
  
  hi ansiRVBlack		cterm=reverse gui=reverse ctermfg=0 guifg=black
  hi ansiRVRed		cterm=reverse gui=reverse ctermfg=1 guifg=red
  hi ansiRVGreen		cterm=reverse gui=reverse ctermfg=2 guifg=green
  hi ansiRVYellow		cterm=reverse gui=reverse ctermfg=3 guifg=yellow
  hi ansiRVBlue		cterm=reverse gui=reverse ctermfg=4 guifg=blue
  hi ansiRVMagenta		cterm=reverse gui=reverse ctermfg=5 guifg=magenta
  hi ansiRVCyan		cterm=reverse gui=reverse ctermfg=6 guifg=cyan
  hi ansiRVWhite		cterm=reverse gui=reverse ctermfg=7 guifg=white
  
  hi ansiRedBlack		cterm=none gui=none ctermfg=1 ctermbg=0 guifg=Red guibg=Black
  hi ansiGreenBlack		cterm=none gui=none ctermfg=2 ctermbg=0 guifg=Green guibg=Black
  hi ansiYellowBlack		cterm=none gui=none ctermfg=3 ctermbg=0 guifg=Yellow guibg=Black
  hi ansiBlueBlack		cterm=none gui=none ctermfg=4 ctermbg=0 guifg=Blue guibg=Black
  hi ansiMagentaBlack		cterm=none gui=none ctermfg=5 ctermbg=0 guifg=Magenta guibg=Black
  hi ansiCyanBlack		cterm=none gui=none ctermfg=6 ctermbg=0 guifg=Cyan guibg=Black
  hi ansiWhiteBlack		cterm=none gui=none ctermfg=7 ctermbg=0 guifg=White guibg=Black
  
  hi ansiBlackRed		cterm=none gui=none ctermfg=0 ctermbg=1 guifg=Black guibg=Red
  hi ansiGreenRed		cterm=none gui=none ctermfg=2 ctermbg=1 guifg=Green guibg=Red
  hi ansiYellowRed		cterm=none gui=none ctermfg=3 ctermbg=1 guifg=Yellow guibg=Red
  hi ansiBlueRed		cterm=none gui=none ctermfg=4 ctermbg=1 guifg=Blue guibg=Red
  hi ansiMagentaRed		cterm=none gui=none ctermfg=5 ctermbg=1 guifg=Magenta guibg=Red
  hi ansiCyanRed		cterm=none gui=none ctermfg=6 ctermbg=1 guifg=Cyan guibg=Red
  hi ansiWhiteRed		cterm=none gui=none ctermfg=7 ctermbg=1 guifg=White guibg=Red
  
  hi ansiBlackGreen		cterm=none gui=none ctermfg=0 ctermbg=2 guifg=Black guibg=Green
  hi ansiRedGreen		cterm=none gui=none ctermfg=1 ctermbg=2 guifg=Red guibg=Green
  hi ansiYellowGreen		cterm=none gui=none ctermfg=3 ctermbg=2 guifg=Yellow guibg=Green
  hi ansiBlueGreen		cterm=none gui=none ctermfg=4 ctermbg=2 guifg=Blue guibg=Green
  hi ansiMagentaGreen		cterm=none gui=none ctermfg=5 ctermbg=2 guifg=Magenta guibg=Green
  hi ansiCyanGreen		cterm=none gui=none ctermfg=6 ctermbg=2 guifg=Cyan guibg=Green
  hi ansiWhiteGreen		cterm=none gui=none ctermfg=7 ctermbg=2 guifg=White guibg=Green
  
  hi ansiBlackYellow		cterm=none gui=none ctermfg=0 ctermbg=3 guifg=Black guibg=Yellow
  hi ansiRedYellow		cterm=none gui=none ctermfg=1 ctermbg=3 guifg=Red guibg=Yellow
  hi ansiGreenYellow		cterm=none gui=none ctermfg=2 ctermbg=3 guifg=Green guibg=Yellow
  hi ansiBlueYellow		cterm=none gui=none ctermfg=4 ctermbg=3 guifg=Blue guibg=Yellow
  hi ansiMagentaYellow		cterm=none gui=none ctermfg=5 ctermbg=3 guifg=Magenta guibg=Yellow
  hi ansiCyanYellow		cterm=none gui=none ctermfg=6 ctermbg=3 guifg=Cyan guibg=Yellow
  hi ansiWhiteYellow		cterm=none gui=none ctermfg=7 ctermbg=3 guifg=White guibg=Yellow
  
  hi ansiBlackBlue		cterm=none gui=none ctermfg=0 ctermbg=4 guifg=Black guibg=Blue
  hi ansiRedBlue		cterm=none gui=none ctermfg=1 ctermbg=4 guifg=Red guibg=Blue
  hi ansiGreenBlue		cterm=none gui=none ctermfg=2 ctermbg=4 guifg=Green guibg=Blue
  hi ansiYellowBlue		cterm=none gui=none ctermfg=3 ctermbg=4 guifg=Yellow guibg=Blue
  hi ansiMagentaBlue		cterm=none gui=none ctermfg=5 ctermbg=4 guifg=Magenta guibg=Blue
  hi ansiCyanBlue		cterm=none gui=none ctermfg=6 ctermbg=4 guifg=Cyan guibg=Blue
  hi ansiWhiteBlue		cterm=none gui=none ctermfg=7 ctermbg=4 guifg=White guibg=Blue
  
  hi ansiBlackMagenta		cterm=none gui=none ctermfg=0 ctermbg=5 guifg=Black guibg=Magenta
  hi ansiRedMagenta		cterm=none gui=none ctermfg=1 ctermbg=5 guifg=Red guibg=Magenta
  hi ansiGreenMagenta		cterm=none gui=none ctermfg=2 ctermbg=5 guifg=Green guibg=Magenta
  hi ansiYellowMagenta		cterm=none gui=none ctermfg=3 ctermbg=5 guifg=Red guibg=Magenta
  hi ansiBlueMagenta		cterm=none gui=none ctermfg=4 ctermbg=5 guifg=Red guibg=Magenta
  hi ansiMagentaMagenta		cterm=none gui=none ctermfg=5 ctermbg=5 guifg=Magenta guibg=Magenta
  hi ansiCyanMagenta		cterm=none gui=none ctermfg=6 ctermbg=5 guifg=Cyan guibg=Magenta
  hi ansiWhiteMagenta		cterm=none gui=none ctermfg=7 ctermbg=5 guifg=White guibg=Magenta
  
  hi ansiBlackCyan		cterm=none gui=none ctermfg=0 ctermbg=6 guifg=Black guibg=Cyan
  hi ansiRedCyan		cterm=none gui=none ctermfg=1 ctermbg=6 guifg=Red guibg=Cyan
  hi ansiGreenCyan		cterm=none gui=none ctermfg=2 ctermbg=6 guifg=Green guibg=Cyan
  hi ansiYellowCyan		cterm=none gui=none ctermfg=3 ctermbg=6 guifg=Yellow guibg=Cyan
  hi ansiBlueCyan		cterm=none gui=none ctermfg=4 ctermbg=6 guifg=Blue guibg=Cyan
  hi ansiMagentaCyan		cterm=none gui=none ctermfg=5 ctermbg=6 guifg=Magenta guibg=Cyan
  hi ansiWhiteCyan		cterm=none gui=none ctermfg=7 ctermbg=6 guifg=White guibg=Cyan
  
  hi ansiBlackWhite		cterm=none gui=none ctermfg=0 ctermbg=7 guifg=Black guibg=White
  hi ansiRedWhite		cterm=none gui=none ctermfg=1 ctermbg=7 guifg=Red guibg=White
  hi ansiGreenWhite		cterm=none gui=none ctermfg=2 ctermbg=7 guifg=Green guibg=White
  hi ansiYellowWhite		cterm=none gui=none ctermfg=3 ctermbg=7 guifg=Yellow guibg=White
  hi ansiBlueWhite		cterm=none gui=none ctermfg=4 ctermbg=7 guifg=Blue guibg=White
  hi ansiMagentaWhite		cterm=none gui=none ctermfg=5 ctermbg=7 guifg=Magenta guibg=White
  hi ansiCyanWhite		cterm=none gui=none ctermfg=6 ctermbg=7 guifg=Cyan guibg=White
else
  hi ansiBlack		cterm=none gui=none ctermfg=0  guifg=black
  hi ansiRed		cterm=none gui=none ctermfg=12 guifg=red
  hi ansiGreen		cterm=none gui=none ctermfg=10 guifg=green
  hi ansiYellow		cterm=none gui=none ctermfg=14 guifg=yellow
  hi ansiBlue		cterm=none gui=none ctermfg=9  guifg=blue
  hi ansiMagenta		cterm=none gui=none ctermfg=13 guifg=magenta
  hi ansiCyan		cterm=none gui=none ctermfg=11 guifg=cyan
  hi ansiWhite		cterm=none gui=none ctermfg=15 guifg=white
  
  hi ansiBoldBlack		cterm=bold gui=bold ctermfg=0  guifg=black
  hi ansiBoldRed		cterm=bold gui=bold ctermfg=12 guifg=red
  hi ansiBoldGreen		cterm=bold gui=bold ctermfg=10 guifg=green
  hi ansiBoldYellow		cterm=bold gui=bold ctermfg=14 guifg=yellow
  hi ansiBoldBlue		cterm=bold gui=bold ctermfg=9  guifg=blue
  hi ansiBoldMagenta		cterm=bold gui=bold ctermfg=13 guifg=magenta
  hi ansiBoldCyan		cterm=bold gui=bold ctermfg=11 guifg=cyan
  hi ansiBoldWhite		cterm=bold gui=bold ctermfg=15 guifg=white
  
  hi ansiStandoutBlack		cterm=standout gui=standout ctermfg=0  guifg=black
  hi ansiStandoutRed		cterm=standout gui=standout ctermfg=12 guifg=red
  hi ansiStandoutGreen		cterm=standout gui=standout ctermfg=10 guifg=green
  hi ansiStandoutYellow		cterm=standout gui=standout ctermfg=14 guifg=yellow
  hi ansiStandoutBlue		cterm=standout gui=standout ctermfg=9  guifg=blue
  hi ansiStandoutMagenta	cterm=standout gui=standout ctermfg=13 guifg=magenta
  hi ansiStandoutCyan		cterm=standout gui=standout ctermfg=11 guifg=cyan
  hi ansiStandoutWhite		cterm=standout gui=standout ctermfg=15 guifg=white
  
  hi ansiItalicBlack		cterm=italic gui=italic ctermfg=0  guifg=black
  hi ansiItalicRed		cterm=italic gui=italic ctermfg=12 guifg=red
  hi ansiItalicGreen		cterm=italic gui=italic ctermfg=10 guifg=green
  hi ansiItalicYellow		cterm=italic gui=italic ctermfg=14 guifg=yellow
  hi ansiItalicBlue		cterm=italic gui=italic ctermfg=9  guifg=blue
  hi ansiItalicMagenta		cterm=italic gui=italic ctermfg=13 guifg=magenta
  hi ansiItalicCyan		cterm=italic gui=italic ctermfg=11 guifg=cyan
  hi ansiItalicWhite		cterm=italic gui=italic ctermfg=15 guifg=white
  
  hi ansiUnderlineBlack		cterm=underline gui=underline ctermfg=0  guifg=black
  hi ansiUnderlineRed		cterm=underline gui=underline ctermfg=12 guifg=red
  hi ansiUnderlineGreen		cterm=underline gui=underline ctermfg=10 guifg=green
  hi ansiUnderlineYellow	cterm=underline gui=underline ctermfg=14 guifg=yellow
  hi ansiUnderlineBlue		cterm=underline gui=underline ctermfg=9  guifg=blue
  hi ansiUnderlineMagenta	cterm=underline gui=underline ctermfg=13 guifg=magenta
  hi ansiUnderlineCyan		cterm=underline gui=underline ctermfg=11 guifg=cyan
  hi ansiUnderlineWhite		cterm=underline gui=underline ctermfg=15 guifg=white
  
  hi ansiRVBlack		cterm=reverse gui=reverse ctermfg=0  guifg=black
  hi ansiRVRed		cterm=reverse gui=reverse ctermfg=12 guifg=red
  hi ansiRVGreen		cterm=reverse gui=reverse ctermfg=10 guifg=green
  hi ansiRVYellow		cterm=reverse gui=reverse ctermfg=14 guifg=yellow
  hi ansiRVBlue		cterm=reverse gui=reverse ctermfg=9  guifg=blue
  hi ansiRVMagenta		cterm=reverse gui=reverse ctermfg=13 guifg=magenta
  hi ansiRVCyan		cterm=reverse gui=reverse ctermfg=11 guifg=cyan
  hi ansiRVWhite		cterm=reverse gui=reverse ctermfg=15 guifg=white
  
  hi ansiRedBlack		cterm=none gui=none ctermfg=12 ctermbg=0  guifg=Red guibg=Black
  hi ansiGreenBlack		cterm=none gui=none ctermfg=10 ctermbg=0  guifg=Green guibg=Black
  hi ansiYellowBlack		cterm=none gui=none ctermfg=14 ctermbg=0  guifg=Yellow guibg=Black
  hi ansiBlueBlack		cterm=none gui=none ctermfg=9  ctermbg=0  guifg=Blue guibg=Black
  hi ansiMagentaBlack		cterm=none gui=none ctermfg=13 ctermbg=0  guifg=Magenta guibg=Black
  hi ansiCyanBlack		cterm=none gui=none ctermfg=11 ctermbg=0  guifg=Cyan guibg=Black
  hi ansiWhiteBlack		cterm=none gui=none ctermfg=15 ctermbg=0  guifg=White guibg=Black
  
  hi ansiBlackRed		cterm=none gui=none ctermfg=0  ctermbg=12 guifg=Black guibg=Red
  hi ansiGreenRed		cterm=none gui=none ctermfg=10 ctermbg=12 guifg=Green guibg=Red
  hi ansiYellowRed		cterm=none gui=none ctermfg=14 ctermbg=12 guifg=Yellow guibg=Red
  hi ansiBlueRed		cterm=none gui=none ctermfg=9  ctermbg=12 guifg=Blue guibg=Red
  hi ansiMagentaRed		cterm=none gui=none ctermfg=13 ctermbg=12 guifg=Magenta guibg=Red
  hi ansiCyanRed		cterm=none gui=none ctermfg=11 ctermbg=12 guifg=Cyan guibg=Red
  hi ansiWhiteRed		cterm=none gui=none ctermfg=15 ctermbg=12 guifg=White guibg=Red
  
  hi ansiBlackGreen		cterm=none gui=none ctermfg=0  ctermbg=10 guifg=Black guibg=Green
  hi ansiRedGreen		cterm=none gui=none ctermfg=12 ctermbg=10 guifg=Red guibg=Green
  hi ansiYellowGreen		cterm=none gui=none ctermfg=14 ctermbg=10 guifg=Yellow guibg=Green
  hi ansiBlueGreen		cterm=none gui=none ctermfg=9  ctermbg=10 guifg=Blue guibg=Green
  hi ansiMagentaGreen		cterm=none gui=none ctermfg=13 ctermbg=10 guifg=Magenta guibg=Green
  hi ansiCyanGreen		cterm=none gui=none ctermfg=11 ctermbg=10 guifg=Cyan guibg=Green
  hi ansiWhiteGreen		cterm=none gui=none ctermfg=15 ctermbg=10 guifg=White guibg=Green
  
  hi ansiBlackYellow		cterm=none gui=none ctermfg=0  ctermbg=14 guifg=Black guibg=Yellow
  hi ansiRedYellow		cterm=none gui=none ctermfg=12 ctermbg=14 guifg=Red guibg=Yellow
  hi ansiGreenYellow		cterm=none gui=none ctermfg=10 ctermbg=14 guifg=Green guibg=Yellow
  hi ansiBlueYellow		cterm=none gui=none ctermfg=9  ctermbg=14 guifg=Blue guibg=Yellow
  hi ansiMagentaYellow		cterm=none gui=none ctermfg=13 ctermbg=14 guifg=Magenta guibg=Yellow
  hi ansiCyanYellow		cterm=none gui=none ctermfg=11 ctermbg=14 guifg=Cyan guibg=Yellow
  hi ansiWhiteYellow		cterm=none gui=none ctermfg=15 ctermbg=14 guifg=White guibg=Yellow
  
  hi ansiBlackBlue		cterm=none gui=none ctermfg=0  ctermbg=9  guifg=Black guibg=Blue
  hi ansiRedBlue		cterm=none gui=none ctermfg=12 ctermbg=9  guifg=Red guibg=Blue
  hi ansiGreenBlue		cterm=none gui=none ctermfg=10 ctermbg=9  guifg=Green guibg=Blue
  hi ansiYellowBlue		cterm=none gui=none ctermfg=14 ctermbg=9  guifg=Yellow guibg=Blue
  hi ansiMagentaBlue		cterm=none gui=none ctermfg=13 ctermbg=9  guifg=Magenta guibg=Blue
  hi ansiCyanBlue		cterm=none gui=none ctermfg=11 ctermbg=9  guifg=Cyan guibg=Blue
  hi ansiWhiteBlue		cterm=none gui=none ctermfg=15 ctermbg=9  guifg=White guibg=Blue
  
  hi ansiBlackMagenta		cterm=none gui=none ctermfg=0  ctermbg=13 guifg=Black guibg=Magenta
  hi ansiRedMagenta		cterm=none gui=none ctermfg=12 ctermbg=13 guifg=Red guibg=Magenta
  hi ansiGreenMagenta		cterm=none gui=none ctermfg=10 ctermbg=13 guifg=Green guibg=Magenta
  hi ansiYellowMagenta		cterm=none gui=none ctermfg=14 ctermbg=13 guifg=Red guibg=Magenta
  hi ansiBlueMagenta		cterm=none gui=none ctermfg=9  ctermbg=13 guifg=Red guibg=Magenta
  hi ansiMagentaMagenta		cterm=none gui=none ctermfg=13 ctermbg=13 guifg=Magenta guibg=Magenta
  hi ansiCyanMagenta		cterm=none gui=none ctermfg=11 ctermbg=13 guifg=Cyan guibg=Magenta
  hi ansiWhiteMagenta		cterm=none gui=none ctermfg=15 ctermbg=13 guifg=White guibg=Magenta
  
  hi ansiBlackCyan		cterm=none gui=none ctermfg=0  ctermbg=11 guifg=Black guibg=Cyan
  hi ansiRedCyan		cterm=none gui=none ctermfg=12 ctermbg=11 guifg=Red guibg=Cyan
  hi ansiGreenCyan		cterm=none gui=none ctermfg=10 ctermbg=11 guifg=Green guibg=Cyan
  hi ansiYellowCyan		cterm=none gui=none ctermfg=14 ctermbg=11 guifg=Yellow guibg=Cyan
  hi ansiBlueCyan		cterm=none gui=none ctermfg=9  ctermbg=11 guifg=Blue guibg=Cyan
  hi ansiMagentaCyan		cterm=none gui=none ctermfg=13 ctermbg=11 guifg=Magenta guibg=Cyan
  hi ansiWhiteCyan		cterm=none gui=none ctermfg=15 ctermbg=11 guifg=White guibg=Cyan
  
  hi ansiBlackWhite		cterm=none gui=none ctermfg=0  ctermbg=15 guifg=Black guibg=White
  hi ansiRedWhite		cterm=none gui=none ctermfg=12 ctermbg=15 guifg=Red guibg=White
  hi ansiGreenWhite		cterm=none gui=none ctermfg=10 ctermbg=15 guifg=Green guibg=White
  hi ansiYellowWhite		cterm=none gui=none ctermfg=14 ctermbg=15 guifg=Yellow guibg=White
  hi ansiBlueWhite		cterm=none gui=none ctermfg=9  ctermbg=15 guifg=Blue guibg=White
  hi ansiMagentaWhite		cterm=none gui=none ctermfg=13 ctermbg=15 guifg=Magenta guibg=White
  hi ansiCyanWhite		cterm=none gui=none ctermfg=11 ctermbg=15 guifg=Cyan guibg=White
endif

exe "setlocal hl=".substitute(&hl,'8:[^,]\{-},','8:Ignore,',"")
" vim: ts=12
