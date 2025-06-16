return {
  {
    "xuhdev/vim-latex-live-preview",
    ft = { "tex", "latex" },
    config = function()
      -- Configure latex live preview settings
      vim.g.livepreview_previewer = "zathura" -- or "evince", "okular", etc.
      vim.g.livepreview_engine = "/usr/bin/pdflatex"   -- Use full path to avoid AppImage interference
      vim.g.livepreview_cursorhold_recompile = 0
      vim.g.livepreview_use_biber = 1
      
      -- Set Python interpreter (use system Python to avoid AppImage issues)
      vim.g.livepreview_python = "/usr/bin/python3"
      
      -- Set clean environment for LaTeX commands to avoid Cursor AppImage interference
      vim.g.livepreview_texinputs = ""
      
      vim.notify("LaTeX Live Preview: Configured with system LaTeX and Python", vim.log.levels.INFO)
    end,
  },
} 