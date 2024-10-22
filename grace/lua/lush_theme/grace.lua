--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

-- This is a starter colorscheme for use with Lush,
-- for usage guides, see :h lush or :LushRunTutorial

--
-- Note: Because this is a lua file, vim will append it to the runtime,
--       which means you can require(...) it in other lua code (this is useful),
--       but you should also take care not to conflict with other libraries.
--
--       (This is a lua quirk, as it has somewhat poor support for namespacing.)
--
--       Basically, name your file,
--
--       "super_theme/lua/lush_theme/super_theme_dark.lua",
--
--       not,
--
--       "super_theme/lua/dark.lua".
--
--       With that caveat out of the way...
--

-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require("lush")
local hsl = lush.hsl

local palate = {
	bg = "#1E1F22",
	text = "#BCBEC4",
	bg_med = "#393B40",
	bg_low = "#43454A",
	text_low = "#6F737A",
	text_med = "#868991",
	red = "#450505",
	red_med = "#66313F",
	red_low = "#F75464",
	yellow = "#F49810",
	yellow_med = "#F2C55C",
	yellow_low = "#B3AE60",
	cyan = "#2AACB8",
	blue = "#467FF2",
	dark_blue = "#57AAF7",
	magneta = "#C77DBB",
	magneta_med = "#B189F5",
	green = "#2D543F",
	green_med = "#6AAB73",
	green_light = "#7EC482",
	brown = "#B06100",
	brown_med = "#CF8E6D",
	hi_bg = "#35538F",
	hi_fg = "#83ACFC",
}

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
	local sym = injected_functions.sym
	return {
		-- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight
		-- groups, mostly used for styling UI elements.
		-- Comment them out and add your own properties to override the defaults.
		-- An empty definition `{}` will clear all styling, leaving elements looking
		-- like the 'Normal' group.
		-- To be able to link to a group, it must already be defined, so you may have
		-- to reorder items as you go.
		--
		-- See :h highlight-groups
		--
		ColorColumn { bg = hsl(palate.text_med) }, -- Columns set with 'colorcolumn'
		-- Conceal        { }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
		Cursor         { bg = hsl(palate.bg_low)}, -- Character under the cursor
		CurSearch      { bg = hsl(palate.yellow_med), fg = hsl(palate.bg)}, -- Highlighting a search pattern under the cursor (see 'hlsearch')
		-- lCursor        { }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
		-- CursorIM       { }, -- Like Cursor, but used when in IME mode |CursorIM|
		-- CursorColumn   { }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
		-- CursorLine     { }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
		-- Directory      { }, -- Directory names (and other special names in listings)
		DiffAdd        { fg = hsl(palate.green_med) }, -- Diff mode: Added line |diff.txt|
		-- DiffChange     { }, -- Diff mode: Changed line |diff.txt|
		DiffDelete     { fg = hsl(palate.red) }, -- Diff mode: Deleted line |diff.txt|
		-- DiffText       { }, -- Diff mode: Changed text within a changed line |diff.txt|
		-- EndOfBuffer    { }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
		-- TermCursor     { }, -- Cursor in a focused terminal
		-- TermCursorNC   { }, -- Cursor in an unfocused terminal
		ErrorMsg { fg = hsl(palate.red_low) }, -- Error messages on the command line
		-- VertSplit      { }, -- Column separating vertically split windows
		-- Folded         { }, -- Line used for closed folds
		-- FoldColumn     { }, -- 'foldcolumn'
		-- SignColumn     { }, -- Column where |signs| are displayed
		-- IncSearch      { }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		Substitute     { bg = hsl(palate.yellow), fg = hsl(palate.bg)}, -- |:substitute| replacement text highlighting
		LineNr { fg = hsl(palate.text) }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		LineNrAbove { fg = hsl(palate.text_low) }, -- Line number for when the 'relativenumber' option is set, above the cursor line
		LineNrBelow { fg = hsl(palate.text_low) }, -- Line number for when the 'relativenumber' option is set, below the cursor line
		-- CursorLineNr   { }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		-- CursorLineFold { }, -- Like FoldColumn when 'cursorline' is set for the cursor line
		-- CursorLineSign { }, -- Like SignColumn when 'cursorline' is set for the cursor line
		MatchParen({ bg = hsl(palate.hi_bg), fg = hsl(palate.hi_fg) }), -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		-- ModeMsg        { }, -- 'showmode' message (e.g., "-- INSERT -- ")
		-- MsgArea        { }, -- Area for messages and cmdline
		-- MsgSeparator   { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
		-- MoreMsg        { }, -- |more-prompt|
		-- NonText        { }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		Normal({ bg = hsl(palate.bg), fg = hsl(palate.text) }), -- Normal text
		NormalFloat({ bg = hsl(palate.bg_med), fg = hsl(palate.text) }), -- Normal text in floating windows.
		-- FloatBorder    { }, -- Border of floating windows.
		-- FloatTitle     { }, -- Title of floating windows.
		-- NormalNC       { }, -- normal text in non-current windows
		-- Pmenu          { }, -- Popup menu: Normal item.
		-- PmenuSel       { }, -- Popup menu: Selected item.
		-- PmenuKind      { }, -- Popup menu: Normal item "kind"
		-- PmenuKindSel   { }, -- Popup menu: Selected item "kind"
		-- PmenuExtra     { }, -- Popup menu: Normal item "extra text"
		-- PmenuExtraSel  { }, -- Popup menu: Selected item "extra text"
		-- PmenuSbar      { }, -- Popup menu: Scrollbar.
		-- PmenuThumb     { }, -- Popup menu: Thumb of the scrollbar.
		-- Question       { }, -- |hit-enter| prompt and yes/no questions
		-- QuickFixLine   { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		Search { bg = hsl(palate.yellow), fg = hsl(palate.bg) }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
		-- SpecialKey     { }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
		-- SpellBad       { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		-- SpellCap       { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		-- SpellLocal     { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		-- SpellRare      { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
		StatusLine { bg = hsl(palate.bg_med) }, -- Status line of current window
		-- StatusLineNC   { }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		-- TabLine        { }, -- Tab pages line, not active tab page label
		-- TabLineFill    { }, -- Tab pages line, where there are no labels
		-- TabLineSel     { }, -- Tab pages line, active tab page label
		-- Title          { }, -- Titles for output from ":set all", ":autocmd" etc.
		-- Visual         { }, -- Visual mode selection
		-- VisualNOS      { }, -- Visual mode selection when vim is "Not Owning the Selection".
		WarningMsg { fg = hsl(palate.yellow_med) }, -- Warning messages
		-- Whitespace     { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
		-- Winseparator   { }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
		-- WildMenu       { }, -- Current match in 'wildmenu' completion
		-- WinBar         { }, -- Window bar of current window
		-- WinBarNC       { }, -- Window bar of not-current windows

		-- Common vim syntax groups used for all kinds of code and markup.
		-- Commented-out groups should chain up to their preferred (*) group
		-- by default.
		--
		-- See :h group-name
		--
		-- Uncomment and edit if you want more specific syntax highlighting.

		Comment { fg = hsl(palate.text_low) }, -- Any comment

		Constant       { fg = hsl(palate.magneta), gui = "bold"}, -- (*) Any constant
		String { fg = hsl(palate.green_light) }, --   A string constant: "this is a string"
		Character { fg = hsl(palate.brown_med) }, --   A character constant: 'c', '\n'
		Number { fg = hsl(palate.dark_blue) }, --   A number constant: 234, 0xff
		Boolean { fg = hsl(palate.yellow) }, --   A boolean constant: TRUE, false
		Float { fg = hsl(palate.dark_blue) }, --   A floating point constant: 2.3e10

		Identifier { Normal }, -- (*) Any variable name
		Function       { fg = hsl(palate.dark_blue)}, --   Function name (also: methods for classes)

		Statement      { fg = hsl(palate.cyan) }, -- (*) Any statement
		Conditional    { fg = hsl(palate.brown_med), gui = "italic" }, --   if, then, else, endif, switch, etc.
		Repeat         { fg = hsl(palate.brown_med), gui = "italic" }, --   for, do, while, etc.
		Label          { fg = hsl(palate.magneta)}, --   case, default, etc.
		Operator       { Normal }, --   "sizeof", "+", "*", etc.
		Keyword        { fg = hsl(palate.magneta_med), gui = "italic"}, --   any other keyword
		Exception      { Conditional }, --   try, catch, throw

		PreProc        { Label }, -- (*) Generic Preprocessor
		Include        { fg = hsl(palate.yellow_med) }, --   Preprocessor #include
		Define         { Include }, --   Preprocessor #define
		Macro          { fg = hsl(palate.brown_med) }, --   Same as Define
		PreCondit      { }, --   Preprocessor #if, #else, #endif, etc.

		Type           { fg = hsl(palate.yellow) }, -- (*) int, long, char, etc.
		StorageClass   { fg= hsl(palate.dark_blue) }, --   static, register, volatile, etc.
		Structure      { fg = hsl(palate.magneta_med) }, --   struct, union, enum, etc.
		Typedef        { fg = hsl(palate.magneta) }, --   A typedef

		Special        { fg = hsl(palate.brown) }, -- (*) Any special symbol
		SpecialChar    { Special }, --   Special character in a constant
		Tag            { fg = hsl(palate.yellow_med) }, --   You can use CTRL-] on this
		Delimiter      { fg = hsl(palate.yellow) }, --   Character that needs attention
		SpecialComment { fg = hsl(palate.text_low) }, --   Special things inside a comment (e.g. '\n')
		-- Debug          { }, --   Debugging statements

		Underlined({ gui = "underline" }), -- Text that stands out, HTML links
		Ignore {}, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
		Error { fg = hsl(palate.red_low) }, -- Any erroneous construct
		-- Todo           { }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

		-- These groups are for the native LSP client and diagnostic system. Some
		-- other LSP clients may use these groups, or use their own. Consult your
		-- LSP client's documentation.

		-- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
		--
		-- LspReferenceText            { } , -- Used for highlighting "text" references
		-- LspReferenceRead            { } , -- Used for highlighting "read" references
		-- LspReferenceWrite           { } , -- Used for highlighting "write" references
		-- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
		-- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
		-- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

		-- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
		--
		DiagnosticError            { fg = hsl(palate.red_low) } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticWarn             { fg = hsl(palate.yellow_low) } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticInfo             { fg = hsl(palate.dark_blue) } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticHint             { fg = hsl(palate.green_med) } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticOk               { DiagnosticHint} , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticVirtualTextError { fg = hsl(palate.red_low) } , -- Used for "Error" diagnostic virtual text.
		DiagnosticVirtualTextWarn  { fg = hsl(palate.yellow_low) } , -- Used for "Warn" diagnostic virtual text.
		DiagnosticVirtualTextInfo  { fg = hsl(palate.dark_blue) } , -- Used for "Info" diagnostic virtual text.
		DiagnosticVirtualTextHint  { fg = hsl(palate.green_med) } , -- Used for "Hint" diagnostic virtual text.
		DiagnosticVirtualTextOk    { DiagnosticVirtualTextHint } , -- Used for "Ok" diagnostic virtual text.
		DiagnosticUnderlineError   { gui = "undercurl", sp = hsl(palate.red), } , -- Used to underline "Error" diagnostics.
		DiagnosticUnderlineWarn    { gui = "undercurl", sp = hsl(palate.yellow) } , -- Used to underline "Warn" diagnostics.
		DiagnosticUnderlineInfo    { gui = "undercurl", sp = hsl(palate.blue) } , -- Used to underline "Info" diagnostics.
		DiagnosticUnderlineHint    { gui = "undercurl", sp = hsl(palate.green_med) } , -- Used to underline "Hint" diagnostics.
		DiagnosticUnderlineOk      { DiagnosticUnderlineHint } , -- Used to underline "Ok" diagnostics.
		DiagnosticFloatingError    { bg = hsl(palate.bg_low), fg = hsl(palate.red_low) } , -- -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
		DiagnosticFloatingWarn     { bg = hsl(palate.bg_low), fg = hsl(palate.yellow_low) } , -- Used to color "Warn" diagnostic messages in diagnostics float.
		DiagnosticFloatingInfo     { bg = hsl(palate.bg_low), fg = hsl(palate.dark_blue) } ,  -- Used to color "Info" diagnostic messages in diagnostics float.
		DiagnosticFloatingHint     { bg = hsl(palate.bg_low), fg = hsl(palate.green_med) } ,  -- Used to color "Hint" diagnostic messages in diagnostics float.
		DiagnosticFloatingOk       { DiagnosticFloatingHint } -- Used to color "Ok" diagnostic messages in diagnostics float.
		-- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
		-- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
		-- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
		-- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.
		-- DiagnosticSignOk           { } , -- Used for "Ok" signs in sign column.

		-- Tree-Sitter syntax groups.
		--
		-- See :h treesitter-highlight-groups, some groups may not be listed,
		-- submit a PR fix to lush-template!
		--
		-- Tree-Sitter groups are defined with an "@" symbol, which must be
		-- specially handled to be valid lua code, we do this via the special
		-- sym function. The following are all valid ways to call the sym function,
		-- for more details see https://www.lua.org/pil/5.html
		--
		-- sym("@text.literal")
		-- sym('@text.literal')
		-- sym"@text.literal"
		-- sym'@text.literal'
		--
		-- For more information see https://github.com/rktjmp/lush.nvim/issues/109

		-- sym"@text.literal"      { }, -- Comment
		-- sym"@text.reference"    { }, -- Identifier
		-- sym"@text.title"        { }, -- Title
		-- sym"@text.uri"          { }, -- Underlined
		-- sym"@text.underline"    { }, -- Underlined
		-- sym"@text.todo"         { }, -- Todo
		-- sym"@comment"           { }, -- Comment
		-- sym"@punctuation"       { }, -- Delimiter
		-- sym"@constant"          { }, -- Constant
		-- sym"@constant.builtin"  { }, -- Special
		-- sym"@constant.macro"    { }, -- Define
		-- sym"@define"            { }, -- Define
		-- sym"@macro"             { }, -- Macro
		-- sym"@string"            { }, -- String
		-- sym"@string.escape"     { }, -- SpecialChar
		-- sym"@string.special"    { }, -- SpecialChar
		-- sym"@character"         { }, -- Character
		-- sym"@character.special" { }, -- SpecialChar
		-- sym"@number"            { }, -- Number
		-- sym"@boolean"           { }, -- Boolean
		-- sym"@float"             { }, -- Float
		-- sym"@function"          { }, -- Function
		-- sym"@function.builtin"  { }, -- Special
		-- sym"@function.macro"    { }, -- Macro
		-- sym"@parameter"         { }, -- Identifier
		-- sym"@method"            { }, -- Function
		-- sym"@field"             { }, -- Identifier
		-- sym"@property"          { }, -- Identifier
		-- sym"@constructor"       { }, -- Special
		-- sym"@conditional"       { }, -- Conditional
		-- sym"@repeat"            { }, -- Repeat
		-- sym"@label"             { }, -- Label
		-- sym"@operator"          { }, -- Operator
		-- sym"@keyword"           { }, -- Keyword
		-- sym"@exception"         { }, -- Exception
		-- sym"@variable"          { }, -- Identifier
		-- sym"@type"              { }, -- Type
		-- sym"@type.definition"   { }, -- Typedef
		-- sym"@storageclass"      { }, -- StorageClass
		-- sym"@structure"         { }, -- Structure
		-- sym"@namespace"         { }, -- Identifier
		-- sym"@include"           { }, -- Include
		-- sym"@preproc"           { }, -- PreProc
		-- sym"@debug"             { }, -- Debug
		-- sym"@tag"               { }, -- Tag
	}
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
