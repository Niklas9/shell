"===============================================================================
" Date: Fri Nov 10 03:14:17 MST 2000
" Last Modified: 2001-Mar-17 11:51:12 AM
"===============================================================================



"===============================================================================
"                  Stuff you should modify for each mchine..
"===============================================================================
set dictionary=/usr/dict/words



"=================================================================================
"                       Third party packages n stuff :-)
"=================================================================================

" enable if u
"if filereadable(expand("~/.vim/hdiffwin.vim"))
"  so ~/.vim/hdiffwin.vim
"endif

if filereadable(expand("~/.vim/colorscheme.vim"))
  so ~/.vim/colorscheme.vim
endif

if filereadable(expand("~/.vim/bookmark.vim"))
  so ~/.vim/bookmark.vim
endif

if filereadable(expand("~/.vim/explorer.vim"))
  so ~/.vim/explorer.vim
endif
" ===================================================================
" AutoCommands
" ===================================================================


" I moved many file type specific stuff to seperate files..
" go ahead and source them here..
let FILE=expand("~/.vim/cfiles.vim")
if filereadable(FILE)
	exe "source " . FILE
endif

let FILE=expand("~/.vim/texfiles.vim")
if filereadable(FILE)
	exe "source " . FILE
endif

let FILE=expand("~/.vim/pyfiles.vim")
if filereadable(FILE)
	exe "source " . FILE
endif

"============================================================="
"                    Color                                    "
"============================================================="
"       background:  Are we using a "light" or "dark" background?
set   background=dark

"set gvim colors
highlight Normal guibg=Black guifg=green
set guifont=10x20

"overide default comment colors
highlight Comment ctermfg=Cyan guibg=Black guifg=Cyan

" just load the main syntax file when Vim was compiled with "+syntax"
  if has("syntax")
      " The following sources the main syntax file,
      " ie. "$VIM/syntax/syntax.vim", see ":help :syn-on":
      syntax on
  endif


" many users also want to see the name of the file
" associated with the current edit buffer in the title:
let &titlestring = expand ("%:p:~:.:h")

"       autowrite: Automatically save modifications to files
"       when you use critical (rxternal) commands.
set   autowrite
"       backup:  backups are for wimps  ;-)
set nobackup
"       backspace:  '2' is much smarter. -> "help backspace"
set   backspace=2
"       compatible:  Let Vim behave like Vi?  Hell, no!
set nocompatible
"       errorbells: damn this beep!  ;-)
set noerrorbells
"       esckeys:    allow usage of cursor keys within insert mode
"       You will find this useful when working, eg, on SunOS.
set   esckeys
" tabbing environment
set ai ts=4 sw=4
set et  " no tabs! just spaces (use retab to change all tabes to spaces)
"       formatoptions:  Options for the "text format" command ("gq")
"                       I need all those options (but 'o')!
  set   formatoptions=cqrt
"       helpheight: zero disables this.
  set   helpheight=0
" 
" highlight search can be annoying
set nohlsearch
"       incsearch: do that cool emacsesque incremental search thingy
  set is
  set noicon
"       ignorecase:  ignore the case in search patterns?  
   set ic "  set noignorecase
"       keywordprg:  Program to use for the "K" command.
 set   keywordprg=man\ -s
"       laststatus:  show status line?  Yes, always!
"       laststatus:  Even for only one buffer.
  set   laststatus=2
" [VIM5]lazyredraw:  do not update screen while executing macros
  set   lazyredraw
"       ruler:       show cursor position?  Yep!
  set   ruler
" start the tcsh as a login shell: (to hell with zsh :-P)
  if has("unix")
"  let &shell="tsch"
" (reid)  don't have tsch
  let &shell="/bin/bash"
  set   shell="/bin/bash"
  endif
"       shortmess:   Kind of messages to show.   Abbreviate them all!
"          New since vim-5.0v: flag 'I' to suppress "intro message".
  set   shortmess=at
"       showcmd:     Show current uncompleted command?  Absolutely!
  set   showcmd
"       showmatch:   Show the matching bracket for the last ')'?
  set   showmatch
"       showmode:    Show the current mode?  YEEEEEEEEESSSSSSSSSSS!
  set   showmode
"       suffixes:    Ignore filename with any of these suffixes
"                    when using the ":edit" command.
"                    Most of these are files created by LaTeX.
  set   suffixes=.aux,.bak,.dvi,.idx,.log,.ps,.swp,.tar,.o
"       startofline:  no:  do not jump to first character with page
"       commands, ie keep the cursor in the current column.
  set nostartofline
  set   splitbelow
"       textmode:    no - I am using Vim on UNIX!
  set notextmode
"       textwidth
  set   textwidth=79
"       title:
  set notitle
"       ttyfast:     are we using a fast terminal?
"                    seting depends on where I use Vim...
  set nottyfast
"       ttybuiltin:
  set nottybuiltin
"       ttyscroll:      turn off scrolling -> faster!
  set   ttyscroll=0
"       viminfo:  What info to store from an editing session
"                 in the viminfo file;  can be used at next session.
  set   viminfo=%,'50,\"100,:100,n~/.viminfo
"       visualbell:
  set   visualbell
"       t_vb:  terminal's visual bell - turned off to make Vim quiet!
"       Please use this as to not annoy co-workers in the same room.
"       Thankyou!  :-)
  set   t_vb=
"       whichwrap:
  set   whichwrap=<,>,h,l
"       wildchar  the char used for "expansion" on the command line
"                 default value is "<C-E>" but I prefer the tab key:
  set   wildchar=<TAB>
"       wrapmargin:
  set   wrapmargin=1
"       writebackup:
  set nowritebackup


" === Toggles
" toggle syntax on/off
map <F5> :if exists("syntax_on") <bar> syntax off <bar> else <bar> syntax on <bar> endif <cr>


" ===============================================================
" Abbreviations
" ===============================================================

  " long date/time
  iab YDT   <C-R>=strftime("%a %b %d %T %Z %Y")<CR>
  " Me Yay!
  iab YMC Martin Casado

  " shorter date/time
  iab YDATE <C-R>=strftime("%Y-%b-%d %X")<CR>


" ===================================================================
" MAPpings
  nmap :W :w

  nmap <C-P> :!/usr/bin/ispell -a<CR> 
  " I use the following line when spending time working on this
  " file :-)
  nmap <M-V> :source ~/.vimrc<CR>

  " look for a line Last Modified: and replace current
  " entry with date/time
  map ,L mz1G/Last Modified:\s*/e+1<CR>CYDATE<ESC>`z

  " Call engspchk.vim
  map ,S <ESC>:source ~/.vim/engspchk.vim<CR>

  " backspace 4 spaces
  imap <C-B> <left><left><left><left>


