" Vim indent file
" Language: Stylus
" Maintainer: Marc Harter
" Last Change: 2010 May 21
" Based On: sass.vim from Tim Pope

if exists("b:did_indent")
  finish
endif
unlet! b:did_indent
let b:did_indent = 1

setlocal autoindent sw=2 sts=2 ts=2 et
setlocal indentexpr=GetSylusIndent()
setlocal indentkeys=o,O,*<Return>,<:>,!^F

" Only define the function once.
if exists("*GetSylusIndent")
  finish
endif

let s:property = '^\s*:\|^\s*[[:alnum:]-]\+\%(:\|\s*=\)'

function! GetSylusIndent()
  let lnum = prevnonblank(v:lnum-1)
  let line = substitute(getline(lnum),'\s\+$','','')
  let cline = substitute(substitute(getline(v:lnum),'\s\+$','',''),'^\s\+','','')
  let lastcol = strlen(line)
  let line = substitute(line,'^\s\+','','')
  let indent = indent(lnum)
  let cindent = indent(v:lnum)
  if line !~ s:property && cline =~ s:property
    return indent + &sw
  elseif line =~ s:property && cline !~ s:property
    return indent - &sw
  else
    return -1
  endif
endfunction

" vim:set sw=2;
