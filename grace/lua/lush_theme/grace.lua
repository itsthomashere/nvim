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
	bg = hsl("#000000"),
	fg = hsl("#dadada"),
	red = hsl("#dc143c"),
	yellow = hsl("#ffd700"),
	blue = hsl("#0072bb"),
	inlined_bg = hsl("#808080"),
	float_bg = hsl("#242124"),
	inlined = hsl("#f5f5f5"),
	green = hsl("#32cd32"),
	searched = hsl("#d99058"),
	cursor = hsl("#c71585"),
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
		ColorColumn({ bg = palate.inlined_bg }), -- Columns set with 'colorcolumn'
		-- Conceal        { }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
		Cursor({ bg = palate.cursor }), -- Character under the cursor
		CurSearch({ bg = palate.searched, fg = palate.fg }), -- Highlighting a search pattern under the cursor (see 'hlsearch')
		-- lCursor        { }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
		-- CursorIM       { }, -- Like Cursor, but used when in IME mode |CursorIM|
		-- CursorColumn   { }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
		-- CursorLine     { }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
		-- Directory      { }, -- Directory names (and other special names in listings)
		DiffAdd({ fg = palate.green }), -- Diff mode: Added line |diff.txt|
		-- DiffChange     { }, -- Diff mode: Changed line |diff.txt|
		DiffDelete({ fg = palate.red }), -- Diff mode: Deleted line |diff.txt|
		-- DiffText       { }, -- Diff mode: Changed text within a changed line |diff.txt|
		-- EndOfBuffer    { }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
		-- TermCursor     { }, -- Cursor in a focused terminal
		-- TermCursorNC   { }, -- Cursor in an unfocused terminal
		ErrorMsg({ fg = palate.red }), -- Error messages on the command line
		-- VertSplit      { }, -- Column separating vertically split windows
		-- Folded         { }, -- Line used for closed folds
		-- FoldColumn     { }, -- 'foldcolumn'
		-- SignColumn     { }, -- Column where |signs| are displayed
		-- IncSearch      { }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		Substitute({ bg = palate.searched, fg = palate.bg }), -- |:substitute| replacement text highlighting
		LineNr({ fg = palate.fg }), -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		LineNrAbove({ fg = palate.inlined_bg }), -- Line number for when the 'relativenumber' option is set, above the cursor line
		LineNrBelow({ fg = palate.inlined_bg }), -- Line number for when the 'relativenumber' option is set, below the cursor line
		-- CursorLineNr   { }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		-- CursorLineFold { }, -- Like FoldColumn when 'cursorline' is set for the cursor line
		-- CursorLineSign { }, -- Like SignColumn when 'cursorline' is set for the cursor line
		MatchParen({ fg = palate.cursor }), -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		-- ModeMsg        { }, -- 'showmode' message (e.g., "-- INSERT -- ")
		-- MsgArea        { }, -- Area for messages and cmdline
		-- MsgSeparator   { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
		-- MoreMsg        { }, -- |more-prompt|
		-- NonText({ fg = palate.inlined }), -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		Normal({ bg = palate.bg, fg = palate.fg }), -- Normal text
		NormalFloat({ bg = palate.float_bg, fg = palate.inlined }), -- Normal text in floating windows.
		FloatBorder({ fg = palate.fg }), -- Border of floating windows.
		-- FloatTitle     { }, -- Title of floating windows.
		-- NormalNC       { }, -- normal text in non-current windows
		Pmenu({ fg = palate.inlined, bg = palate.float_bg }), -- Popup menu: Normal item.
		PmenuSel({ fg = palate.bg, bg = palate.fg }), -- Popup menu: Selected item.
		PmenuKind({ Pmenu }), -- Popup menu: Normal item "kind"
		PmenuKindSel({ PmenuSel }), -- Popup menu: Selected item "kind"
		-- PmenuExtra     { }, -- Popup menu: Normal item "extra text"
		-- PmenuExtraSel  { }, -- Popup menu: Selected item "extra text"
		PmenuSbar({ fg = palate.bg, bg = palate.inlined_bg }), -- Popup menu: Scrollbar.
		PmenuThumb({ fg = palate.inlined }), -- Popup menu: Thumb of the scrollbar.
		-- Question       { }, -- |hit-enter| prompt and yes/no questions
		-- QuickFixLine   { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		Search({ bg = palate.searched, fg = palate.bg }), -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
		-- SpecialKey     { }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
		-- SpellBad       { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		-- SpellCap       { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		-- SpellLocal     { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		-- SpellRare      { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
		StatusLine({ bg = palate.fg, fg = palate.bg }), -- Status line of current window
		-- StatusLineNC   { }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		-- TabLine        { }, -- Tab pages line, not active tab page label
		-- TabLineFill    { }, -- Tab pages line, where there are no labels
		-- TabLineSel     { }, -- Tab pages line, active tab page label
		-- Title          { }, -- Titles for output from ":set all", ":autocmd" etc.
		-- Visual         { }, -- Visual mode selection
		-- VisualNOS      { }, -- Visual mode selection when vim is "Not Owning the Selection".
		WarningMsg({ fg = palate.yellow }), -- Warning messages
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

		Comment({ fg = palate.inlined_bg }), -- Any comment

		Constant({ fg = palate.fg, gui = "bold" }), -- (*) Any constant
		String({ fg = palate.green }), --   A string constant: "this is a string"
		Character({ fg = palate.blue }), --   A character constant: 'c', '\n'
		Number({ fg = palate.blue }), --   A number constant: 234, 0xff
		Boolean({ fg = palate.fg }), --   A boolean constant: TRUE, false
		Float({ fg = palate.fg }), --   A floating point constant: 2.3e10

		Identifier({ Normal }), -- (*) Any variable name
		Function({ fg = palate.fg }), --   Function name (also: methods for classes)

		Statement({ fg = palate.fg }), -- (*) Any statement
		Conditional({ fg = palate.fg, gui = "italic" }), --   if, then, else, endif, switch, etc.
		Repeat({ fg = palate.fg, gui = "italic" }), --   for, do, while, etc.
		Label({ fg = palate.fg }), --   case, default, etc.
		Operator({ Normal }), --   "sizeof", "+", "*", etc.
		Keyword({ fg = palate.fg, gui = "italic" }), --   any other keyword
		Exception({ Conditional }), --   try, catch, throw

		PreProc({ Label }), -- (*) Generic Preprocessor
		Include({ fg = palate.fg }), --   Preprocessor #include
		Define({ Include }), --   Preprocessor #define
		Macro({ fg = palate.fg }), --   Same as Define
		PreCondit({ fg = palate.fg }), --   Preprocessor #if, #else, #endif, etc.

		Type({ fg = palate.fg }), -- (*) int, long, char, etc.
		StorageClass({ fg = palate.fg }), --   static, register, volatile, etc.
		Structure({ fg = palate.fg }), --   struct, union, enum, etc.
		Typedef({ fg = palate.fg }), --   A typedef

		Special({ fg = palate.fg }), -- (*) Any special symbol
		SpecialChar({ fg = palate.searched }), --   Special character in a constant
		Tag({ fg = palate.fg }), --   You can use CTRL-] on this
		Delimiter({ fg = palate.fg }), --   Character that needs attention
		SpecialComment({ fg = palate.green }), --   Special things inside a comment (e.g. '\n')
		Debug({ Normal }), --   Debugging statements

		Underlined({ gui = "underline" }), -- Text that stands out, HTML links
		Ignore({}), -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
		Error({ fg = palate.red }), -- Any erroneous construct
		Todo({ bg = palate.yellow, fg = palate.bg }), -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

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
		LspSignatureActiveParameter({ fg = palate.inlined, bg = palate.inlined_bg }), -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

		-- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
		--
		DiagnosticError({ fg = palate.red }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticWarn({ fg = palate.yellow }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticInfo({ fg = palate.blue }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticHint({ fg = palate.green }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticOk({ DiagnosticHint }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticVirtualTextError({ fg = palate.red }), -- Used for "Error" diagnostic virtual text.
		DiagnosticVirtualTextWarn({ fg = palate.yellow }), -- Used for "Warn" diagnostic virtual text.
		DiagnosticVirtualTextInfo({ fg = palate.blue }), -- Used for "Info" diagnostic virtual text.
		DiagnosticVirtualTextHint({ fg = palate.green }), -- Used for "Hint" diagnostic virtual text.
		DiagnosticVirtualTextOk({ DiagnosticVirtualTextHint }), -- Used for "Ok" diagnostic virtual text.
		DiagnosticUnderlineError({ gui = "undercurl", sp = palate.red }), -- Used to underline "Error" diagnostics.
		DiagnosticUnderlineWarn({ gui = "undercurl", sp = palate.yellow }), -- Used to underline "Warn" diagnostics.
		DiagnosticUnderlineInfo({ gui = "undercurl", sp = palate.blue }), -- Used to underline "Info" diagnostics.
		DiagnosticUnderlineHint({ gui = "undercurl", sp = palate.green_med }), -- Used to underline "Hint" diagnostics.
		DiagnosticUnderlineOk({ DiagnosticUnderlineHint }), -- Used to underline "Ok" diagnostics.
		DiagnosticFloatingError({ bg = palate.float_bg, fg = palate.red }), -- -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
		DiagnosticFloatingWarn({ bg = palate.float_bg, fg = palate.yellow }), -- Used to color "Warn" diagnostic messages in diagnostics float.
		DiagnosticFloatingInfo({ bg = palate.float_bg, fg = palate.blue }), -- Used to color "Info" diagnostic messages in diagnostics float.
		DiagnosticFloatingHint({ bg = palate.float_bg, fg = palate.green }), -- Used to color "Hint" diagnostic messages in diagnostics float.
		DiagnosticFloatingOk({ DiagnosticFloatingHint }), -- Used to color "Ok" diagnostic messages in diagnostics float.
		DiagnosticSignError({ fg = palate.red }), -- Used for "Error" signs in sign column.
		DiagnosticSignWarn({ fg = palate.yellow }), -- Used for "Warn" signs in sign column.
		DiagnosticSignInfo({ fg = palate.blue }), -- Used for "Info" signs in sign column.
		DiagnosticSignHint({ fg = palate.green }), -- Used for "Hint" signs in sign column.
		DiagnosticSignOk({ DiagnosticSignHint }), -- Used for "Ok" signs in sign column.

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
		sym("@diff.plus")({ bg = palate.bg, fg = palate.green }),
		sym("@diff.minus")({ bg = palate.bg, fg = palate.red }),
		sym("@diff.delta")({ bg = palate.bg, fg = palate.blue }),
		sym("@spell")({ fg = palate.inlined_bg }),
		sym("@text.literal")({ fg = palate.searched }), -- Comment
		sym("@text.reference")({ fg = palate.fg }), -- Identifier
		sym("@text.title")({ fg = palate.fg }), -- Title
		sym("@text.uri")({ fg = palate.fg }), -- Underlined
		sym("@text.underline")({ fg = palate.fg }), -- Underlined
		sym("@text.todo")({ bg = palate.blue, fg = palate.inlined_bg }), -- Todo
		sym("@comment")({ fg = palate.inlined_bg }), -- Comment
		sym("@punctuation")({ fg = palate.fg }), -- Delimiter
		sym("@constant")({ fg = palate.fg }), -- Constant
		sym("@constant.builtin")({ fg = palate.fg }), -- Special
		sym("@constant.macro")({ fg = palate.fg }), -- Define
		sym("@define")({}), -- Define
		sym("@macro")({ fg = palate.red }), -- Macro
		sym("@string")({ fg = palate.green }), -- String
		sym("@string.escape")({ fg = palate.searched }), -- SpecialChar
		sym("@string.special")({ fg = palate.searched }), -- SpecialChar
		sym("@character")({ fg = palate.fg }), -- Character
		sym("@character.special")({ fg = palate.searched }), -- SpecialChar
		sym("@number")({ fg = palate.blue }), -- Number
		sym("@boolean")({ fg = palate.fg }), -- Boolean
		sym("@float")({ fg = palate.blue }), -- Float
		sym("@function")({ fg = palate.fg }), -- Function
		sym("@function.builtin")({ fg = palate.fg }), -- Special
		sym("@function.macro")({ fg = palate.fg }), -- Macro
		sym("@parameter")({ fg = palate.fg }), -- Identifier
		sym("@method")({ fg = palate.fg }), -- Function
		sym("@field")({ fg = palate.fg }), -- Identifier
		sym("@property")({ fg = palate.fg }), -- Identifier
		sym("@constructor")({ fg = palate.fg }), -- Special
		sym("@conditional")({ fg = palate.fg }), -- Conditional
		sym("@repeat")({ fg = palate.fg }), -- Repeat
		sym("@label")({ fg = palate.fg }), -- Label
		sym("@operator")({ fg = palate.fg }), -- Operator
		sym("@keyword")({ fg = palate.fg }), -- Keyword
		sym("@exception")({ fg = palate.fg }), -- Exception
		sym("@variable")({ fg = palate.fg }), -- Identifier
		sym("@type")({ fg = palate.fg }), -- Type
		sym("@type.definition")({ fg = palate.fg }), -- Typedef
		sym("@storageclass")({ fg = palate.fg }), -- StorageClass
		sym("@structure")({ fg = palate.fg }), -- Structure
		sym("@namespace")({ fg = palate.fg }), -- Identifier
		sym("@include")({ fg = palate.fg }), -- Include
		sym("@preproc")({ fg = palate.fg }), -- PreProc
		sym("@debug")({ fg = palate.fg }), -- Debug
		sym("@tag")({ fg = palate.fg }), -- Tag

		-- Gitsigns highlight groups
		GitSignsAdd({ fg = palate.green }),
		GitSignsChange({ fg = palate.blue }),
		GitSignsDelete({ fg = palate.red }),
	}
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
