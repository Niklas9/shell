"===============================================================================
" Date: Fri Nov 10 03:14:17 MST 2000
" Last Modified: 2002-Apr-11 14:55:09
"===============================================================================

"===============================================================================
"                  Stuff you should modify for each mchine..
"===============================================================================
" set helpfile=/home/mcasado/programs/vim-5.7/runtime/doc/help.txt
set dictionary=/usr/share/dict/words

"============================================================="
"                    Color                                    "
"============================================================="
"       background:  Are we using a "light" or "dark" background?
set   background=dark

"set gvim colors
highlight Normal guibg=Black guifg=white
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
  let &shell="tcsh"
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
  set suffixes=.aux,.bak,.dvi,.idx,.log,.ps,.swp,.tar,.o,.class,.aux,.log,.bbl,CVS/

"       startofline:  no:  do not jump to first character with page
"       commands, ie keep the cursor in the current column.
  set nostartofline
  set   splitbelow
"       textmode:    no - I am using Vim on UNIX!
  set notextmode
"       textwidth
  set   textwidth=72
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
"       Please use this as to not annoy cow-orkers in the same room.
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

  map gf :sp <cfile><cr>

  map <Leader>b :MiniBufExplorer<cr>

  nmap <C-P> :!/usr/bin/ispell -a<CR> 

  " I use the following line when spending time working on this
  " file :-)
  nmap <M-V> :source ~/.vimrc<CR>

  " backspace 4 spaces
  imap <C-B> <left><left><left><left>

  " from tip 224 on vim.sf.net
  " allows you to continuelly shift a block
  vnoremap < <gv 
  vnoremap > >gv 

  " from tip 173
  map <C-J> <C-W>j<C-W> 
  map <C-K> <C-W>k<C-W> 


" ===============================================================
" CVS mappings... because I'm script stupid 
" ===============================================================
nnoremap ,ca :CVSAdd
nnoremap ,ca :CVSAdd
nnoremap ,cn :CVSAnnotate
nnoremap ,cc :CVSCommit
nnoremap ,cd :CVSDiff
nnoremap ,ce :CVSEdit
nnoremap ,cl :CVSLog
nnoremap ,cr :CVSReview
nnoremap ,cs :CVSStatus
nnoremap ,ct :CVSUnedit
nnoremap ,cu :CVSUpdate
nnoremap ,cv :CVSVimDiff
