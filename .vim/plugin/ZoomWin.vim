" ZoomWin: Brief-like ability to zoom into/out-of a window
"  Author: Ron Aaron
"          modified by Charles Campbell
" Version: 7
"
" History:
"         7 May 23, 2003 : bugfix - GotoWinNum() didn't always get the
"                          cursor into the correct window
"         6 Mar 25, 2003 : more cleanup included
"         5 Mar 14, 2003 : includes support for handling scratch buffers,
"                          no-name buffer windows, and modified-buffer
"                          windows.  All windows' contents will be saved to
"                          temporary buffers
"         4 Dec 12, 2002 : Zak Beck contributed code to clean up temporary
"                          session files if one leaves vim while zoomed-in
"         3 Dec 11, 2002 : plugin-ized
"         2 Nov 08, 2002 : A guaranteed-to-be-unique to this
"                          session file is used for session information.
"                          Modified but not yet saved files are made hidden
"                          during zoom in.
"         1 the epoch    : Ron Aaron's original

" ---------------------------------------------------------------------
if &cp || exists("s:loaded_zoomwin")
 finish
endif
let s:loaded_zoomwin= 1

" ---------------------------------------------------------------------
"  Public Interface:
if !hasmapto("<Plug>ZoomWin")
 nmap <unique> <c-w>o  <Plug>ZoomWin
endif
nnoremap <silent> <script> <Plug>ZoomWin	:set lz<CR>:call <SID>ZoomWin()<CR>:set nolz<CR>

au VimLeave * call <SID>CleanupSessionFile()

" ---------------------------------------------------------------------

" ZoomWin:
func! <SID>ZoomWin()  

  if winbufnr(2) == -1
    " this is the only window
	
    if exists("g:tmpzoomfile") && filereadable(g:tmpzoomfile)
      exe 'silent! source '.g:tmpzoomfile
      silent! call delete(g:tmpzoomfile)

	  if exists("s:wininfo")
        " restore windows to scratch/noname etc
	    windo call <SID>RestoreWin()
		unlet s:wininfo
		unlet s:wintmplist
		call <SID>GotoWinNum(s:winkeep)
		unlet s:winkeep
	  endif
    endif

  else " more than one window

    let s:winkeep    = winnr()
    let s:winprblm   = 0
    let s:wininfo    = ""
    let s:wintmplist = ""

    windo call <SID>SaveWin()
	call <SID>GotoWinNum(s:winkeep)

	" set up session file
	if !exists("g:tmpzoomfile")
	 let g:tmpzoomfile= tempname()
	endif

	" save session
    let s=&ssop
	let &ssop= 'blank,buffers,curdir,folds,globals,help,localoptions,options,resize,slash,winpos,winsize'
    exe 'silent! mksession! '.g:tmpzoomfile
    let &ssop=s
    only!
  endif
endfunc

" ---------------------------------------------------------------------

" SaveWin: this function saves windows
fu! <SID>SaveWin()
  if &buftype == "nofile"
   " [Scratch] buffer saving
   let tmpname  = tempname()
   let s:wintmplist= tmpname."|".s:wintmplist
   set buftype=""
   exe "silent! file ".tmpname
   let s:wininfo= s:wininfo."0".tmpname."|"

  elseif bufname("%") == ""
   " noname buffer saving
   let tmpname  = tempname()
   set buftype=""
   exe "silent! file ".tmpname
   let s:wininfo= s:wininfo."1".tmpname."|"

  elseif &mod == 0
   " not modified, normal buffer saving
   let s:wininfo= s:wininfo."|"

  else
   " modified buffer saving
   let tmpname  = tempname()
   let s:wininfo= s:wininfo."2".escape(bufname("%")," ")."|"
   exe "file ".tmpname
  endif
endfunc

" ---------------------------------------------------------------------

" RestoreWin: this function restores noname and scratch windows
fu! <SID>RestoreWin()
  let wintype  = strpart(s:wininfo,0,1)
  if wintype == "|"
   let s:wininfo= strpart(s:wininfo,1)
  else
   let winname  = substitute(s:wininfo,'^.\(.\{-}\)|','\1','e')
   let s:wininfo= substitute(s:wininfo,'^.\{-}|\(.*\)$','\1','e')
   call delete(bufname("%"))
   if     wintype == 1
	" noname files
	set buftype=
	file -
   elseif wintype == 0
	" [Scratch] files
	set buftype=nofile
   elseif wintype == 2
	" modified files
	exe "file ".winname
   endif
  endif
endfunc

" ---------------------------------------------------------------------

" CleanupSessionFile: if you exit Vim before cleaning up the
"                     supposed-to-be temporary session file
func! <SID>CleanupSessionFile()
  if exists("g:tmpzoomfile") && filereadable(g:tmpzoomfile)
   silent! call delete(g:tmpzoomfile)
   unlet g:tmpzoomfile

   if exists("s:wintmplist")
	while s:wintmplist != ""
	 let tmpfile     = substitute(s:wintmplist,'^\(.\{-}\)|','\1','e')
	 let s:wintmplist= substitute(s:wintmplist,'^.\{-}|\(.*\)$','\1','e')
	 silent! call delete(tmpfile)
	endwhile
	unlet s:wintmplist
   endif
  endif

endfunc

" ---------------------------------------------------------------------

" GotoWinNum: this function puts cursor into specified window
fu! <SID>GotoWinNum(winnum)
  if a:winnum != winnr()
   exe a:winnum."wincmd w"
  endif
endfunc

" ---------------------------------------------------------------------
