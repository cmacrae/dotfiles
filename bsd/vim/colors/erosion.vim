set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "erosion"

" Vim >= 7.0 specific colors
if version >= 700
  hi CursorLine guibg=#2e2926 
  hi CursorColumn guibg=#2e2926 
  hi MatchParen guifg=#f6f3e8 guibg=#bea492 gui=bold 
  hi Pmenu 		guifg=#f6f3e8 guibg=#332d29 
  hi PmenuSel 	guifg=#080807 guibg=#b8d154 
endif


" General colors
hi Cursor 		guifg=NONE    guibg=#676b57 gui=none 
hi Normal 		guifg=#f6f3f0 guibg=#181512 gui=none ctermbg=8 
hi NonText 		guifg=#7e8066 guibg=#302c2a gui=none 
hi LineNr 		guifg=#676b57 guibg=#181512 gui=none 
hi StatusLine 	guifg=#f6f3e8 guibg=#332d29 gui=italic
hi StatusLineNC guifg=#bea492 guibg=#332d29 gui=none
hi VertSplit 	guifg=#332d29 guibg=#332d29 gui=none 
hi Folded 		guibg=#464838 guifg=#a7b08f gui=none
hi Title		guifg=#d3e7a4 guibg=NONE	gui=bold 
hi Visual		guifg=#f0fff1 guibg=#332d29 gui=none 
hi SpecialKey	guifg=#7e8066 guibg=#33342e gui=none
hi Directory                 guifg=#A0CF5D 

" Syntax highlighting
hi Comment 		guifg=#7e8066 gui=italic 
hi Todo 		guifg=#8f8f8f gui=italic 
hi Constant 	guifg=#d7ceca gui=none 
hi String 		guifg=#857b52 gui=italic 
hi Identifier 	guifg=#8c644c gui=none 
hi Function 	guifg=#857b52 gui=none 
hi Type 		guifg=#908a66 gui=none 
hi Statement 	guifg=#9a875f gui=none 
hi Keyword		guifg=#c5da78 gui=none 
hi PreProc 		guifg=#a3ba59 gui=none 
hi Number		guifg=#a3ba59 gui=none 
hi Special		guifg=#809163 gui=none 

" Spell Checking

call s:X("SpellBad","","902020","underline","","DarkRed")
call s:X("SpellCap","","0000df","underline","","Blue")
call s:X("SpellRare","","540063","underline","","DarkMagenta")
call s:X("SpellLocal","","2D7067","underline","","Green")

" Diff

hi! link diffRemoved Constant
hi! link diffAdded String

" VimDiff

call s:X("DiffAdd","D2EBBE","437019","","White","DarkGreen")
call s:X("DiffDelete","40000A","700009","","DarkRed","DarkRed")
call s:X("DiffChange","","2B5B77","","White","DarkBlue")
call s:X("DiffText","8fbfdc","000000","reverse","Yellow","")

" PHP

hi! link phpFunctions Function
call s:X("StorageClass","c59f6f","","","Red","")
hi! link phpSuperglobal Identifier
hi! link phpQuoteSingle StringDelimiter
hi! link phpQuoteDouble StringDelimiter
hi! link phpBoolean Constant
hi! link phpNull Constant
hi! link phpArrayPair Operator
hi! link phpOperator Normal
hi! link phpRelation Normal
hi! link phpVarSelector Identifier

" Python

hi! link pythonOperator Statement

" Ruby

hi! link rubySharpBang Comment
call s:X("rubyClass","447799","","","DarkBlue","")
call s:X("rubyIdentifier","c6b6fe","","","Cyan","")
hi! link rubyConstant Type
hi! link rubyFunction Function

call s:X("rubyInstanceVariable","c6b6fe","","","Cyan","")
call s:X("rubySymbol","7697d6","","","Blue","")
hi! link rubyGlobalVariable rubyInstanceVariable
hi! link rubyModule rubyClass
call s:X("rubyControl","7597c6","","","Blue","")

hi! link rubyString String
hi! link rubyStringDelimiter StringDelimiter
hi! link rubyInterpolationDelimiter Identifier

call s:X("rubyRegexpDelimiter","540063","","","Magenta","")
call s:X("rubyRegexp","dd0093","","","DarkMagenta","")
call s:X("rubyRegexpSpecial","a40073","","","Magenta","")

call s:X("rubyPredefinedIdentifier","de5577","","","Red","")

" Erlang

hi! link erlangAtom rubySymbol
hi! link erlangBIF rubyPredefinedIdentifier
hi! link erlangFunction rubyPredefinedIdentifier
hi! link erlangDirective Statement
hi! link erlangNode Identifier

" JavaScript

hi! link javaScriptValue Constant
hi! link javaScriptRegexpString rubyRegexp

" CoffeeScript

hi! link coffeeRegExp javaScriptRegexpString

" Lua

hi! link luaOperator Conditional

" C

hi! link cFormat Identifier
hi! link cOperator Constant

" Objective-C/Cocoa

hi! link objcClass Type
hi! link cocoaClass objcClass
hi! link objcSubclass objcClass
hi! link objcSuperclass objcClass
hi! link objcDirective rubyClass
hi! link objcStatement Constant
hi! link cocoaFunction Function
hi! link objcMethodName Identifier
hi! link objcMethodArg Normal
hi! link objcMessageName Identifier

" Vimscript

hi! link vimOper Normal

" Debugger.vim

call s:X("DbgCurrent","DEEBFE","345FA8","","White","DarkBlue")
call s:X("DbgBreakPt","","4F0037","","","DarkMagenta")

" vim-indent-guides

if !exists("g:indent_guides_auto_colors")
  let g:indent_guides_auto_colors = 0
endif
call s:X("IndentGuidesOdd","","232323","","","")
call s:X("IndentGuidesEven","","1b1b1b","","","")


