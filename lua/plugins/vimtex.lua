return {
  {
    "lervag/vimtex",
    ft = { "tex", "latex" },
    config = function()
      -- Configure vimtex settings
      vim.g.vimtex_view_method = "zathura" -- or "skim", "evince", "okular"
      vim.g.vimtex_compiler_method = "latexmk"
      vim.g.vimtex_compiler_latexmk = {
        build_dir = "",
        callback = 1,
        continuous = 1,
        executable = "/usr/bin/latexmk", -- Use full path to avoid AppImage interference
        hooks = {},
        options = {
          "-verbose",
          "-file-line-error",
          "-synctex=1",
          "-interaction=nonstopmode",
          "-pdflatex=/usr/bin/pdflatex", -- Explicitly set pdflatex path
        },
      }
      
      -- Disable overfull/underfull \hbox and all package warnings
      vim.g.vimtex_quickfix_ignore_filters = {
        "Overfull \\hbox",
        "Underfull \\hbox",
        "Package hyperref Warning",
        "Package rerunfilecheck Warning",
      }
      
      -- Enable folding
      vim.g.vimtex_fold_enabled = 1
      vim.g.vimtex_fold_manual = 1
      
      -- Concealment settings
      vim.g.vimtex_syntax_conceal = {
        accents = 1,
        ligatures = 1,
        cites = 1,
        fancy = 1,
        spacing = 1,
        greek = 1,
        math_bounds = 1,
        math_delimiters = 1,
        math_fracs = 1,
        math_super_sub = 1,
        math_symbols = 1,
        sections = 0,
        styles = 1,
      }
    end,
  },
} 