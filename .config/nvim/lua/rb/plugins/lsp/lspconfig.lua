return {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    priority = 50,
    dependencies = {
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig", -- Keep for compatibility with plugins like neodev
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
        { "folke/neodev.nvim", opts = {} },
    },
    config = function()
        -- Suppress lspconfig deprecation warning (we're using new vim.lsp.config API but keeping lspconfig for neodev compatibility)
        local original_notify = vim.notify
        vim.notify = function(msg, ...)
            if type(msg) == "string" and msg:match("lspconfig.*deprecated") then
                return
            end
            original_notify(msg, ...)
        end

        -- import mason_lspconfig plugin
        local mason_lspconfig = require("mason-lspconfig")

        -- Configure mason-lspconfig to install LSP servers
        mason_lspconfig.setup({
            -- list of servers for mason to install
            ensure_installed = {
                "clangd",
                "pyright",
                "lua_ls",
            },
            -- Automatic server setup handlers
            handlers = {
                -- default handler for all servers
                function(server_name)
                    vim.lsp.enable(server_name)
                end,
            },
        })

        -- import cmp-nvim-lsp plugin
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local keymap = vim.keymap -- for conciseness

        -- Auto show diagnostics on cursor hold
        vim.api.nvim_create_autocmd("CursorHold", {
            group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
            callback = function()
                vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
            end,
        })

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = ev.buf, silent = true }

                -- set keybinds
                opts.desc = "Show LSP references"
                keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

                opts.desc = "Go to declaration"
                keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

                opts.desc = "Show LSP definitions"
                keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

                opts.desc = "Show LSP implementations"
                keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

                opts.desc = "Show LSP type definitions"
                keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

                opts.desc = "See available code actions"
                keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

                opts.desc = "Smart rename"
                keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

                opts.desc = "Show buffer diagnostics"
                keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

                opts.desc = "Show line diagnostics"
                keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

                opts.desc = "Go to previous diagnostic"
                keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

                opts.desc = "Go to next diagnostic"
                keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

                opts.desc = "Show documentation for what is under cursor"
                keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

                opts.desc = "Restart LSP"
                keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
            end,
        })

        -- used to enable autocompletion (assign to every lsp server config)
        local capabilities = cmp_nvim_lsp.default_capabilities()

        -- Change the Diagnostic symbols in the sign column (gutter)
        vim.diagnostic.config({
            virtual_text = {
                prefix = "●", -- Show error message inline with icon
                spacing = 4,
                severity = { min = vim.diagnostic.severity.WARN }, -- Only show WARN and ERROR inline, hide INFO/HINT
            },
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = " ",
                    [vim.diagnostic.severity.WARN] = " ",
                    [vim.diagnostic.severity.HINT] = "󰠠 ",
                    [vim.diagnostic.severity.INFO] = " ",
                },
            },
            underline = {
                severity = { min = vim.diagnostic.severity.WARN }, -- Only underline WARN and ERROR
            },
            update_in_insert = false,
            severity_sort = true,
            float = {
                border = "rounded",
                source = "always", -- Show source of diagnostic
                header = "",
                prefix = "",
            },
        })

        -- Configure LSP servers using the new vim.lsp.config API
        -- Default configuration for all servers
        local default_config = {
            capabilities = capabilities,
        }

        -- Configure specific servers with custom settings
        vim.lsp.config.svelte = vim.tbl_extend("force", default_config, {
            on_attach = function(client, bufnr)
                vim.api.nvim_create_autocmd("BufWritePost", {
                    pattern = { "*.js", "*.ts" },
                    buffer = bufnr,
                    callback = function(ctx)
                        client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
                    end,
                })
            end,
        })

        vim.lsp.config.graphql = vim.tbl_extend("force", default_config, {
            filetypes = {
                "graphql",
                "gql",
                "svelte",
                "typescriptreact",
                "javascriptreact",
                "python",
                "cpp",
                "clangd",
            },
        })

        vim.lsp.config.emmet_ls = vim.tbl_extend("force", default_config, {
            filetypes = {
                "html",
                "typescriptreact",
                "javascriptreact",
                "css",
                "sass",
                "scss",
                "less",
                "svelte",
                "python",
                "cpp",
                "clangd",
            },
        })

        vim.lsp.config.lua_ls = vim.tbl_extend("force", default_config, {
            settings = {
                Lua = {
                    -- make the language server recognize "vim" global
                    diagnostics = {
                        globals = { "vim" },
                    },
                    completion = {
                        callSnippet = "Replace",
                    },
                },
            },
        })

        vim.lsp.config.pyright = vim.tbl_extend("force", default_config, {
            settings = {
                python = {
                    analysis = {
                        typeCheckingMode = "basic", -- "off", "basic", or "strict"
                        diagnosticMode = "openFilesOnly",
                        autoSearchPaths = true,
                        useLibraryCodeForTypes = true,
                        diagnosticSeverityOverrides = {
                            reportUnusedVariable = "warning",
                            reportUnusedImport = "none", -- Let ruff handle this
                            reportMissingTypeStubs = "none",
                            reportGeneralTypeIssues = "warning",
                            reportOptionalMemberAccess = "warning",
                        },
                    },
                },
            },
        })

        -- Set default config for servers that don't have custom configuration
        vim.lsp.config["*"] = default_config

        -- Restore original notify function
        vim.notify = original_notify
    end,
}
