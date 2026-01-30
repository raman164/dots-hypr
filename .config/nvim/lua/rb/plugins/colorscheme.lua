-- Multi-colorscheme support with theme switcher integration
-- The active theme is read from ~/.config/nvim/current_theme

local function get_current_theme()
    local theme_file = vim.fn.expand("~/.config/nvim/current_theme")
    local file = io.open(theme_file, "r")
    if file then
        local theme = file:read("*l")
        file:close()
        return theme or "gruvbox"
    end
    return "gruvbox"
end

return {
    -- Gruvbox
    {
        "ellisonleao/gruvbox.nvim",
        lazy = true,
        priority = 1000,
        config = function()
            require("gruvbox").setup({
                terminal_colors = true,
                undercurl = true,
                underline = true,
                bold = true,
                italic = {
                    strings = true,
                    emphasis = true,
                    comments = true,
                    operators = false,
                    folds = true,
                },
                strikethrough = true,
                invert_selection = false,
                invert_signs = false,
                invert_tabline = false,
                invert_intend_guides = false,
                inverse = true,
                contrast = "",
                palette_overrides = {},
                overrides = {},
                dim_inactive = false,
                transparent_mode = false,
            })
        end,
    },
    -- Tokyo Night
    {
        "folke/tokyonight.nvim",
        lazy = true,
        priority = 1000,
        config = function()
            require("tokyonight").setup({
                style = "night",
                transparent = false,
                terminal_colors = true,
            })
        end,
    },
    -- Rose Pine
    {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = true,
        priority = 1000,
        config = function()
            require("rose-pine").setup({
                variant = "auto",
                dark_variant = "main",
            })
        end,
    },
    -- Kanagawa
    {
        "rebelot/kanagawa.nvim",
        lazy = true,
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
                        TreesitterContext = { bg = palette.sumiInk4 },
                        LspReferenceText = { bg = palette.sumiInk4 },
                        NormalFloat = { bg = palette.sumiInk3 },
                        WinSeparator = { bg = "none", fg = palette.fujiGray },
                    }
                end,
            })
        end,
    },
    -- Nord
    {
        "shaunsingh/nord.nvim",
        lazy = true,
        priority = 1000,
    },
    -- Dracula
    {
        "Mofiqul/dracula.nvim",
        lazy = true,
        priority = 1000,
    },
    -- Everforest
    {
        "sainnhe/everforest",
        lazy = true,
        priority = 1000,
        config = function()
            vim.g.everforest_background = "medium"
            vim.g.everforest_better_performance = 1
        end,
    },
    -- Catppuccin (for light themes)
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = true,
        priority = 1000,
    },
    -- One (OneDark/OneLight)
    {
        "navarasu/onedark.nvim",
        lazy = true,
        priority = 1000,
    },
    -- Blossom (warm earth tones light theme)
    {
        "rayes0/blossom.vim",
        lazy = true,
        priority = 1000,
    },
    -- Solarized
    {
        "maxmx03/solarized.nvim",
        lazy = true,
        priority = 1000,
        config = function()
            require("solarized").setup({
                transparent = { enabled = false },
                styles = {
                    comments = { italic = true },
                    keywords = { bold = true },
                },
            })
        end,
    },
    -- Selenized
    {
        "calind/selenized.nvim",
        lazy = true,
        priority = 1000,
    },
    -- Loader - this runs last and sets the colorscheme
    {
        "nvim-lua/plenary.nvim", -- dummy dependency to ensure this runs
        priority = 999,
        config = function()
            local theme_file = vim.fn.expand("~/.config/nvim/current_theme")
            local theme_map = {
                default = "kanagawa-wave",
                nightowl = "tokyonight-night",
                gruvbox = "gruvbox",
                tokyonight = "tokyonight-night",
                rosepine = "rose-pine",
                ["rosepine-dawn"] = "rose-pine-dawn",
                kanagawa = "kanagawa-wave",
                nord = "nord",
                dracula = "dracula",
                everforest = "everforest",
                everblush = "catppuccin-frappe",
                ["gruvbox-light"] = "gruvbox",
                ["solarized-light"] = "solarized",
                zenbones = "catppuccin-latte",
                alabaster = "catppuccin-latte",
                papercolor = "catppuccin-latte",
                modus = "catppuccin-latte",
                blossom = "blossom",
                ["blossom-dark"] = "blossom-dark",
                ["catppuccin-latte"] = "catppuccin-latte",
                ["selenized-light"] = "selenized",
                huggingface = "tokyonight-night",
            }

            -- Light themes list
            local light_themes = {
                ["gruvbox-light"] = true,
                ["solarized-light"] = true,
                ["zenbones"] = true,
                ["alabaster"] = true,
                ["papercolor"] = true,
                ["modus"] = true,
                ["rosepine-dawn"] = true,
                ["blossom"] = true,
                ["catppuccin-latte"] = true,
                ["selenized-light"] = true,
            }

            -- Function to apply colorscheme
            local function apply_theme(theme)
                -- Handle custom blossom-dark colorscheme
                if theme == "blossom-dark" then
                    local ok, blossom_dark = pcall(require, "rb.colorschemes.blossom-dark")
                    if ok then
                        blossom_dark.setup()
                        return
                    end
                end

                -- Handle custom huggingface colorscheme
                if theme == "huggingface" then
                    local ok, hf = pcall(require, "rb.colorschemes.huggingface")
                    if ok then
                        hf.setup()
                        return
                    end
                end

                local colorscheme = theme_map[theme] or "gruvbox"

                -- Set background for light/dark themes
                if light_themes[theme] then
                    vim.o.background = "light"
                else
                    vim.o.background = "dark"
                end

                pcall(vim.cmd, "colorscheme " .. colorscheme)
            end

            -- Apply initial theme
            local theme = get_current_theme()
            apply_theme(theme)

            -- Watch theme file for changes (live reload)
            local w = vim.uv.new_fs_event()
            if w then
                w:start(theme_file, {}, vim.schedule_wrap(function()
                    local new_theme = get_current_theme()
                    apply_theme(new_theme)
                end))
            end
        end,
    },
}
