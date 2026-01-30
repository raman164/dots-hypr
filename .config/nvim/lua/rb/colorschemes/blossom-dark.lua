-- Blossom Dark colorscheme for Neovim
-- Colors from rayes0/dotfiles

local M = {}

M.colors = {
    bg = "#2a2a2a",
    bg_dark = "#1a1a1a",
    bg_light = "#3a3a3a",
    fg = "#bebebe",
    fg_dark = "#8a8a8a",

    -- From .Xresources
    red = "#937f74",
    green = "#a09c7e",
    yellow = "#8b8f7e",
    blue = "#987a6b",
    magenta = "#877979",
    cyan = "#637a8b",

    -- Additional colors from eww.scss
    brown = "#6c605a",
    beige = "#e6dad6",
    olive = "#a09c80",
    hover = "#987a6b",
    accent = "#937f74",

    comment = "#6a6a6a",
    selection = "#3a3a3a",
    line_nr = "#5a5a5a",
    cursor_line = "#323232",
}

function M.setup()
    vim.cmd("hi clear")
    if vim.fn.exists("syntax_on") then
        vim.cmd("syntax reset")
    end

    vim.o.termguicolors = true
    vim.g.colors_name = "blossom-dark"

    local c = M.colors
    local hi = function(group, opts)
        vim.api.nvim_set_hl(0, group, opts)
    end

    -- Editor
    hi("Normal", { fg = c.fg, bg = "NONE" })
    hi("NormalFloat", { fg = c.fg, bg = c.bg_dark })
    hi("FloatBorder", { fg = c.fg_dark, bg = c.bg_dark })
    hi("ColorColumn", { bg = c.bg_light })
    hi("Cursor", { fg = c.bg, bg = c.fg })
    hi("CursorLine", { bg = c.cursor_line })
    hi("CursorColumn", { bg = c.cursor_line })
    hi("LineNr", { fg = c.line_nr })
    hi("CursorLineNr", { fg = c.yellow, bold = true })
    hi("SignColumn", { bg = c.bg })
    hi("VertSplit", { fg = c.bg_light })
    hi("WinSeparator", { fg = c.bg_light })
    hi("Folded", { fg = c.comment, bg = c.bg_light })
    hi("FoldColumn", { fg = c.comment, bg = c.bg })
    hi("Pmenu", { fg = c.fg, bg = c.bg_dark })
    hi("PmenuSel", { fg = c.fg, bg = c.selection })
    hi("PmenuSbar", { bg = c.bg_light })
    hi("PmenuThumb", { bg = c.fg_dark })
    hi("StatusLine", { fg = c.fg, bg = c.bg_light })
    hi("StatusLineNC", { fg = c.fg_dark, bg = c.bg_dark })
    hi("TabLine", { fg = c.fg_dark, bg = c.bg_dark })
    hi("TabLineFill", { bg = c.bg_dark })
    hi("TabLineSel", { fg = c.fg, bg = c.bg })
    hi("Search", { fg = c.bg, bg = c.yellow })
    hi("IncSearch", { fg = c.bg, bg = c.green })
    hi("Visual", { bg = c.selection })
    hi("VisualNOS", { bg = c.selection })
    hi("MatchParen", { fg = c.yellow, bold = true })
    hi("NonText", { fg = c.bg_light })
    hi("SpecialKey", { fg = c.bg_light })
    hi("Title", { fg = c.green, bold = true })
    hi("Directory", { fg = c.blue })
    hi("ErrorMsg", { fg = c.red })
    hi("WarningMsg", { fg = c.yellow })
    hi("MoreMsg", { fg = c.green })
    hi("ModeMsg", { fg = c.fg })
    hi("Question", { fg = c.green })

    -- Syntax
    hi("Comment", { fg = c.comment, italic = true })
    hi("Constant", { fg = c.cyan })
    hi("String", { fg = c.green })
    hi("Character", { fg = c.green })
    hi("Number", { fg = c.cyan })
    hi("Boolean", { fg = c.cyan })
    hi("Float", { fg = c.cyan })
    hi("Identifier", { fg = c.fg })
    hi("Function", { fg = c.blue })
    hi("Statement", { fg = c.magenta })
    hi("Conditional", { fg = c.magenta })
    hi("Repeat", { fg = c.magenta })
    hi("Label", { fg = c.magenta })
    hi("Operator", { fg = c.fg })
    hi("Keyword", { fg = c.magenta })
    hi("Exception", { fg = c.magenta })
    hi("PreProc", { fg = c.yellow })
    hi("Include", { fg = c.magenta })
    hi("Define", { fg = c.magenta })
    hi("Macro", { fg = c.yellow })
    hi("PreCondit", { fg = c.yellow })
    hi("Type", { fg = c.yellow })
    hi("StorageClass", { fg = c.yellow })
    hi("Structure", { fg = c.yellow })
    hi("Typedef", { fg = c.yellow })
    hi("Special", { fg = c.cyan })
    hi("SpecialChar", { fg = c.cyan })
    hi("Tag", { fg = c.blue })
    hi("Delimiter", { fg = c.fg })
    hi("SpecialComment", { fg = c.comment })
    hi("Debug", { fg = c.red })
    hi("Underlined", { underline = true })
    hi("Error", { fg = c.red })
    hi("Todo", { fg = c.bg, bg = c.yellow, bold = true })

    -- Treesitter
    hi("@variable", { fg = c.fg })
    hi("@variable.builtin", { fg = c.red })
    hi("@variable.parameter", { fg = c.fg })
    hi("@variable.member", { fg = c.fg })
    hi("@constant", { fg = c.cyan })
    hi("@constant.builtin", { fg = c.cyan })
    hi("@module", { fg = c.yellow })
    hi("@label", { fg = c.magenta })
    hi("@string", { fg = c.green })
    hi("@string.escape", { fg = c.cyan })
    hi("@character", { fg = c.green })
    hi("@number", { fg = c.cyan })
    hi("@boolean", { fg = c.cyan })
    hi("@type", { fg = c.yellow })
    hi("@type.builtin", { fg = c.yellow })
    hi("@attribute", { fg = c.yellow })
    hi("@property", { fg = c.fg })
    hi("@function", { fg = c.blue })
    hi("@function.builtin", { fg = c.blue })
    hi("@function.macro", { fg = c.yellow })
    hi("@constructor", { fg = c.yellow })
    hi("@keyword", { fg = c.magenta })
    hi("@keyword.function", { fg = c.magenta })
    hi("@keyword.operator", { fg = c.magenta })
    hi("@keyword.return", { fg = c.magenta })
    hi("@operator", { fg = c.fg })
    hi("@punctuation", { fg = c.fg })
    hi("@punctuation.bracket", { fg = c.fg })
    hi("@punctuation.delimiter", { fg = c.fg })
    hi("@comment", { fg = c.comment, italic = true })
    hi("@tag", { fg = c.blue })
    hi("@tag.attribute", { fg = c.yellow })
    hi("@tag.delimiter", { fg = c.fg })

    -- LSP
    hi("DiagnosticError", { fg = c.red })
    hi("DiagnosticWarn", { fg = c.yellow })
    hi("DiagnosticInfo", { fg = c.blue })
    hi("DiagnosticHint", { fg = c.cyan })
    hi("DiagnosticUnderlineError", { undercurl = true, sp = c.red })
    hi("DiagnosticUnderlineWarn", { undercurl = true, sp = c.yellow })
    hi("DiagnosticUnderlineInfo", { undercurl = true, sp = c.blue })
    hi("DiagnosticUnderlineHint", { undercurl = true, sp = c.cyan })
    hi("LspReferenceText", { bg = c.selection })
    hi("LspReferenceRead", { bg = c.selection })
    hi("LspReferenceWrite", { bg = c.selection })

    -- Git
    hi("DiffAdd", { fg = c.green, bg = c.bg_dark })
    hi("DiffChange", { fg = c.yellow, bg = c.bg_dark })
    hi("DiffDelete", { fg = c.red, bg = c.bg_dark })
    hi("DiffText", { fg = c.blue, bg = c.bg_dark })
    hi("GitSignsAdd", { fg = c.green })
    hi("GitSignsChange", { fg = c.yellow })
    hi("GitSignsDelete", { fg = c.red })

    -- Telescope
    hi("TelescopeNormal", { fg = c.fg, bg = c.bg_dark })
    hi("TelescopeBorder", { fg = c.fg_dark, bg = c.bg_dark })
    hi("TelescopePromptNormal", { fg = c.fg, bg = c.bg_light })
    hi("TelescopePromptBorder", { fg = c.bg_light, bg = c.bg_light })
    hi("TelescopePromptTitle", { fg = c.bg, bg = c.green })
    hi("TelescopePreviewTitle", { fg = c.bg, bg = c.blue })
    hi("TelescopeResultsTitle", { fg = c.bg, bg = c.magenta })
    hi("TelescopeSelection", { bg = c.selection })
    hi("TelescopeMatching", { fg = c.yellow, bold = true })

    -- NvimTree
    hi("NvimTreeNormal", { fg = c.fg, bg = c.bg_dark })
    hi("NvimTreeFolderIcon", { fg = c.blue })
    hi("NvimTreeFolderName", { fg = c.blue })
    hi("NvimTreeOpenedFolderName", { fg = c.blue })
    hi("NvimTreeRootFolder", { fg = c.magenta })
    hi("NvimTreeGitDirty", { fg = c.yellow })
    hi("NvimTreeGitNew", { fg = c.green })
    hi("NvimTreeGitDeleted", { fg = c.red })

    -- WhichKey
    hi("WhichKey", { fg = c.cyan })
    hi("WhichKeyGroup", { fg = c.blue })
    hi("WhichKeyDesc", { fg = c.fg })
    hi("WhichKeySeparator", { fg = c.comment })
    hi("WhichKeyFloat", { bg = c.bg_dark })

    -- Indent Blankline
    hi("IndentBlanklineChar", { fg = c.bg_light })
    hi("IndentBlanklineContextChar", { fg = c.fg_dark })
end

return M
