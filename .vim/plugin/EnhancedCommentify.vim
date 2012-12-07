" EnhancedCommentify.vim
" Maintainer:	Meikel Brandmeyer <Brandels_Mikesh@web.de>
" Version:	1.7
" Last Change:	Thursday, 10th January 2002

" Disription: 
" This is a simple script to comment lines in a program.
" Currently supported languages are C, C++, PHP, the vim scripting
" language, python, HTML, Perl, LISP, Tex, Shell, CAOS and others.
" It's easy to add new languages. Refer to the comments later in the
" file.

" Bugfixes:
"   1.7
"   Lines were not correctly decommentified, when there was whitespace
"   at the beginning of the line.    (thanks to Ma Xiangjiang) 
"   Fixed error detecting '*sh' filetypes. 
"   1.3
"   hlsearch was set unconditionally (thanks to Mary Ellen Foster)
"   made function silent	     (thanks to Mare Ellen Foster)

" Changelog:
"   1.7
"   Added different options to control behaviour of the plugin. 
"   Changed default Keybindings to proper plugin settings.
"   1.6
"   Now supports 'm4', 'config', 'automake'
"   'vb', 'aspvbs', 'plsql' (thanks to Zak Beck)
"   1.5
"   Now supports 'java', 'xml', 'jproperties'. (thanks to Scott Stirling)
"   1.4
"   Lines containing only whitespace are now considered empty.
"   Added Tcl support.
"   Multipart comments are now escaped with configurable alternative
"   strings. Prevents nesting errors (eg. /**/*/ in C)
"   1.3
"   Doesn't break lines like
"	foo(); /* bar */
"   when doing commentify.

" Install Details:
" Simply drop this file into your $HOME/.vim/plugin directory

if exists("DidToggleCommentify")
    finish
endif
let DidToggleCommentify = 1

" Setting the default options resp. taking user preferences.
if exists("g:EnhCommentifyAltOpen")
    let s:AltOpen = g:EnhCommentifyAltOpen
else
    let s:AltOpen = "|+"
endif

if exists("g:EnhCommentifyAltClose")
    let s:AltClose = g:EnhCommentifyAltClose
else
    let s:AltClose = "+|"
endif

if exists("g:EnhCommentifyIgnoreWS") && g:EnhCommentifyIgnoreWS =~ "[Nn][Oo]*"
    let s:IgnoreWS = ""
else
    let s:IgnoreWS = "[ \t]*"
endif

if exists("g:EnhCommentifyPretty") && g:EnhCommentifyPretty =~ "[Yy][Ee]*[Ss]*"
    let s:PrettyComments = ' '
else
    let s:PrettyComments = ''
endif

"
" ToggleCommentify(emptyLines)
"	emptyLines	-- commentify empty lines
"			   may be 'yes' or 'no'
"
" Commentifies the current line.
"
function s:ToggleCommentify(emptyLines)
    let lineString = getline(".")

    if lineString !~ "^[ \t]*$" || a:emptyLines == 'yes' " don't comment empty lines
	let fileType = &ft  " finding out the file-type, and specifying the
			    " comment symbol
	
	" First handle multipart languages, then -- after the 'else' --
    	" handle singlepart languages.
	if fileType == 'c' || fileType == 'css'
	    call s:CommentifyMultiPart(lineString, '/*', '*/')
	elseif fileType == 'html' || fileType == 'xml'
	    call s:CommentifyMultiPart(lineString, '<!--', '-->')
	else
	    " For single part languages, simply add here the filetype
	    " and the corresponding commentSymbol. (Or add the filetype
	    " to the appropriate if-clause)
	    if fileType == 'ox' || fileType == 'cpp' || fileType == 'php' 
		    \ || fileType == 'java'
		let commentSymbol = '//'
	    elseif fileType == 'vim'
		let commentSymbol = '"'
	    elseif fileType == 'python' || fileType == 'perl'
			\ || fileType =~ '[^w]*sh$' || fileType == 'tcl' 
			\ || fileType == 'jproperties'
		let commentSymbol = '#'
	    elseif fileType == 'lisp' || fileType == 'scheme'
		let commentSymbol = ';'
	    elseif fileType == 'tex'
		let commentSymbol = '%'
	    elseif fileType == 'caos'
		let commentSymbol = '*'
	    elseif fileType == 'm4' || fileType == 'config'
			\ || fileType == 'automake'
		let commentSymbol = 'dnl '
	    elseif fileType == 'vb' || fileType == 'aspvbs'
		let commentSymbol == "\'"
	    elseif fileType == 'plsql'
		let commensSymbol == '--'
	    else
		execute 'echo "ToggleCommentify has not (yet) been implemented for this file-type"'
		let commentSymbol = ''
	    endif
	    
	    " If the language is not supported, we do nothing.
	    if commentSymbol != ''
		call s:CommentifySinglePart(lineString, commentSymbol)
	    endif
	endif
    endif
endfunction

"
" CommentifyMultiPart(lineString, commentStart, commentEnd)
"	lineString	-- line to commentify
"	commentStart	-- comment-start string, eg '/*'
"	commentEnd	-- comment-end string, eg. '*/'
"
" This function commentifies code of languages, which have multipart
" comment strings, eg. '/*' - '*/' of C.
"
function s:CommentifyMultiPart(lineString, commentStart, commentEnd)
    if a:lineString =~ "^". s:IgnoreWS . s:EscapeString(a:commentStart)
		\ && a:lineString =~ s:EscapeString(a:commentEnd) . s:IgnoreWS . "$"
	silent call s:UnCommentify(s:EscapeString(a:commentStart),
		    \ s:EscapeString(a:commentEnd))
    else
	silent call s:Commentify(a:commentStart, a:commentEnd)
    endif
endfunction

"
" CommentifySinglePart(lineString, commentSymbol)
"	lineString	-- line to commentify
"	commentSymbol	-- comment string, eg '#'
"
" This function is used for all languages, whose comment strings
" consist only of one string at the beginning of a line.
"
function s:CommentifySinglePart(lineString, commentSymbol)
    if a:lineString =~ "^". s:IgnoreWS . s:EscapeString(a:commentSymbol)
	silent call s:UnCommentify(s:EscapeString(a:commentSymbol))
    else
	silent call s:Commentify(a:commentSymbol)
    endif
endfunction

"
" Commentify(commentSymbol, [commentEnd])
"	commentSymbol	-- string to insert at the beginning of the line
"	commentEnd	-- string to insert at the end of the line
"			   may be omitted
"
" This function inserts the start- (and if given the end-) string of the
" comment in the current line.
"
function s:Commentify(commentSymbol, ...)
    let s:rescue_hls = &hlsearch  
    set nohlsearch
    
    " If a end string is present, insert it too.
    if a:0 == 1
	" First we have to escape any comment already contained in the line, since
	" (at least for C) comments are not allowed to nest.

	silent! execute ':s~'. s:EscapeString(a:commentSymbol) .'~'.
		    \ s:AltOpen .'~g'
	silent! execute ':s~'. s:EscapeString(a:1) .'~'.
		    \ s:AltClose .'~g'
	
	execute ':s~$~'. s:PrettyComments . a:1 .'~'
    endif
    
    " insert the comment symbol
    execute ':s~^~'. a:commentSymbol . s:PrettyComments .'~'

    let &hlsearch = s:rescue_hls
endfunction

"
" UnCommentify(commentSymbol, [commentEnd])       
"	commentSymbol	-- string to remove at the beginning of the line
"	commentEnd	-- string to remove at the end of the line
"			   may be omitted
"
" This function removes the start- (and if given the end-) string of the
" comment in the current line.
"
function s:UnCommentify(commentSymbol, ...)
    let s:rescue_hls = &hlsearch 
    set nohlsearch

    " remove the first comment symbol found on a line
    execute ':s~'. a:commentSymbol . s:PrettyComments .'~~'

    " If a end string is present, we have to remove it, too.
    if a:0 == 1
	" First, we remove the trailing comment symbol. We can assume, that it
	" is there, because we check for it.
	execute ':s~'. s:PrettyComments . a:1 .'$~~'

	" Remove any escaped inner comments.
	silent! execute ':s~|+~'. a:commentSymbol .'~g'
	silent! execute ':s~+|~'. a:1 .'~g'
    endif

    let &hlsearch = s:rescue_hls
endfunction

"
" EscapeString(string)
"	string	    -- string to process
"
" Escapes characters in 'string', which have some function in
" regular expressions, with a '\'.
"
" Returns the escaped string.
"
function s:EscapeString(string)
    return escape(a:string, "\\*+{}[]()$^")
endfunction

"
" CommentEmptyLines(ft)
"	ft	    -- filetype of current buffer
"
" Decides, if empty lines should be commentified or not. Add the filetype, you want
" to change, to the apropriate if-clause.
"
function s:CommentEmptyLines(ft)
    if (a:ft == 'vim' || a:ft == 'perl' || a:ft == 'caos' || a:ft == 'python'
       	\ || a:ft == 'ox' || a:ft == 'cpp' || a:ft == 'php' || a:ft == 'tex'
	\ || a:ft =~ '[^w]*sh$' || a:ft == 'lisp' || a:ft == 'scheme' || a:ft == 'java')
	return 'yes'
    elseif (a:ft == 'c' || a:ft == 'html' || a:ft == 'xml')
	return 'no'
    else " Default behaviour
	return 'no'
    endif
endfunction

"
" Keyboard mappings.

noremap <Plug>Commentify :call <SID>ToggleCommentify(<SID>CommentEmptyLines(&ft))<CR>

"
" Finally set keybindings.
"
if exists("g:EnhCommentifyUseAltKeys") && g:EnhCommentifyUseAltKeys =~ "[Yy][Ee]*[Ss]*"
    nmap <silent> <unique> <M-c> <Plug>Commentifyj
    nmap <silent> <unique> <M-x> <Plug>Commentify

    imap <silent> <unique> <M-c> <Esc><Plug>Commentifyji
    imap <silent> <unique> <M-x> <Esc><Plug>Commentifyi

    vmap <silent> <unique> <M-c> <Plug>Commentify
else
    nmap <silent> <unique> <Leader>c <Plug>Commentifyj
    nmap <silent> <unique> <Leader>x <Plug>Commentify
    
    imap <silent> <unique> <Leader>c <Esc><Plug>Commentifyji
    imap <silent> <unique> <Leader>x <Esc><Plug>Commentifyi

    vmap <silent> <unique> <Leader>c <Plug>Commentify
endif

