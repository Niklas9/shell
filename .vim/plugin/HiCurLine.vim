" HiCurLine : a rudimentary attempt to highlight matching brackets
"  Author:  Charles E. Campbell, Jr.
"  Date:    Feb 06, 2003
"  Version: 1
"
" A Vim v6.0 plugin with menus for gvim
"
" Usage:
"   \hcli : initialize highlighting of matching bracket
"   \hcls : stop       highlighting of matching bracket
"
"   Actually <Leader> is used, so you may set mapleader to change
"   the leading backslash to whatever you want in your <.vimrc>
"
"   * Now uses Search (instead of Special) highlighting
"
" History:
" v1   epoch   -- modified <HiCurLine.vim>
if exists("loaded_HiCurLine") || &cp
 finish
endif
let loaded_HiCurLine= 1

" Public Interface
if !hasmapto('<Plug>HCLStart')
 map <unique> <Leader>hcli	<Plug>HCLStart
endif
if !hasmapto('<Plug>HCLStop')
 map <unique> <Leader>hcls	<Plug>HCLStop
endif

" Global Maps:
nmap <silent> <unique> <script> <Plug>HCLStart :set lz<CR>:call <SID>HCLStart()<CR>:set nolz<CR>
nmap <silent> <unique> <script> <Plug>HCLStop  :set lz<CR>:call <SID>HCLStop()<CR>:set nolz<CR>

" DrChip menu support:
if has("gui_running") && has("menu")
 if !exists("g:DrChipTopLvlMenu")
  let g:DrChipTopLvlMenu= "DrChip."
 endif
 exe 'menu '.g:DrChipTopLvlMenu.'HiCurLine.Start<tab>\\[i	<Leader>[i'
endif

" =====================================================================

" HCLStart:
fu! <SID>HCLStart()
 if exists("b:dohicurline") && b:dohicurline == 1
   " already in HiCurLine mode
   echo "[HiCurLine]"
   return
 endif
 let b:dohicurline= 1
 let b:restoremap  = ""

 " Save Maps (if any)
 call <SID>SaveMap("n","",":F(")
 call <SID>SaveMap("n","",":F)")
 call <SID>SaveMap("n","",":F[")
 call <SID>SaveMap("n","",":F]")
 call <SID>SaveMap("n","",":F{")
 call <SID>SaveMap("n","",":F}")
 call <SID>SaveMap("n","",":f(")
 call <SID>SaveMap("n","",":f)")
 call <SID>SaveMap("n","",":f[")
 call <SID>SaveMap("n","",":f]")
 call <SID>SaveMap("n","",":f{")
 call <SID>SaveMap("n","",":f}")
 call <SID>SaveMap("n","","<c-b>")
 call <SID>SaveMap("n","","<c-d>")
 call <SID>SaveMap("n","","<c-f>")
 call <SID>SaveMap("n","","<c-u>")
 call <SID>SaveMap("n","","<down>")
 call <SID>SaveMap("n","","<end>")
 call <SID>SaveMap("n","","<home>")
 call <SID>SaveMap("n","","<left>")
 call <SID>SaveMap("n","","<right>")
 call <SID>SaveMap("n","","<up>")
 call <SID>SaveMap("n","","webEBjklh$0%;,")
 call <SID>SaveMap("o","","<down>")
 call <SID>SaveMap("o","","<end>")
 call <SID>SaveMap("o","","<home>")
 call <SID>SaveMap("o","","<left>")
 call <SID>SaveMap("o","","<right>")
 call <SID>SaveMap("o","","<up>")
 if has("gui_running") && has("menu")
  call <SID>SaveMap("n","","<leftmouse>")
  call <SID>SaveMap("o","","<leftmouse>")
 endif

 " keep and set options
 let b:vbkeep   = &vb
 let b:t_vbkeep = &t_vb
 set vb t_vb=

 " indicate in HiCurLine mode
 echo "[HiCurLine]"

 " Install HiCurLine maps
 inoremap <silent> <down>      <down><c-o>:silent call <SID>HiCurLine()<CR>
 inoremap <silent> <up>        <up><c-o>:silent call <SID>HiCurLine()<CR>
 inoremap <silent> <right>     <right><c-o>:silent call <SID>HiCurLine()<CR>
 inoremap <silent> <left>      <left><c-o>:silent call <SID>HiCurLine()<CR>
 inoremap <silent> <home>      <home><c-o>:silent call <SID>HiCurLine()<CR>
 inoremap <silent> <end>       <end><c-o>:silent call <SID>HiCurLine()<CR>
 nnoremap <silent> <down>      j:silent call <SID>HiCurLine()<CR>
 nnoremap <silent> <up>        k:silent call <SID>HiCurLine()<CR>
 nnoremap <silent> <right>     l:silent call <SID>HiCurLine()<CR>
 nnoremap <silent> <left>      h:silent call <SID>HiCurLine()<CR>
 nnoremap <silent> <home> <home>:silent call <SID>HiCurLine()<CR>
 nnoremap <silent> <end>   <end>:silent call <SID>HiCurLine()<CR>
 if has("gui_running") && has("menu")
  nnoremap <silent> <leftmouse> <leftmouse>:silent call <SID>HiCurLine()<CR>
  inoremap <silent> <leftmouse> <leftmouse><c-o>:silent call <SID>HiCurLine()<CR>
 endif
 nnoremap <silent>   w         w:silent call <SID>HiCurLine()<CR>
 nnoremap <silent>   b         b:silent call <SID>HiCurLine()<CR>
 nnoremap <silent>   B         B:silent call <SID>HiCurLine()<CR>
 nnoremap <silent>   e         e:silent call <SID>HiCurLine()<CR>
 nnoremap <silent>   E         E:silent call <SID>HiCurLine()<CR>
 nnoremap <silent>   j         j:silent call <SID>HiCurLine()<CR>
 nnoremap <silent>   k         k:silent call <SID>HiCurLine()<CR>
 nnoremap <silent>   l         l:silent call <SID>HiCurLine()<CR>
 nnoremap <silent>   h         h:silent call <SID>HiCurLine()<CR>
 nnoremap <silent>   $         $:silent call <SID>HiCurLine()<CR>
 nnoremap <silent>   0         0:silent call <SID>HiCurLine()<CR>
 nnoremap <silent>   %         %:silent call <SID>HiCurLine()<CR>
 nnoremap <silent> <c-f>   <c-f>:silent call <SID>HiCurLine()<CR>
 nnoremap <silent> <c-b>   <c-b>:silent call <SID>HiCurLine()<CR>
 nnoremap <silent> <c-d>   <c-d>:silent call <SID>HiCurLine()<CR>
 nnoremap <silent> <c-u>   <c-u>:silent call <SID>HiCurLine()<CR>
 nnoremap <silent>  f(        f(:silent call <SID>HiCurLine()<CR>
 nnoremap <silent>  f)        f):silent call <SID>HiCurLine()<CR>
 nnoremap <silent>  f{        f{:silent call <SID>HiCurLine()<CR>
 nnoremap <silent>  f}        f}:silent call <SID>HiCurLine()<CR>
 nnoremap <silent>  f[        f[:silent call <SID>HiCurLine()<CR>
 nnoremap <silent>  f]        f]:silent call <SID>HiCurLine()<CR>
 nnoremap <silent>  F(        F(:silent call <SID>HiCurLine()<CR>
 nnoremap <silent>  F)        F):silent call <SID>HiCurLine()<CR>
 nnoremap <silent>  F{        F{:silent call <SID>HiCurLine()<CR>
 nnoremap <silent>  F}        F}:silent call <SID>HiCurLine()<CR>
 nnoremap <silent>  F[        F[:silent call <SID>HiCurLine()<CR>
 nnoremap <silent>  F]        F]:silent call <SID>HiCurLine()<CR>
 if exists("mapleader")
  if mapleader != ';'
   nnoremap <silent>  ;        ;:silent call <SID>HiCurLine()<CR>
  endif
  if mapleader != ','
   nnoremap <silent>  ,        ,:silent call <SID>HiCurLine()<CR>
  endif
 else
   nnoremap <silent>  ;        ;:silent call <SID>HiCurLine()<CR>
   nnoremap <silent>  ,        ,:silent call <SID>HiCurLine()<CR>
 endif

 " Insert stop  HiCurLine into menu
 " Delete start HiCurLine from menu
 if has("gui_running") && has("menu")
  exe 'unmenu '.g:DrChipTopLvlMenu.'HiCurLine.Start'
  exe 'menu '.g:DrChipTopLvlMenu.'HiCurLine.Stop<tab>\\[s	<Leader>[s'
 endif
endfunction

" ---------------------------------------------------------------------

" HCLStop:
fu! <SID>HCLStop()
 if !exists("b:dohicurline")
  echo "[HiCurLine off]"
  return
 endif
 unlet b:dohicurline
 match none

 echo "[HiCurLine off]"
 iunmap <down>
 iunmap <end>
 iunmap <home>
 iunmap <left>
 iunmap <right>
 iunmap <up>
 nunmap <down>
 nunmap <end>
 nunmap <home>
 nunmap <left>
 nunmap <right>
 nunmap <up>
 nunmap   w
 nunmap   e
 nunmap   b
 nunmap   E
 nunmap   B
 nunmap   j
 nunmap   k
 nunmap   l
 nunmap   h
 nunmap   $
 nunmap   0
 nunmap   %
 nunmap <c-b>
 nunmap <c-d>
 nunmap <c-f>
 nunmap <c-u>
 nunmap F(
 nunmap F)
 nunmap F[
 nunmap F]
 nunmap F{
 nunmap F}
 nunmap f(
 nunmap f)
 nunmap f[
 nunmap f]
 nunmap f{
 nunmap f}
 if has("gui_running") && has("menu")
  nunmap <leftmouse>
 iunmap <leftmouse>
 endif
 if exists("mapleader")
  if mapleader != ';'
   nunmap ;
  endif
  if mapleader != ','
   nunmap ,
  endif
 else
   nunmap ;
   nunmap ,
 endif

 " restore user map(s), if any
 if b:restoremap != ""
  exe b:restoremap
  unlet b:restoremap
 endif

 " restore user options
 let &vb   = b:vbkeep
 let &t_vb = b:t_vbkeep

 " Insert start HiCurLine into menu
 " Delete stop  HiCurLine from menu
 if has("gui_running") && has("menu")
  exe 'unmenu '.g:DrChipTopLvlMenu.'HiCurLine.Stop'
  exe 'menu '.g:DrChipTopLvlMenu.'HiCurLine.Start<tab>\\[s	<Leader>[i'
 endif
endfunction

" ---------------------------------------------------------------------

" HiCurLine:
fu! <SID>HiCurLine()
 let curline   = line('.')
 exe 'match Search /\%'.curline.'l/'
endfunction

" ---------------------------------------------------------------------

" SaveMap: this function sets up a buffer-variable (b:restoremap)
"          which will be used by HCLStop to restore user maps
"          mapchx: either <something>  which is handled as one map item
"                  or a string of single letters which are multiple maps
"                  ex.  mapchx="abc" and maplead='\': \a \b and \c are saved
fu! <SID>SaveMap(mapmode,maplead,mapchx)

 if strpart(a:mapchx,0,1) == ':'
  " save single map :...something...
  let amap=strpart(a:mapchx,1)
  if maparg(amap,a:mapmode) != ""
   let b:restoremap= a:mapmode."map ".amap." ".maparg(amap,a:mapmode)."|".b:restoremap
   exe a:mapmode."unmap ".amap
  endif

 elseif strpart(a:mapchx,0,1) == '<'
  " save single map <something>
  if maparg(a:mapchx,a:mapmode) != ""
   let b:restoremap= a:mapmode."map ".a:mapchx." ".maparg(a:mapchx,a:mapmode)."|".b:restoremap
   exe a:mapmode."unmap ".a:mapchx
  endif

 else
  " save multiple maps
  let i= 1
  while i <= strlen(a:mapchx)
   let amap=a:maplead.strpart(a:mapchx,i-1,1)
   if maparg(amap,a:mapmode) != ""
    let b:restoremap= a:mapmode."map ".amap." ".maparg(amap,a:mapmode)."|".b:restoremap
    exe a:mapmode."unmap ".amap
   endif
   let i= i + 1
  endwhile
 endif
endfunction

" ---------------------------------------------------------------------
