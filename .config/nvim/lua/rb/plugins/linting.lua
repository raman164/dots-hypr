return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local lint = require("lint")

        -- Configure ruff to ignore common annoying rules
        lint.linters.ruff = require("lint").linters.ruff
        lint.linters.ruff.args = {
            "check",
            "--force-exclude",
            "--quiet",
            "--stdin-filename",
            function() return vim.api.nvim_buf_get_name(0) end,
            "--ignore", "E501", -- line too long
            "--ignore", "E402", -- module import not at top
            "--ignore", "F401", -- imported but unused
            "--no-fix",
            "--output-format", "json",
            "-",
        }

        lint.linters_by_ft = {
            javascript = { "eslint_d" },
            typescript = { "eslint_d" },
            javascriptreact = { "eslint_d" },
            typescriptreact = { "eslint_d" },
            svelte = { "eslint_d" },
            python = { "ruff" },
            c = { "cpplint" },
            cpp = { "cpplint" },
        }

        local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            group = lint_augroup,
            callback = function()
                lint.try_lint()
            end,
        })

        vim.keymap.set("n", "<leader>ll", function()
            lint.try_lint()
        end, { desc = "Trigger linting for current file" })
    end,
}
