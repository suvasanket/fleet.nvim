local M = {}

function M.setup()
	local config = require("fleet-theme").config
	local palette = require("fleet-theme.palette").palette

	local groups = {
		Normal = { bg = palette.background, fg = palette.light }, -- normal text
		Comment = { fg = palette.mid_gray, italic = true }, -- any comment
		-- ColorColumn  = { }, -- used for the columns set with 'colorcolumn'
		Conceal = { fg = palette.purple, bold = true }, -- placeholder characters substituted for concealed text (see 'conceallevel')
		Cursor = { bg = palette.light, fg = palette.dark_gray }, -- character under the cursor
		-- lCursor      = { }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
		-- CursorIM     = { }, -- like Cursor, but used when in IME mode |CursorIM|
		-- CursorColumn = { }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
		CursorLine = { bg = palette.focus }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
		Directory = { fg = palette.cyan }, -- directory names (and other special names in listings)
		DiffAdd = { fg = palette.diff_plus }, -- diff mode: Added line |diff.txt|
		DiffChange = { fg = palette.blue_accent }, -- diff mode: Changed line |diff.txt|
		DiffDelete = { fg = palette.red_accent }, -- diff mode: Deleted line |diff.txt|
		-- DiffText     = { }, -- diff mode: Changed text within a changed line |diff.txt|
		diffAdded = { link = "DiffAdd" },
		diffRemoved = { link = "DiffDelete" },
		diffChanged = { link = "DiffChange" },
		EndOfBuffer = { fg = palette.background, bold = true }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
		-- TermCursor   = { }, -- cursor in a focused terminal
		-- TermCursorNC = { }, -- cursor in an unfocused terminal
		ErrorMsg = { fg = palette.red_error, bold = true }, -- error messages on the command line
		VertSplit = { bg = palette.background, fg = palette.darker }, -- the column separating vertically split windows
		WinSeparator = { link = "FloatBorder" }, -- highlights window separators
		Folded = { bg = palette.none, fg = palette.light_gray }, -- line used for closed folds
		-- FoldColumn   = { }, -- 'foldcolumn'
		SignColumn = { bg = palette.background, fg = palette.dark_gray }, -- column where |signs| are displayed
		-- IncSearch    = { }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		-- Substitute   = { }, -- |:substitute| replacement text highlighting
		LineNr = { fg = palette.dark_gray }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		CursorLineNr = { bg = palette.darker, fg = palette.light, bold = true }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		MatchParen = { bg = palette.darker, bold = true }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		ModeMsg = { fg = palette.lightest, bold = true }, -- 'showmode' message (e.g., "-- INSERT -- ")
		MsgArea = { fg = palette.light }, -- Area for messages and cmdline
		-- MsgSeparator = { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
		-- MoreMsg      = { }, -- |more-prompt|
		NonText = { link = "Comment" }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		NormalFloat = { bg = palette.background, fg = palette.light }, -- Normal text in floating windows.
		FloatBorder = { bg = palette.background, fg = palette.light }, -- Normal text in floating windows.
		-- NormalNC     = { }, -- normal text in non-current windows
		Pmenu = { bg = palette.focus, fg = palette.light }, -- Popup menu: normal item.
		PmenuSel = { bg = palette.selection, fg = palette.lighter, bold = true }, -- Popup menu: selected item.
		PmenuSbar = { bg = palette.darker, fg = palette.light, bold = true }, -- Popup menu: scrollbar.
		PmenuThumb = { bg = palette.mid_gray, fg = palette.light, bold = true }, -- Popup menu: Thumb of the scrollbar.
		-- Question     = { }, -- |hit-enter| prompt and yes/no questions
		Search = { fg = palette.light, bg = palette.selection, bold = true }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
		QuickFixLine = { bg = palette.focus, bold = true }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		-- QuickFixLine = { bg = Normal.bg.mix(Search.bg, 40)  }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		SpecialKey = { link = "Directory" }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
		-- SpellBad     = { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		-- SpellCap     = { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		-- SpellLocal   = { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		-- SpellRare    = { }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
		StatusLine = { bg = palette.focus, fg = "#898989" }, -- status line of current window
		StatusLineNC = { bg = palette.focus, fg = "#898989" }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.

		TabLine = { bg = palette.focus, fg = palette.light }, -- tab pages line, not active tab page label
		TabLineFill = { link = "TabLine" }, -- tab pages line, where there are no labels
		TabLineSel = { bg = "NONE", fg = palette.light, bold = true }, -- tab pages line, active tab page label

		Title = { fg = palette.purple_accent, bold = true }, -- titles for output from ":set all", ":autocmd" etc.
		Visual = { bg = palette.selection }, -- Visual mode selection
		-- VisualNOS    = { }, -- Visual mode selection when vim is "Not Owning the Selection".
		WarningMsg = { fg = palette.yellow_accent }, -- warning messages
		Whitespace = { link = "Comment" }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
		WildMenu = { bg = palette.darker }, -- current match in 'wildmenu' completion

		-- These groups are not listed as default vim groups,
		-- but they are defacto standard group names for syntax highlighting.
		-- commented out groups should chain up to their "preferred" group by
		-- default,
		-- Uncomment and edit if you want more specific syntax highlighting.

		Constant = { fg = palette.red }, -- (preferred) any constant
		String = { fg = "#83AE5B" }, --   a string constant: "this is a string"
		Character = { fg = palette.yellow }, --  a character constant: 'c', '\n'
		Number = { fg = palette.yellow }, --   a number constant: 234, 0xff
		Boolean = { fg = palette.yellow }, --  a boolean constant: TRUE, false
		Float = { fg = palette.yellow }, --    a floating point constant: 2.3e10

		Identifier = { fg = palette.light }, -- (preferred) any variable name
		Function = { fg = palette.lightest, bold = true }, -- function name (also: methods for classes)

		Keyword = { fg = palette.cyan }, --  any other keyword
		Statement = { link = "Keyword" }, -- (preferred) any statement
		Conditional = { link = "Keyword" }, --  if, then, else, endif, switch, etc.
		Repeat = { link = "Keyword" }, --   for, do, while, etc.
		Label = { link = "Keyword" }, --    case, default, etc.
		Operator = { fg = palette.light }, -- "sizeof", "+", "*", etc.
		Exception = { link = "Keyword" }, --  try, catch, throw

		PreProc = { link = "Keyword" }, -- (preferred) generic Preprocessor
		Include = { link = "Keyword" }, --  preprocessor #include
		Define = { link = "Keyword" }, --   preprocessor #define
		Macro = { fg = palette.purple, bold = true }, --    same as Define
		PreCondit = { link = "Keyword" }, --  preprocessor #if, #else, #endif, etc.

		Type = { fg = palette.light_blue }, -- (preferred) int, long, char, etc.
		-- StorageClass   = { fg = "#A1B56C" }, -- static, register, volatile, etc.
		Structure = { link = "Type" }, --  struct, union, enum, etc.
		Typedef = { link = "Type" }, --  A typedef

		Special = { fg = palette.light }, -- (preferred) any special symbol
		SpecialChar = { fg = palette.yellow }, --  special character in a constant
		Tag = { fg = palette.blue }, --    you can use CTRL-] on this
		Delimiter = { fg = palette.light }, --  character that needs attention
		-- SpecialComment = { }, -- special things inside a comment
		-- Debug          = { }, --    debugging statements

		Underlined = { fg = palette.yellow, underline = true }, -- (preferred) text that stands out, HTML links
		Bold = { bold = true },
		Italic = { italic = true },

		-- ("Ignore", below, may be invisible...)
		-- Ignore         = { }, -- (preferred) left blank, hidden  |hl-Ignore|

		Error = { bg = palette.red_error, fg = palette.darker }, -- (preferred) any erroneous construct

		Todo = { bg = palette.focus, fg = palette.light, bold = true }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

		DiagnosticError = { bg = palette.error_bg, fg = palette.red_error }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticWarn = { bg = palette.warning_bg, fg = palette.orange_accent }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticInfo = { bg = palette.info_bg, fg = palette.light }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticHint = { bg = palette.hint_bg, fg = palette.blue }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		-- DiagnosticVirtualTextError = { }, -- Used for "Error" diagnostic virtual text.
		-- DiagnosticVirtualTextWarn  = { }, -- Used for "Warn" diagnostic virtual text.
		-- DiagnosticVirtualTextInfo  = { }, -- Used for "Info" diagnostic virtual text.
		-- DiagnosticVirtualTextHint  = { }, -- Used for "Hint" diagnostic virtual text.
		DiagnosticUnderlineError = { sp = palette.red_error, undercurl = true }, -- Used to underline "Error" diagnostics.
		DiagnosticUnderlineWarn = { sp = palette.orange_accent, undercurl = true }, -- Used to underline "Warn" diagnostics.
		DiagnosticUnderlineInfo = { sp = palette.light, undercurl = true }, -- Used to underline "Info" diagnostics.
		DiagnosticUnderlineHint = { sp = palette.blue, undercurl = true }, -- Used to underline "Hint" diagnostics.
		DiagnosticSignError = { bg = palette.none }, -- Used for "Error" signs in sign column.
		DiagnosticSignWarn = { bg = palette.none }, -- Used for "Warn" signs in sign column.
		DiagnosticSignInfo = { bg = palette.none }, -- Used for "Info" signs in sign column.
		DiagnosticSignHint = { bg = palette.none }, -- Used for "Hint" signs in sign column.
		-- DiagnosticFloatingError    = { }, -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
		-- DiagnosticFloatingWarn     = { }, -- Used to color "Warn" diagnostic messages in diagnostics float.
		-- DiagnosticFloatingInfo     = { }, -- Used to color "Info" diagnostic messages in diagnostics float.
		-- DiagnosticFloatingHint     = { }, -- Used to color "Hint" diagnostic messages in diagnostics float.

		-- These groups are for tree-sitter:

		["@attribute"] = { fg = palette.lime }, -- Annotations that can be attached to the code to denote some kind of meta information. e.g. C++/Dart attributes.
		["@boolean"] = { fg = palette.yellow }, -- Boolean literals: `True` and `False` in Python.
		-- ["@character"]          = { }, -- Character literals: `'a'` in C.
		-- ["@comment"]            = { }, -- Line comments and block comments.
		-- ["@conditional"]        = { }, -- Keywords related to conditionals: `if`, `when`, `cond`, etc.
		["@constant"] = { fg = palette.red }, -- Constants identifiers. These might not be semantically constant. E.g. uppercase variables in Python.
		-- ["@constant.builtin"] = { link = "Type" }, -- Built-in constant values: `nil` in Lua.
		["@constant.builtin"] = { fg = palette.coral }, -- Built-in constant values: `nil` in Lua.
		-- ["@constant.macro"]         = { }, -- Constants defined by macros: `NULL` in C.
		["@constructor"] = { fg = palette.yellow }, -- Constructor calls and definitions: `= {}` in Lua, and Java constructors.
		["@error"] = { fg = palette.red_error }, -- Syntax/parser errors. This might highlight large sections of code while the user is typing still incomplete code, use a sensible highlight.
		["@exception"] = { fg = palette.purple }, -- Exception related keywords: `try`, `except`, `finally` in Python.
		["@field"] = { fg = palette.cyan }, -- Object and struct fields.
		-- ["@float"]              = { }, -- Floating-point number literals.
		["@function"] = { link = "Function" }, -- Function calls and definitions.
		["@function.call"] = { fg = palette.yellow },
		["@function.builtin"] = { fg = palette.red }, -- Built-in functions: `print` in Lua.
		["@function.macro"] = { fg = palette.lime }, -- Macro defined functions (calls and definitions): each `macro_rules` in Rust.
		["@function.method.call"] = { link = "@function.call" }, -- Macro defined functions (calls and definitions): each `macro_rules` in Rust.
		["@include"] = { fg = palette.lime }, -- File or module inclusion keywords: `#include` in C, `use` or `extern crate` in Rust.
		["@keyword"] = { fg = palette.cyan }, -- Keywords that don't fit into other categories.
		["@keyword.function"] = { link = "@keyword" }, -- Keywords used to define a function: `function` in Lua, `def` and `lambda` in Python.
		-- ["@keyword.operator"]    = { }, -- Unary and binary operators that are English words: `and`, `or` in Python; `sizeof` in C.
		-- ["@keyword.return"]      = { }, -- Keywords like `return` and `yield`.
		["@label"] = { fg = palette.yellow }, -- GOTO labels: `label:` in C, and `::label::` in Lua.
		["@method"] = { fg = palette.yellow }, -- Method calls and definitions.
		["@namespace"] = { fg = palette.lightest }, -- Identifiers referring to modules and namespaces.
		-- ["@none"]               = { }, -- No highlighting (sets all highlight arguments to `NONE`). this group is used to clear certain ranges, for example, string interpolations. Don't change the values of this highlight group.
		-- ["@number"]             = { }, -- Numeric literals that don't fit into other categories.
		-- ["@operator"]           = { }, -- Binary or unary operators: `+`, and also `->` and `*` in C.
		-- ["@parameter"]          = { }, -- Parameters of a function.
		-- ["@parameter.reference"] = { }, -- References to parameters of a function.
		["@property"] = { fg = palette.green }, -- Same as `["@field"]`.
		["@punctuation.delimiter"] = { fg = palette.light }, -- Punctuation delimiters: Periods, commas, semicolons, etc.
		["@punctuation.bracket"] = { fg = palette.light }, -- Brackets, braces, parentheses, etc.
		["@punctuation.special"] = { fg = palette.light }, -- Special punctuation that doesn't fit into the previous categories.
		-- ["@repeat"]             = { }, -- Keywords related to loops: `for`, `while`, etc.
		["@string"] = { fg = "#83AE5B" }, -- String literals.
		-- ["@string.regex"]        = { }, -- Regular expression literals.
		-- ["@string.escape"]       = { }, -- Escape characters within a string: `\n`, `\t`, etc.
		["@string.special"] = { fg = palette.cyan }, -- Strings with special meaning that don't fit into the previous categories.
		-- ["@symbol"]             = { }, -- Identifiers referring to symbols or atoms.
		["@tag"] = { fg = palette.light_blue }, -- Tags like HTML tag names.
		["@tag.attribute"] = { fg = palette.green }, -- HTML tag attributes.
		["@tag.delimiter"] = { fg = palette.mid_gray }, -- Tag delimiters like `<` `>` `/`.
		-- ["@text"]               = { }, -- Non-structured text. Like text in a markup language.
		-- ["@strong"]             = { }, -- Text to be represented in bold.
		-- ["@emphasis"]           = { }, -- Text to be represented with emphasis.
		-- ["@underline"]          = { }, -- Text to be represented with an underline.
		-- ["@strike"]             = { }, -- Strikethrough text.
		-- ["@title"]              = { }, -- Text that is part of a title.
		-- ["@literal"]            = { }, -- Literal or verbatim text.
		-- ["@uri"]                = { }, -- URIs like hyperlinks or email addresses.
		-- ["@math"]               = { }, -- Math environments like LaTeX's `$ ... $`
		-- ["@text.reference"]      = { }, -- Footnotes, text references, citations, etc.
		-- ["@environment"]        = { }, -- Text environments of markup languages.
		-- ["@environment.name"]    = { }, -- Text/string indicating the type of text environment. Like the name of a `\begin` block in LaTeX.
		-- ["@note"]               = { }, -- Text representation of an informational note.
		["@warning"] = { fg = palette.yellow_accent }, -- Text representation of a warning note.
		["@danger"] = { fg = palette.red_error }, -- Text representation of a danger note.
		["@type"] = { link = "Type" }, -- Type (and class) definitions and annotations.
		["@type.builtin"] = { link = "Type" }, -- Built-in types: `i32` in Rust.
		["@type.definition"] = { link = "Type" },
		["@type.identifier"] = { link = "Type" },
		["@variable"] = { fg = palette.light }, -- Variable names that don't fit into other categories.
		["@variable.member"] = { fg = palette.lighter }, -- Variable names that don't fit into other categories.
		-- ["@variable.builtin"] = { link = "Identifier" }, -- Variable names defined by the language: `this` or `self` in Javascript.
		["@variable.builtin"] = { fg = palette.coral }, -- Variable names defined by the language: `this` or `self` in Javascript.

		-- These groups are for the native LSP client and diagnostic system. Some
		-- other LSP clients may use these groups, or use their own. Consult your
		-- LSP client's documentation.

		["@lsp.type.class"] = { link = "@constructor" },
		["@lsp.type.comment"] = {}, -- do not overwrite comments
		["@lsp.type.decorator"] = { link = "@parameter" },
		["@lsp.type.enum"] = { link = "@type" },
		["@lsp.type.enumMember"] = { link = "@constant" },
		["@lsp.type.function"] = { fg = "NONE" },
		["@lsp.type.interface"] = { link = "@keyword" },
		["@lsp.type.macro"] = { link = "@macro" },
		["@lsp.type.method"] = { link = "@method" },
		["@lsp.type.namespace"] = { link = "@namespace" },
		["@lsp.type.parameter"] = { link = "@parameter" },
		["@lsp.type.property"] = { link = "@property" },
		["@lsp.type.struct"] = { link = "@type" },
		["@lsp.type.type"] = { link = "@type" },
		["@lsp.type.typeParameter"] = { link = "@type.definition" },
		["@lsp.type.variable"] = { link = "@variable" },

		TSRainbowRed = { fg = palette.red },
		TSRainbowYellow = { fg = palette.yellow },
		TSRainbowBlue = { fg = palette.blue },
		TSRainbowOrange = { fg = palette.orange },
		TSRainbowGreen = { fg = palette.green },
		TSRainbowViolet = { fg = palette.purple },
		TSRainbowCyan = { fg = palette.cyan },

		-- nvim-cmp

		CmpItemAbbrDeprecated = { bg = "NONE", strikethrough = true, fg = palette.dark_gray },
		CmpItemAbbrMatch = { bg = "NONE", fg = palette.blue },
		CmpItemAbbrMatchFuzzy = { link = "CmpIntemAbbrMatch" },
		CmpItemKindVariable = { bg = "NONE", fg = palette.light_blue },
		CmpItemKindInterface = { link = "CmpItemKindVariable" },
		CmpItemKindText = { link = "CmpItemKindVariable" },
		CmpItemKindFunction = { bg = "NONE", fg = palette.pink },
		CmpItemKindMethod = { link = "CmpItemKindFunction" },
		CmpItemKindKeyword = { bg = "NONE", fg = palette.light },
		CmpItemKindProperty = { link = "CmpItemKindKeyword" },
		CmpItemKindUnit = { link = "CmpItemKindKeyword" },

		CmpDocumentation = { link = "NormalFloat" },
		CmpDocumentationBorder = { link = "FloatBorder" },
		CmpCompletion = { link = "Pmenu" },
		CmpCompletionSel = { fg = "NONE", bg = palette.dark_gray },
		CmpCompletionBorder = { fg = palette.purple, bg = palette.dark_gray },
		CmpCompletionThumb = { link = "PmenuThumb" },
		CmpCompletionSbar = { link = "PmenuSbar" },
		CmpItemAbbr = { fg = palette.light },
		CmpItemKindDefault = { fg = palette.light },
		CmpItemMenu = { fg = palette.mid_gray },

		-- rainbow-delimiters
		RainbowDelimiterRed = { fg = palette.red },
		RainbowDelimiterYellow = { fg = palette.yellow },
		RainbowDelimiterBlue = { fg = palette.blue },
		RainbowDelimiterOrange = { fg = palette.orange },
		RainbowDelimiterGreen = { fg = palette.green },
		RainbowDelimiterViolet = { fg = palette.purple },
		RainbowDelimiterCyan = { fg = palette.cyan },

		-- nvimtree

		NvimTreeFolderName = { fg = palette.blue },
		NvimTreeFolderIcon = { fg = palette.blue },
		NvimTreeNormal = { fg = palette.light, bg = palette.background },
		NvimTreeOpenedFolderName = { fg = palette.blue },
		NvimTreeEmptyFolderName = { fg = palette.blue },
		NvimTreeRootFolder = { fg = palette.purple, bold = true },
		NvimTreeSymlink = { fg = palette.pink },
		NvimTreeStatuslineNc = { fg = palette.green_accent, bg = palette.green_accent },
		NvimTreeGitDirty = { fg = palette.yellow },
		NvimTreeGitNew = { fg = palette.blue },
		NvimTreeGitDeleted = { fg = palette.red },
		NvimTreeSpecialFile = { fg = palette.orange },
		NvimTreeImageFile = { fg = palette.light },
		NvimTreeOpenedFile = { fg = palette.pink },

		-- Lazy
		LazyProgressTodo = { fg = palette.lightest },

		-- neovim
		healthError = { fg = palette.red_error },
		healthSuccess = { fg = palette.green },
		healthWarning = { fg = palette.yellow },

		-- dashboard
		DashboardShortCut = { fg = palette.cyan },
		DashboardHeader = { fg = palette.blue },
		DashboardCenter = { fg = palette.pink },
		DashboardFooter = { fg = palette.blue },
		DashboardKey = { fg = palette.orange },
		DashboardDesc = { fg = palette.cyan },
		DashboardIcon = { fg = palette.cyan, bold = true },

		-- Telescope
		TelescopeBorder = { fg = palette.blue_accent, bg = palette.darkest },
		TelescopeTitle = { fg = palette.cyan },
		TelescopeSelection = { link = "CursorLine" },
		TelescopeSelectionCaret = { link = "CursorLineNr" },
		TelescopeResultsClass = { link = "Structure" },
		TelescopeResultsStruct = { link = "Structure" },
		TelescopeResultsField = { link = "@field" },
		TelescopeResultsMethod = { link = "Function" },
		TelescopeResultsVariable = { link = "@variable" },

		-- gitsigns
		GitSignsAdd = { fg = palette.green },
		GitSignsChange = { fg = palette.yellow },
		GitSignsDelete = { fg = palette.red },

		-- blink
		BlinkCmpMenu = { link = "Pmenu" },
		BlinkCmpMenuBorder = { fg = "NONE", bg = "NONE" },
		BlinkCmpMenuSelection = { bg = palette.darker, fg = palette.light },
		BlinkCmpLabel = { link = "Normal" },
		BlinkCmpLabelDeprecated = { fg = palette.dark_gray, strikethrough = true },
		BlinkCmpLabelMatch = { fg = palette.blue },
		BlinkCmpDoc = { link = "NormalFloat" },
		BlinkCmpDocBorder = { link = "BlinkCmpMenuBorder" },
		BlinkCmpDocCursorLine = { link = "Visual" },
		BlinkCmpSignatureHelp = { link = "NormalFloat" },
		BlinkCmpSignatureHelpBorder = { link = "BlinkCmpMenuBorder" },
		BlinkCmpSignatureHelpActiveParameter = { fg = palette.blue },

		-- bufferline
		BufferLineFill = { bg = palette.darker },

		-- leap
		LeapBackdrop = { link = "Comment" },

		-- mini statusline
		MiniStatuslineModeNormal = { bold = true },
		MiniStatuslineModeCommand = { bg = palette.darkest, fg = palette.purple_accent, bold = true },
		MiniStatuslineModeOther = { bg = palette.darkest, fg = palette.yellow_accent, bold = true },

		-- snacks
		SnacksNotifierBorderInfo = { link = "@string" },
		SnacksNotifierBorderWarn = { bg = palette.none },
		SnacksNotifierBorderError = { bg = palette.none },
		SnacksNotifierTitleInfo = { link = "@string" },
		SnacksPickerBorder = { fg = palette.dark_gray },
		SnacksPickerTitle = { bg = palette.dark_gray },
	}

	for group, hl in pairs(config.overrides) do
		if groups[group] then
			-- "link" should not mix with other configs (:h hi-link)
			groups[group].link = nil
		end

		groups[group] = vim.tbl_extend("force", groups[group] or {}, hl)
	end

	return groups
end

return M
