" Vim indent file
" Language: Stylus
" Maintainer: Marc Harter
" Based On: Tim Pope (sass.vim)

if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal autoindent sw=2 et
setlocal indentexpr=GetStylusIndent()
setlocal indentkeys=o,O,*<Return>,<:>,!^F

" Only define the function once.
if exists("*GetStylusIndent")
  finish
endif

function! GetStylusIndent()
  let lnum = prevnonblank(v:lnum-1)
  let line = substitute(getline(lnum),'\s\+$','','')
  let cline = substitute(substitute(getline(v:lnum),'\s\+$','',''),'^\s\+','','')
  let lastcol = strlen(line)
  let line = substitute(line,'^\s\+','','')
  let indent = indent(lnum)
  let cindent = indent(v:lnum)

  if line =~ '^\s*'
    return increase
  elseif group =~? '\v^%(stylusId|stylusClass)$'
    return increase
  else
    return indent
  endif
endfunction

" vim:set sw=2:
