" Vim syntax file
" Language: Stylus
" Maintainer: Marc Harter
" Filenames: *.styl, *.stylus
" Based On: Tim Pope (sass.vim)

if exists("b:current_syntax")
  finish
endif

runtime! syntax/css.vim
runtime! expand("<sfile>:p:h") . "/css3.vim"

syn case ignore
syn region cssInclude start="@import" end="\n" contains=cssComment,cssURL,cssUnicodeEscape,cssMediaType

syn cluster stylusCssSelectors contains=cssTagName,cssSelector.*,cssIdentifier,cssAttributeSelector,cssPseudo.*,cssClassName
syn cluster stylusCssAttributes contains=css.*Attr,cssValue.*,cssColor,cssURL,cssImportant,cssError,cssStringQ,cssStringQQ,cssFunction,cssUnicodeEscape,cssRenderProp,css.*Val

syn region stylusDefinition matchgroup=cssBraces start="{" end="}" contains=TOP

syn match stylusVariable "$\?[[:alnum:]_-]\+"
syn match stylusVariableAssignment "\%([[:alnum:]_-]\+\s*\)\@<==" nextgroup=stylusCssAttribute,stylusVariable skipwhite

syn match stylusProperty "\%([{};]\s*\|^\)\@<=\%([[:alnum:]-]\|#{[^{}]*}\)\+:" contains=css.*Prop skipwhite nextgroup=stylusCssAttribute contained containedin=stylusDefinition
syn match stylusProperty "^\s*\zs\s\%(\%([[:alnum:]-]\|#{[^{}]*}\)\+[ :]\|:[[:alnum:]-]\+\)"hs=s+1 contains=css.*Prop skipwhite nextgroup=stylusCssAttribute
syn match stylusProperty "^\s*\zs\s\%(:\=[[:alnum:]-]\+\s*=\)"hs=s+1 contains=css.*Prop skipwhite nextgroup=stylusCssAttribute

syn match stylusCssAttribute +\%("\%([^"]\|\\"\)*"\|'\%([^']\|\\'\)*'\|#{[^{}]*}\|[^{};]\)*+ contained contains=@stylusCssAttributes,stylusFunction,stylusVariable,stylusControl,stylusUserFunction,stylusInterpolation,stylusComment,stylusCssComment

syn match stylusInterpolation %{[[:alnum:]_-]\+}%

syn match stylusUserFunction "^\s*\%([[:alnum:]_-]\+\)(\@="
syn match stylusUserFunction "\<\%([^)]*\)\>(\@=" contained

syn match stylusFunction "\<\%(red\|green\|blue\|alpha\|dark\|light\)\>(\@=" contained
syn match stylusFunction "\<\%(hue\|saturation\|lightness\|push\|unshift\|typeof\|unit\|match\)\>(\@=" contained
syn match stylusFunction "\<\%(hsla\|hsl\|rgba\|rgb\|lighten\|darken\)\>(\@=" contained
syn match stylusFunction "\<\%(abs\|ceil\|floor\|round\|min\|max\|even\|odd\|sum\|avg\|sin\|cos\|join\)\>(\@=" contained
syn match stylusFunction "\<\%(desaturate\|saturate\|invert\|unquote\|quote\|s\)\>(\@=" contained
syn match stylusFunction "\<\%(operate\|length\|warn\|error\|last\|p\|\)\>(\@=" contained
syn match stylusFunction "\<\%(opposite-position\|image-size\|add-property\)\>(\@=" contained

syn keyword stylusVariable null true false arguments
syn keyword stylusControl  if else unless for in return

syn match stylusAmpersand  "&"
syn match stylusClass      "[[:alnum:]_-]\+" contained
syn match stylusClassChar  "\.[[:alnum:]_-]\@=" nextgroup=stylusClass
syn match stylusEscape     "^\s*\zs\\"
syn match stylusId         "[[:alnum:]_-]\+" contained
syn match stylusIdChar     "#[[:alnum:]_-]\@=" nextgroup=stylusId

" syn keyword stylusTodo       FIXME NOTE TODO OPTIMIZE XXX contained

syn match  stylusComment    "\/\/.*" contains=stylusTodo,@Spell fold
syn region  stylusCssComment start="/\*"  end="\*/" contains=stylusTodo,@Spell fold

hi def link stylusCssComment            Comment
hi def link stylusComment               Comment
" hi def link stylusTodo                  Todo
hi def link stylusVariable              Identifier
hi def link stylusControl               PreProc
" hi def link stylusUserFunction          PreProc
hi def link stylusFunction              Function
hi def link stylusInterpolation         Delimiter

hi def link stylusAmpersand             Character
hi def link stylusClass                 Type
hi def link stylusClassChar             Special
hi def link stylusEscape                Special
hi def link stylusId                    Identifier
hi def link stylusIdChar                Special

let b:current_syntax = "stylus"

" vim:set sw=2:
