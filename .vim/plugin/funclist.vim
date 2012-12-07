" File: funclist.vim
" Author: Yegappan Lakshmanan
" Version: 1.1
" Last Modified: April 26, 2002
"
" Overview
" --------
" The "Function List" (funclist.vim) plugin script opens a Vim window with
" a list of functions defined in the current file. When you select a function
" name from this window, the cursor will be positioned at the definition
" of the function in the source file. This script will run in both GUI
" and console/terminal version of Vim.
"
" This script relies on the exuberant ctags utility
" (http://ctags.sourceforge.net) to generate the function listing.  This
" script will run on all the platforms where the exuberant ctags utility is
" supported (this includes MS-Windows and Unix based systems).
"
" This script supports the following language files: Assembly, ASP, Awk, C,
" C++, Cobol, Eiffel, Fortran, Java, Lisp, Make, Pascal, Perl, PHP, Python,
" Rexx, Ruby, Scheme, Shell, Slang, TCL and Vim.
"
" You can select a function either by pressing the <Enter> key or by double
" clicking the name using a mouse.
"
" If you place the cursor on a function name in the "Function List" window,
" then the function prototype will be displayed at the Vim status line after
" 'updatetime' milliseconds. The default value for the 'updatetime' Vim option
" is 4 seconds.
"
" This script relies on the Vim "filetype" detection mechanism to determine
" the type of the current file. To turn on filetype detection use
"
"               :filetype on
"
" This script will not work in 'compatible' mode.  Make sure the 'compatible'
" option is not set.
"
" Configuration
" -------------
" By changing the following variables you can configure the behavior of this
" script. Set the following variables in your .vimrc file using the 'let'
" command.
"
" The script uses the Flist_Ctags_Cmd variable to locate the ctags utility.
" By default, this is set to /usr/bin/ctags. Set this variable in your .vimrc
" file to point to the location of the ctags utility in your system
"
"               let Flist_Ctags_Cmd = 'd:\tools\ctags.exe'
"
" To open the function list window, you have to press the key defined by the
" Flist_Key variable. By default, this variable is set to the <F8> key.
" You can modify this to a different key in your .vimrc file:
"
"               let Flist_Key = '\l'
"
" By default, the function names will be listed in the order in
" which they are defined in the file. You can alphabetically sort the function
" names by pressing the "s" key in the function list window. You can also
" change the default order by setting the variable Flist_Sort_Type to
" "name" or "order" in your .vimrc file:
"
"               let Flist_Sort_Type = "name"
"
" Be default, the function names will be listed in a vertically split window.
" If you prefer a horizontally split window, then set the
" 'Flist_Use_Horiz_Window' variable to 1 in your .vimrc file:
"
"               let Flist_Use_Horiz_Window = 1
"
" By default, the function names will be listed in only one window. The
" window will be reused for listing functions from different files. If you
" prefer to open a function list window for each file separately then set the
" 'Flist_Use_One_Window' variable to 0:
"
"               let Flist_Use_One_Window = 0
"
" By default, when the width of the window is less than 100 and a new function
" list window is opened vertically, then the window width will be increased by
" 20 to accomodate for the new window. If you have any screen refresh problems
" or if you prefer not to adjust the window size then set the
" 'Flist_Inc_Winwidth' variable to 0:
"
"               let Flist_Inc_Winwidth = 0
"

" ****************** Do not modify after this line ************************

if exists("loaded_funclist") || &cp
    finish
endif
let loaded_funclist=1

" The default location of the exuberant ctags
if !exists("Flist_Ctags_Cmd")
    let Flist_Ctags_Cmd = '/g/g20/casado/pub/bin/ctags'
endif

" Key to open the function listing window
if !exists("Flist_Key")
    let Flist_Key = '<F8>'
endif

" Function listing sort type
if !exists("Flist_Sort_Type")
    let Flist_Sort_Type = "order"
endif

" Use horizontally split window
if !exists("Flist_Use_Horiz_Window")
    let Flist_Use_Horiz_Window = 0
endif

" Increase the window width to show the function list window
if !exists("Flist_Inc_Winwidth")
    let Flist_Inc_Winwidth = 1
endif

" Use only one window for listing the functions in all the files or use
" multiple windows
if !exists("Flist_Use_One_Window")
    let Flist_Use_One_Window = 1
endif

if !exists("Flist_Max_WinWidth")
    let Flist_Max_WinWidth = 20
endif

" Map the key to open the function window
exe "nnoremap <unique> <silent> " . Flist_Key . " :call <SID>FlistOpenWindow(expand('%'), &filetype)<CR>"

" Colors used to highlight the selected function name
highlight clear FunctionName
if has("gui_running") || &t_Co> 2
    highlight FunctionName term=reverse cterm=bold
    highlight FunctionName ctermfg=0 ctermbg=3 guifg=Black guibg=Yellow
else
    highlight FunctionName term=reverse cterm=reverse
endif

" FlistOpenWindow
" List the functions defined in the specified file in a Vim window
function! s:FlistOpenWindow(filename, ftype)
    " Make sure the file name is not empty and is readable
    if a:filename == "" || !filereadable(a:filename)
        return
    endif

    " Exuberant ctags arguments to generate a function list
    let ctags_args = " --format=0 -f - "

    if g:Flist_Sort_Type == "name"
        let ctags_args = ctags_args . " --sort=yes "
    else
        let ctags_args = ctags_args . " --sort=no "
    endif

    " Specify argument depending on the filetype
    if a:ftype == 'asm'
        let ft_args = " --language-force=asm --asm-types=l "
    elseif a:ftype == 'aspperl' || a:ftype == 'aspvbs'
        let ft_args = " --language-force=asp --asp-types=fs "
    elseif a:ftype == 'awk'
        let ft_args = " --language-force=awk --awk-types=f "
    elseif a:ftype == 'c'
        let ft_args = " --language-force=c --c-types=f "
    elseif a:ftype == 'cpp'
        let ft_args = " --language-force=c++ --c++-types=f "
    elseif a:ftype == 'cobol'
        let ft_args = " --language-force=cobol --cobol-types=p "
    elseif a:ftype == 'eiffel'
        let ft_args = " --language-force=eiffel --eiffel-types=f "
    elseif a:ftype == 'fortran'
        let ft_args = " --language-force=fortran --fortran-types=f "
    elseif a:ftype == 'java'
        let ft_args = " --language-force=java --java-types=m "
    elseif a:ftype == 'lisp'
        let ft_args = " --language-force=lisp --lisp-types=f "
    elseif a:ftype == 'make'
        let ft_args = " --language-force=make --make-types=m "
    elseif a:ftype == 'pascal'
        let ft_args = " --language-force=pascal --pascal-types=f "
    elseif a:ftype == 'perl'
        let ft_args = " --language-force=perl --perl-types=s "
    elseif a:ftype == 'php'
        let ft_args = " --language-force=php --php-types=f "
    elseif a:ftype == 'python'
        let ft_args = " --language-force=python --python-types=f "
    elseif a:ftype == 'rexx'
        let ft_args = " --language-force=rexx --rexx-types=s "
    elseif a:ftype == 'ruby'
        let ft_args = " --language-force=ruby --ruby-types=f "
    elseif a:ftype == 'scheme'
        let ft_args = " --language-force=scheme --scheme-types=f "
    elseif a:ftype =~ '\<[cz]\=sh\>'
        let ft_args = " --language-force=sh --sh-types=f "
    elseif a:ftype == 'slang'
        let ft_args = " --language-force=slang --slang-types=f "
    elseif a:ftype == 'tcl'
        let ft_args = " --language-force=tcl --tcl-types=p "
    elseif a:ftype == 'vim'
        let ft_args = " --language-force=vim --vim-types=f "
    else
        return
    endif

    let ctags_cmd = g:Flist_Ctags_Cmd . ctags_args . ft_args
    let ctags_cmd = ctags_cmd . '"' . a:filename . '"'

    " Get the function list
    let ctags_cmd_output = system(ctags_cmd)

    if v:shell_error && ctags_cmd_output != ""
        echohl WarningMsg | echon ctags_cmd_output | echohl None
        return
    endif

    if ctags_cmd_output == ""
        return
    endif

    " Create a window for the function list (if it doesn't exist)
    if g:Flist_Use_One_Window == 1
        let winname = "__Function_List__"
    else
        let winname = "__" . a:filename . "__Function_List__"
    endif

    " If window is already present, reuse it
    let winnum = bufwinnr(winname)
    if winnum == -1
        " Create a new window. If user prefers a horizontal window, then
        " open a horizontally split window. Otherwise open a vertically
        " split window
        if g:Flist_Use_Horiz_Window == 1
            if g:Flist_Use_One_Window == 1
                exe "botright 10new " . winname
            else
                exe "rightbelow 10new " . winname
            endif
        else
            " Increase the window size, if needed, to accomodate the new
            " window
            if g:Flist_Inc_Winwidth == 1 && &columns < 100
                " one extra column is needed to include the vertical split
                set columns+=21
            endif

            " If only one function list window should be used, then open the
            " window at the leftmost place. Otherwise open a new vertically
            " split window
            if g:Flist_Use_One_Window == 1
                exe "topleft 20vnew" . winname
            else
                exe "20vnew " . winname
            endif
        endif

        " Mark buffer as scratch
        silent! setlocal buftype=nofile
        silent! setlocal bufhidden=delete
        silent! setlocal noswapfile
        silent! setlocal nowrap

        " Number of function names currently displayed in the window
        let w:FlistFuncCount = 0
    else
        if winnr() != winnum
            " Jump to the existing window
            exe winnum . "wincmd w"
        endif
        " Make the buffer modifiable
        silent! setlocal modifiable
        " Goto the first line in the buffer
        go
        " Delete the contents of the buffer to the black-hole register
        %delete _
    endif

    " Clear the function name highlight
    match none

    call append(0, '" Function listing for ' . a:filename)
    call append(1, '" Press s to sort by name/order')

    " Extract all the function names from the ctags output
    let pat = "\\([^\t]\\+\\)[^\n]\\+\n"
    let tagnames = substitute(ctags_cmd_output, pat, "\\1\n", "g")

    " Add the function names to the buffer
    silent! 2put =tagnames

    " Store the ctags output and the filename in window local variables
    let w:filename = a:filename
    let w:ftype = a:ftype

    " Goto the first line in the buffer
    go

    " Create a mapping for jumping to the functions and sorting the list
    nnoremap <buffer> <silent> <CR> :call <SID>FlistJumpFunction()<CR>
    nnoremap <buffer> <silent> <2-LeftMouse> :call <SID>FlistJumpFunction()<CR>
    nnoremap <buffer> <silent> s :call <SID>FlistChangeSort()<CR>

    " Highlight the comments
    if has("syntax") && !has("syntax_items")
        syn match FunctionListSynopsis    "^\" .*"
        hi def link FunctionListSynopsis    Special
    endif

    " Mark the buffer as not modifiable
    silent! setlocal nomodifiable

    " Create window local variables, one for each function. The format
    " of the variable is w:Flist{function_index}. Each variable will be
    " set to the corresponding function search pattern. This will be used
    " to display function prototypes and to jump to the function.
    " The window local w:FlistFuncCount variable contains the number of
    " functions currently displayed in the window

    " First delete all the old variables
    let i = w:FlistFuncCount
    while i > 2
        unlet! w:Flist{i}
        let i = i - 1
    endwhile

    " We start the function count from 3 instead of 1. This is to account
    " for the two comment lines displayed at the top of the window and to
    " match the function index with the function line number in the window
    " for easy lookup
    let i = 3

    " p1 - pattern to extract one line from ctags output
    " p2 - pattern to remove one line from ctags output
    let p1 = "[^\n]\\+"
    let p2 = "\\([^\n]\\+\\)\n"

    while ctags_cmd_output != ""
        let w:Flist{i} = matchstr(ctags_cmd_output, p1)

        let i = i + 1
        let ctags_cmd_output = substitute(ctags_cmd_output, p2, '', '')
    endwhile

    let w:FlistFuncCount = i - 1
endfunction

function! s:FlistChangeSort()
    if !exists("w:filename") || !exists("w:ftype")
        return
    endif

    if g:Flist_Sort_Type == "name"
        let g:Flist_Sort_Type = "order"
    else
        let g:Flist_Sort_Type = "name"
    endif

    call s:FlistOpenWindow(w:filename, w:ftype)
endfunction

" FlistJumpFunction
" Jump to the location of the selected function definition
function! s:FlistJumpFunction()
    " Do not process comment lines and empty lines
    let curline = getline(".")
    if curline == "" || curline[0] == '"'
        return
    endif

    " Word under cursor
    let funcname = curline

    " Get the tag output for the current function
    let mtxt = w:Flist{line(".")}

    if mtxt == ""
        return
    endif

    " Extract the tagname, file name and the search pattern
    let mx = "\\([^\t]\\+\\)\t\\([^\t]\\+\\)\t\/^\\(.*\\)\\\$\/"
    let tagname = substitute(mtxt, mx, '\1', '')
    let filename = substitute(mtxt, mx, '\2', '')
    let tagpat =  substitute(mtxt, mx, '\\\V\\\^\3\\\$', '')

    " Make sure the tag name and the file name are correct
    if tagname != funcname || filename != w:filename
        return
    endif

    " Clear previously selected name
    match none
    " Highlight the current selected name
    exe "match FunctionName /\\%" . line(".") . "l.*/"

    " Goto the window containing the file.  If the window is not there,
    " open a new window
    let winnum = bufwinnr(w:filename)
    if winnum == -1
        let bufnum = bufnr(w:filename)
        if g:Flist_Use_Horiz_Window == 1
            exe "leftabove split #" . bufnum
        else
            exe "rightbelow vertical split #" . bufnum
        endif
    else
        exe winnum . "wincmd w"
    endif

    " Jump to the function
    silent call search(tagpat, 'w')

    " Bring the line to the middle of the window
    normal! z.
endfunction

function! s:Flist_Show_Prototype()
    " Clear the previously displayed line
    echo

    " Do not process comment lines and empty lines
    let curline = getline(".")
    if curline == "" || curline[0] == '"'
        return
    endif

    " Word under cursor
    let funcname = curline

    " Get the tag output for the current function
    let mtxt = w:Flist{line(".")}

    if mtxt == ""
        return
    endif

    " Extract the tagname, file name and the search pattern
    let mx = "[^\t]\\+\t[^\t]\\+\t\/^\\(.*\\)\\\$\/"
    let tagpat =  substitute(mtxt, mx, '\1', '')

    echo tagpat
endfunction

" Autocommand to display the function prototype for the function under
" the cursor.
autocmd  CursorHold *__Function_List__ call s:Flist_Show_Prototype()

