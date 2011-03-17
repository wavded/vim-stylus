" Vim syntax file
" Language: Stylus
" Maintainer: Marc Harter
" Filenames: *.styl, *.stylus
" Based On: Tim Pope (sass.vim)

if exists("b:current_syntax")
  finish
endif

runtime! syntax/css.vim

syn case ignore

syn cluster stylusCssAttributes contains=css.*Attr,stylusComment,cssValue.*,cssColor,cssURL,sassDefault,cssImportant,cssError,cssStringQ,cssStringQQ,cssFunction,cssUnicodeEscape,cssRenderProp

syn region stylusDefinition matchgroup=cssBraces start="{" end="}" contains=TOP
syn match stylusProperty "\%([{};]\s*\|^\)\@<=\%([[:alnum:]-]\|#{[^{}]*}\)\+:" contains=css.*Prop skipwhite nextgroup=stylusCssAttribute contained containedin=stylusDefinition

" syn match sassProperty "^\s*\zs\s\%(\%([[:alnum:]-]\|#{[^{}]*}\)\+:\|:[[:alnum:]-]\+\)"hs=s+1 contains=css.*Prop skipwhite nextgroup=sassCssAttribute
syn match stylusProperty "^\s*\zs\s\%(\%([[:alnum:]-]\|#{[^{}]*}\)\+:\?\|:[[:alnum:]-]\+\)"hs=s+1 contains=css.*Prop skipwhite nextgroup=stylusCssAttribute

" syn match stylusProperty "^\s*\zs\s\%(:\=[[:alnum:]-]\+\s*=\)"hs=s+1 contains=css.*Prop skipwhite nextgroup=stylusCssAttribute

" syn match stylusVariableAssignment "\%([[:alnum:]_-]\+\s*\)\@<=\%(||\)\==" nextgroup=stylusCssAttribute skipwhite
syn match stylusVariableAssignment "\%([[:alnum:]_-]\+\s*\)\@<==" nextgroup=stylusCssAttribute,stylusVariable skipwhite

"syn match sassCssAttribute +\%("\%([^"]\|\\"\)*"\|'\%([^']\|\\'\)*'\|#{[^{}]*}\|[^{};]\)*+ contained contains=@sassCssAttributes,sassVariable,sassFunction,sassInterpolation
syn match stylusCssAttribute +\%("\%([^"]\|\\"\)*"\|'\%([^']\|\\'\)*'\|#{[^{}]*}\|[^{};]\)*+ contained contains=@stylusCssAttributes,stylusFunction,stylusVariable,stylusControl

syn match stylusFunction "\<\%(red\|green\|blue\|alpha\|dark\|light\)\>(\@=" contained
syn match stylusFunction "\<\%(hue\|saturation\|lightness\|typeof\|unit\|match\)\>(\@=" contained
syn match stylusFunction "\<\%(hsla\|hsl\|rgba\|rgb\|lighten\|darken\|lighten-by\|darken-by\)\>(\@=" contained
syn match stylusFunction "\<\%(abs\|ceil\|floor\|round\|min\|max\|even\|odd\|sum\|avg\|join\)\>(\@=" contained
syn match stylusFunction "\<\%(desaturate\|saturate\|unquote\|quote\)\>(\@=" contained
syn match stylusFunction "\<\%(operate\|length\|warn\|error\|last\|p\|\)\>(\@=" contained
syn match stylusFunction "\<\%(opposite-position\|image-size\)\>(\@=" contained

syn keyword stylusVariable null true false arguments
syn keyword stylusControl  if else unless for in return

" syn region stylusInterpolation matchgroup=stylusInterpolationDelimiter start="{" end="}" keepend contains=@stylusCssAttributes,stylusVariable,stylusFunction

" syn match sassMixinName "[[:alnum:]_-]\+" contained nextgroup=sassCssAttribute
" syn match sassMixin  "^="               nextgroup=sassMixinName
" syn match sassMixin  "\%([{};]\s*\|^\s*\)\@<=@mixin"   nextgroup=sassMixinName skipwhite
" syn match sassMixing "^\s\+\zs+"        nextgroup=sassMixinName
" syn match sassMixing "\%([{};]\s*\|^\s*\)\@<=@include" nextgroup=sassMixinName skipwhite
" syn match sassExtend "\%([{};]\s*\|^\s*\)\@<=@extend"
" 
" syn match sassEscape     "^\s*\zs\\"
" syn match sassIdChar     "#[[:alnum:]_-]\@=" nextgroup=sassId
" syn match sassId         "[[:alnum:]_-]\+" contained
" syn match sassClassChar  "\.[[:alnum:]_-]\@=" nextgroup=sassClass
" syn match sassClass      "[[:alnum:]_-]\+" contained
" syn match sassAmpersand  "&"

syn keyword stylusTodo       FIXME NOTE TODO OPTIMIZE XXX contained

syn region  stylusComment    start=+^\s*\/\/+ skip=+\n\s*\/\/+ end=+$+ keepend contains=stylusTodo,@Spell fold
syn region  stylusCssComment start="/\*"  end="\*/" contains=stylusTodo,@Spell fold

hi def link stylusCssComment            Comment
hi def link stylusComment               Comment
" hi def link sassDefault                 cssImportant
" hi def link sassVariable                Identifier
" hi def link sassMixing                  PreProc
" hi def link sassMixin                   PreProc
" hi def link sassExtend                  PreProc
hi def link stylusTodo                  Todo
" hi def link sassInclude                 Include
" hi def link sassDebug                   sassControl
" hi def link sassWarn                    sassControl
hi def link stylusVariable              Identifier
hi def link stylusControl               PreProc
hi def link stylusFunction              Function
hi def link stylusUserFunction          Special
" hi def link sassFor                     PreProc
" hi def link sassEscape                  Special
" hi def link sassIdChar                  Special
" hi def link sassClassChar               Special
hi def link sassInterpolationDelimiter  Delimiter
" hi def link sassAmpersand               Character
" hi def link sassId                      Identifier
" hi def link sassClass                   Type

let b:current_syntax = "stylus"

" vim:set sw=2:
