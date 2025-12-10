return {
  "williamboman/mason.nvim",
  lazy = false,
  priority = 100,
  dependencies = {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
        check_outdated_packages_on_open = true, -- Auto-check for updates when opening Mason
      },
      max_concurrent_installers = 4,
    })

    -- Delay mason-tool-installer setup to ensure mason-lspconfig loads first
    vim.schedule(function()
      local mason_tool_installer = require("mason-tool-installer")
      mason_tool_installer.setup({
      ensure_installed = {
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        "isort", -- python formatter
        "black", -- python formatter
        "pylint",
        "eslint_d",
      },
      auto_update = false, -- Don't auto-update, let user decide
      run_on_start = true, -- Check for missing packages on startup
      })
    end)

    -- Custom command to check for updates and show them
    vim.api.nvim_create_user_command("MasonCheckUpdates", function()
      -- Temporarily enable update checking
      local registry = require("mason-registry")
      registry.refresh(function()
        vim.cmd("Mason")
        vim.notify("Checking for package updates... Press 'U' to update all or 'u' on individual packages", vim.log.levels.INFO)
      end)
    end, {})
  end,
}
