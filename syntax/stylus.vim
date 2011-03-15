" Vim syntax file
" Language: Stylus
" Maintainer: Marc Harter
" Filenames: *.styl,*.stylus

if exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  let main_syntax = 'stylus'
endif

runtime! syntax/css.vim
unlet! b:current_syntax

syn match stylusKeyword "@([-\w]+)"
syn match stylusId "(#)[a-zA-Z][a-zA-Z0-9_-]*"
syn match stylusClass "(\.)[a-zA-Z0-9_-]+"
syn match stylusPsuedoElement "(:+)\b(after|before|first-child|first-letter|first-line|selection)\b"
syn match stylusPsuedoClass "(:)\b(active|hover|link|visited|focus)\b"
syn match stylusControl "\b(!important|for|in|return|true|false|null|if|else|unless|return)\b"
syn match stylusNumeric "(?:\b(\d+))|(#[a-fA-F0-9]+)"
syn region stylusDoubleString start="\""  end="\""
syn region stylusSingleString start="'"  end="'"
syn region stylusMultiLineComment start="/\*"  end="\*/"
syn match stylusSingleLineComment "(?:^[ \t]+)?(\/\/).*$\n?"
syn match stylusFunction "([-a-zA-Z_][-\w]*)?(\()"

hi def link stylusKeyword Type
hi def link stylusId Statement
hi def link stylusClass Identifier
hi def link stylusPsuedoElement PreProc
hi def link stylusPsuedoClass Special
hi def link stylusControl PreProc
hi def link stylusNumeric Number
hi def link stylusDoubleString String
hi def link stylusSingleString String
hi def link stylusMultiLineComment Comment
hi def link stylusSingleLineComment Comment
hi def link stylusFunction Function

let b:current_syntax = "stylus"

if main_syntax == "stylus"
  unlet main_syntax
endif
