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

syn cluster sassCssProperties contains=cssFontProp,cssFontDescriptorProp,cssColorProp,cssTextProp,cssBoxProp,cssGeneratedContentProp,cssPagingProp,cssUIProp,cssRenderProp,cssAuralProp,cssTableProp
syn cluster stylusCssAttributes contains=css.*Attr,scssComment,cssValue.*,cssColor,cssURL,sassDefault,cssImportant,cssError,cssStringQ,cssStringQQ,cssFunction,cssUnicodeEscape,cssRenderProp

" syn region sassDefinition matchgroup=cssBraces start="{" end="}" contains=TOP

" syn match sassProperty "\%([{};]\s*\|^\)\@<=\%([[:alnum:]-]\|#{[^{}]*}\)\+:" contains=css.*Prop skipwhite nextgroup=sassCssAttribute contained containedin=sassDefinition

" syn match sassProperty "^\s*\zs\s\%(\%([[:alnum:]-]\|#{[^{}]*}\)\+:\|:[[:alnum:]-]\+\)"hs=s+1 contains=css.*Prop skipwhite nextgroup=sassCssAttribute
syn match stylusProperty "^\s*\zs\s\%(\%([[:alnum:]-]\|#{[^{}]*}\)\+:\?\|:[[:alnum:]-]\+\)"hs=s+1 contains=css.*Prop skipwhite nextgroup=stylusCssAttribute

" syn match sassProperty "^\s*\zs\s\%(:\=[[:alnum:]-]\+\s*=\)"hs=s+1 contains=css.*Prop skipwhite nextgroup=sassCssAttribute

"syn match sassCssAttribute +\%("\%([^"]\|\\"\)*"\|'\%([^']\|\\'\)*'\|#{[^{}]*}\|[^{};]\)*+ contained contains=@sassCssAttributes,sassVariable,sassFunction,sassInterpolation
syn match stylusCssAttribute +\%("\%([^"]\|\\"\)*"\|'\%([^']\|\\'\)*'\|#{[^{}]*}\|[^{};]\)*+ contained contains=@stylusCssAttributes,sassVariable,stylusFunction,sassInterpolation

" syn match sassDefault "!default\>" contained
" syn match sassVariable "!\%(important\>\|default\>\)\@![[:alnum:]_-]\+"
" syn match sassVariable "$[[:alnum:]_-]\+"
" syn match sassVariableAssignment "\%([!$][[:alnum:]_-]\+\s*\)\@<=\%(||\)\==" nextgroup=sassCssAttribute skipwhite
" syn match sassVariableAssignment "\%([!$][[:alnum:]_-]\+\s*\)\@<=:" nextgroup=sassCssAttribute skipwhite


syn match stylusFunction "\<\%(red\|green\|blue\|alpha\|dark\|light\)\>(\@=" contained
syn match stylusFunction "\<\%(hue\|saturation\|lightness\|typeof\|unit\|match\)\>(\@=" contained
syn match stylusFunction "\<\%(hsla\|hsl\|rgba\|rgb\|lighten\|darken\|lighten-by\|darken-by\)\>(\@=" contained
syn match stylusFunction "\<\%(abs\|ceil\|floor\|round\|min\|max\|even\|odd\|sum\|avg\|join\)\>(\@=" contained
syn match stylusFunction "\<\%(desaturate\|saturate\|unquote\|quote\)\>(\@=" contained
syn match stylusFunction "\<\%(operate\|length\|warn\|error\|last\|p\|\)\>(\@=" contained
syn match stylusFunction "\<\%(opposite-position\|image-size\)\>(\@=" contained

syn match stylusType     "\<\%(null\|true\|false\|arguments\)\>(\@=" contained
syn match stylusControl  "\<\%(if\|else\|unless\|for\|in\|return\)\>(\@=" contained
" 
" syn region sassInterpolation matchgroup=sassInterpolationDelimiter start="#{" end="}" contains=@sassCssAttributes,sassVariable,sassFunction containedin=cssStringQ,cssStringQQ,sassProperty
" 
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

syn region sassInclude start="@import" end=";\|$" contains=scssComment,cssURL,cssUnicodeEscape,cssMediaType
syn region sassDebugLine end=";\|$" matchgroup=sassDebug start="@debug\>" contains=@sassCssAttributes,sassVariable,sassFunction
syn region sassWarnLine end=";\|$" matchgroup=sassWarn start="@warn\>" contains=@sassCssAttributes,sassVariable,sassFunction
syn region sassControlLine matchgroup=sassControl start="@\%(if\|else\%(\s\+if\)\=\|while\|for\)\>" end="[{};]\@=\|$" contains=sassFor,@sassCssAttributes,sassVariable,sassFunction
syn keyword sassFor from to through contained

syn keyword stylusTodo       FIXME NOTE TODO OPTIMIZE XXX contained

" syn region  sassComment     start="^\z(\s*\)//"  end="^\%(\z1 \)\@!" contains=sassTodo,@Spell
" syn region  sassCssComment  start="^\z(\s*\)/\*" end="^\%(\z1 \)\@!" contains=sassTodo,@Spell
syn region  stylusComment    start=+^\s*\/\/+ skip=+\n\s*\/\/+ end=+$+ keepend contains=stylusTodo,@Spell fold
syn region  stylusCssComment start="/\*"  end="\*/" contains=stylusTodo,@Spell fold

hi def link stylusCssComment            Comment
hi def link stylusComment               Comment
" hi def link sassDefault                 cssImportant
" hi def link sassVariable                Identifier
hi def link stylusFunction              Function
" hi def link sassMixing                  PreProc
" hi def link sassMixin                   PreProc
" hi def link sassExtend                  PreProc
hi def link stylusTodo                  Todo
" hi def link sassInclude                 Include
" hi def link sassDebug                   sassControl
" hi def link sassWarn                    sassControl
hi def link stylusType                  Type
hi def link stylusControl               PreProc
" hi def link sassFor                     PreProc
" hi def link sassEscape                  Special
" hi def link sassIdChar                  Special
" hi def link sassClassChar               Special
" hi def link sassInterpolationDelimiter  Delimiter
" hi def link sassAmpersand               Character
" hi def link sassId                      Identifier
" hi def link sassClass                   Type

let b:current_syntax = "stylus"

" vim:set sw=2:
