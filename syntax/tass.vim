" Vim syntax file
" Language:	TASS (http://cho45.github.com/tasscss)
" Maintainer:	Kyo Nagashima <kyo@hail2u.net>
" Filenames:	*.tass
" Last Change:	2012-02-24

if exists("b:current_syntax")
  finish
endif

" setlocal iskeyword+=-

runtime! syntax/css.vim
runtime! syntax/css/*.vim

syn case ignore

syn cluster tassCssProperties contains=cssFontProp,cssFontDescriptorProp,cssColorProp,cssTextProp,cssBoxProp,cssGeneratedContentProp,cssPagingProp,cssUIProp,cssRenderProp,cssAuralProp,cssTableProp
syn cluster tassCssAttributes contains=css.*Attr,cssValue.*,cssColor,cssURL,cssImportant,cssError,cssStringQ,cssStringQQ,cssFunction,cssUnicodeEscape,cssRenderProp

syn region tassDefinition matchgroup=cssBraces start="{" end="}" contains=TOP

syn match tassProperty "\%([{};]\s*\|^\)\@<=\%([[:alnum:]-]\|#{[^{}]*}\)\+:" contains=css.*Prop skipwhite nextgroup=tassCssAttribute contained containedin=tassDefinition
syn match tassProperty "^\s*\zs\s\%(\%([[:alnum:]-]\|#{[^{}]*}\)\+:\|:[[:alnum:]-]\+\)"hs=s+1 contains=css.*Prop skipwhite nextgroup=tassCssAttribute
syn match tassCssAttribute +\%("\%([^"]\|\\"\)*"\|'\%([^']\|\\'\)*'\|#{[^{}]*}\|[^{};]\)*+ contained contains=@tassCssAttributes,tassVariable
syn match tassVariable "$[[:alnum:]_-]\+"
syn match tassVariableAssignment "\%([!$][[:alnum:]_-]\+\s*\)\@<=:" nextgroup=tassCssAttribute skipwhite

syn match tassMixinName "[[:alnum:]_-]\+" contained nextgroup=tassCssAttribute
syn match tassMixin "\%([{};]\s*\|^\s*\)\@<=@mixin" nextgroup=tassMixinName skipwhite
syn match tassMixing "\%([{};]\s*\|^\s*\)\@<=@include" nextgroup=tassMixinName skipwhite

syn match tassIdChar "#[[:alnum:]_-]\@=" nextgroup=tassId
syn match tassId "[[:alnum:]_-]\+" contained
syn match tassClassChar "\.[[:alnum:]_-]\@=" nextgroup=tassClass
syn match tassClass "[[:alnum:]_-]\+" contained
syn match tassAmpersand "&"

hi def link tassVariable  Identifier
hi def link tassMixing    PreProc
hi def link tassMixin     PreProc
hi def link tassIdChar    Special
hi def link tassId        Identifier
hi def link tassClassChar Special
hi def link tassClass     Type
hi def link tassAmpersand Character

let b:current_syntax = "tass"
