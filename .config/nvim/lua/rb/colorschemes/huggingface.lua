-- Hugging Face Dark Theme for Neovim
-- Inspired by huggingface.co

local M = {}

M.colors = {
    bg = "#0f1117",
    bg_dark = "#0a0b0f",
    bg_light = "#1a1a2e",
    bg_highlight = "#2a2a3e",
    fg = "#e8e8e8",
    fg_dark = "#a0a0a0",
    fg_light = "#ffffff",

    -- Accent colors
    yellow = "#ffd21e",
    orange = "#ff9d00",
    red = "#ff6b6b",
    green = "#4ade80",
    blue = "#60a5fa",
    cyan = "#22d3ee",
    magenta = "#c084fc",
    violet = "#a78bfa",

    -- UI colors
    comment = "#6b7280",
    selection = "#2a2a3e",
    line_nr = "#4b5563",
    cursor_line = "#1a1a2e",
    border = "#2a2a3e",

    none = "NONE",
}

function M.setup()
    local c = M.colors

    vim.cmd("hi clear")
    if vim.fn.exists("syntax_on") then
        vim.cmd("syntax reset")
    end
    vim.o.termguicolors = true
    vim.g.colors_name = "huggingface"

    local function hi(group, opts)
        vim.api.nvim_set_hl(0, group, opts)
    end

    -- Editor
    hi("Normal", { fg = c.fg, bg = c.bg })
    hi("NormalFloat", { fg = c.fg, bg = c.bg_light })
    hi("FloatBorder", { fg = c.border, bg = c.bg_light })
    hi("ColorColumn", { bg = c.bg_light })
    hi("Cursor", { fg = c.bg, bg = c.yellow })
    hi("CursorLine", { bg = c.cursor_line })
    hi("CursorColumn", { bg = c.cursor_line })
    hi("LineNr", { fg = c.line_nr })
    hi("CursorLineNr", { fg = c.yellow, bold = true })
    hi("SignColumn", { fg = c.fg_dark, bg = c.bg })
    hi("VertSplit", { fg = c.border })
    hi("WinSeparator", { fg = c.border })
    hi("Folded", { fg = c.comment, bg = c.bg_light })
    hi("FoldColumn", { fg = c.comment })
    hi("NonText", { fg = c.bg_highlight })
    hi("SpecialKey", { fg = c.bg_highlight })
    hi("Search", { fg = c.bg, bg = c.yellow })
    hi("IncSearch", { fg = c.bg, bg = c.orange })
    hi("CurSearch", { fg = c.bg, bg = c.orange })
    hi("Visual", { bg = c.selection })
    hi("VisualNOS", { bg = c.selection })
    hi("Pmenu", { fg = c.fg, bg = c.bg_light })
    hi("PmenuSel", { fg = c.bg, bg = c.yellow })
    hi("PmenuSbar", { bg = c.bg_highlight })
    hi("PmenuThumb", { bg = c.yellow })
    hi("StatusLine", { fg = c.fg, bg = c.bg_light })
    hi("StatusLineNC", { fg = c.comment, bg = c.bg_dark })
    hi("TabLine", { fg = c.comment, bg = c.bg_dark })
    hi("TabLineFill", { bg = c.bg_dark })
    hi("TabLineSel", { fg = c.fg, bg = c.bg })
    hi("WildMenu", { fg = c.bg, bg = c.yellow })
    hi("MatchParen", { fg = c.yellow, bold = true })
    hi("Directory", { fg = c.blue })
    hi("Title", { fg = c.yellow, bold = true })
    hi("ErrorMsg", { fg = c.red })
    hi("WarningMsg", { fg = c.orange })
    hi("ModeMsg", { fg = c.fg })
    hi("MoreMsg", { fg = c.green })
    hi("Question", { fg = c.cyan })

    -- Syntax
    hi("Comment", { fg = c.comment, italic = true })
    hi("Constant", { fg = c.orange })
    hi("String", { fg = c.green })
    hi("Character", { fg = c.green })
    hi("Number", { fg = c.orange })
    hi("Boolean", { fg = c.orange })
    hi("Float", { fg = c.orange })
    hi("Identifier", { fg = c.fg })
    hi("Function", { fg = c.blue })
    hi("Statement", { fg = c.magenta })
    hi("Conditional", { fg = c.magenta })
    hi("Repeat", { fg = c.magenta })
    hi("Label", { fg = c.cyan })
    hi("Operator", { fg = c.fg })
    hi("Keyword", { fg = c.magenta, bold = true })
    hi("Exception", { fg = c.red })
    hi("PreProc", { fg = c.cyan })
    hi("Include", { fg = c.magenta })
    hi("Define", { fg = c.magenta })
    hi("Macro", { fg = c.cyan })
    hi("PreCondit", { fg = c.cyan })
    hi("Type", { fg = c.yellow })
    hi("StorageClass", { fg = c.yellow })
    hi("Structure", { fg = c.yellow })
    hi("Typedef", { fg = c.yellow })
    hi("Special", { fg = c.cyan })
    hi("SpecialChar", { fg = c.orange })
    hi("Tag", { fg = c.yellow })
    hi("Delimiter", { fg = c.fg })
    hi("SpecialComment", { fg = c.comment })
    hi("Debug", { fg = c.red })
    hi("Underlined", { fg = c.blue, underline = true })
    hi("Error", { fg = c.red })
    hi("Todo", { fg = c.bg, bg = c.yellow, bold = true })

    -- Treesitter
    hi("@variable", { fg = c.fg })
    hi("@variable.builtin", { fg = c.orange })
    hi("@variable.parameter", { fg = c.fg })
    hi("@variable.member", { fg = c.fg })
    hi("@constant", { fg = c.orange })
    hi("@constant.builtin", { fg = c.orange })
    hi("@constant.macro", { fg = c.cyan })
    hi("@module", { fg = c.yellow })
    hi("@label", { fg = c.cyan })
    hi("@string", { fg = c.green })
    hi("@string.escape", { fg = c.cyan })
    hi("@string.special", { fg = c.cyan })
    hi("@character", { fg = c.green })
    hi("@number", { fg = c.orange })
    hi("@boolean", { fg = c.orange })
    hi("@float", { fg = c.orange })
    hi("@function", { fg = c.blue })
    hi("@function.builtin", { fg = c.blue })
    hi("@function.call", { fg = c.blue })
    hi("@function.macro", { fg = c.cyan })
    hi("@function.method", { fg = c.blue })
    hi("@function.method.call", { fg = c.blue })
    hi("@constructor", { fg = c.yellow })
    hi("@operator", { fg = c.fg })
    hi("@keyword", { fg = c.magenta })
    hi("@keyword.function", { fg = c.magenta })
    hi("@keyword.operator", { fg = c.magenta })
    hi("@keyword.return", { fg = c.magenta })
    hi("@keyword.conditional", { fg = c.magenta })
    hi("@keyword.repeat", { fg = c.magenta })
    hi("@keyword.import", { fg = c.magenta })
    hi("@punctuation.delimiter", { fg = c.fg })
    hi("@punctuation.bracket", { fg = c.fg })
    hi("@punctuation.special", { fg = c.cyan })
    hi("@comment", { fg = c.comment, italic = true })
    hi("@type", { fg = c.yellow })
    hi("@type.builtin", { fg = c.yellow })
    hi("@type.definition", { fg = c.yellow })
    hi("@attribute", { fg = c.cyan })
    hi("@property", { fg = c.fg })
    hi("@tag", { fg = c.yellow })
    hi("@tag.attribute", { fg = c.blue })
    hi("@tag.delimiter", { fg = c.fg })

    -- LSP
    hi("DiagnosticError", { fg = c.red })
    hi("DiagnosticWarn", { fg = c.orange })
    hi("DiagnosticInfo", { fg = c.blue })
    hi("DiagnosticHint", { fg = c.cyan })
    hi("DiagnosticUnderlineError", { undercurl = true, sp = c.red })
    hi("DiagnosticUnderlineWarn", { undercurl = true, sp = c.orange })
    hi("DiagnosticUnderlineInfo", { undercurl = true, sp = c.blue })
    hi("DiagnosticUnderlineHint", { undercurl = true, sp = c.cyan })
    hi("LspReferenceText", { bg = c.bg_highlight })
    hi("LspReferenceRead", { bg = c.bg_highlight })
    hi("LspReferenceWrite", { bg = c.bg_highlight })

    -- Git
    hi("GitSignsAdd", { fg = c.green })
    hi("GitSignsChange", { fg = c.yellow })
    hi("GitSignsDelete", { fg = c.red })
    hi("DiffAdd", { bg = "#1a2e1a" })
    hi("DiffChange", { bg = "#2e2a1a" })
    hi("DiffDelete", { bg = "#2e1a1a" })
    hi("DiffText", { bg = "#3e3a1a" })

    -- Telescope
    hi("TelescopeNormal", { fg = c.fg, bg = c.bg })
    hi("TelescopeBorder", { fg = c.border, bg = c.bg })
    hi("TelescopePromptNormal", { fg = c.fg, bg = c.bg_light })
    hi("TelescopePromptBorder", { fg = c.bg_light, bg = c.bg_light })
    hi("TelescopePromptTitle", { fg = c.bg, bg = c.yellow })
    hi("TelescopePreviewTitle", { fg = c.bg, bg = c.green })
    hi("TelescopeResultsTitle", { fg = c.bg, bg = c.blue })
    hi("TelescopeSelection", { bg = c.selection })
    hi("TelescopeMatching", { fg = c.yellow, bold = true })

    -- NvimTree
    hi("NvimTreeNormal", { fg = c.fg, bg = c.bg_dark })
    hi("NvimTreeFolderIcon", { fg = c.yellow })
    hi("NvimTreeFolderName", { fg = c.blue })
    hi("NvimTreeOpenedFolderName", { fg = c.blue, bold = true })
    hi("NvimTreeRootFolder", { fg = c.yellow, bold = true })
    hi("NvimTreeSpecialFile", { fg = c.orange })
    hi("NvimTreeGitDirty", { fg = c.orange })
    hi("NvimTreeGitNew", { fg = c.green })
    hi("NvimTreeGitDeleted", { fg = c.red })

    -- Indent Blankline
    hi("IndentBlanklineChar", { fg = c.bg_highlight })
    hi("IndentBlanklineContextChar", { fg = c.yellow })
end

return M
