return {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("kanagawa").setup({
            compile = false,
            undercurl = true,
            commentStyle = { italic = true },
            functionStyle = {},
            keywordStyle = { bold = true },
            statementStyle = { bold = true },
            typeStyle = {},
            variablebuiltinStyle = { italic = true },
            specialReturn = true,
            specialException = true,
            transparent = true,
            dimInactive = false,
            globalStatus = true,
            colors = {
                theme = {
                    all = {
                        ui = {
                            bg_gutter = "none",
                        },
                    },
                },
            },
            overrides = function(colors)
                local palette = colors.palette
                return {
                    -- brighter background for context and LspReference
                    TreesitterContext = { bg = palette.sumiInk4 },
                    LspReferenceText = { bg = palette.sumiInk4 },
                    -- default NormalFloat BG is too dark
                    NormalFloat = { bg = palette.sumiInk3 },
                    WinSeparator = { bg = "none", fg = palette.fujiGray },
                }
            end,
        })
        vim.cmd("colorscheme kanagawa")
    end,
}
