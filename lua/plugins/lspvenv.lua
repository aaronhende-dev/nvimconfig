return {
  {
    "jglasovic/venv-lsp.nvim",
    config = function()
      require("venv-lsp").setup({
        auto_refresh = true, -- Refresh venv when opening Python files
        update_env = true, -- Ensure Neovim's Python environment is updated
        notify_user_on_activate = true, -- Show message when venv is activated
        log_level = "info", -- Logging level ("debug", "info", "warn", "error")
        venv_searche_paths = { "venv", ".venv", "env", ".env" }, -- Directories to search for venvs
      })
    end,
    dependencies = { "neovim/nvim-lspconfig" },
    event = "VeryLazy",
  },
}
