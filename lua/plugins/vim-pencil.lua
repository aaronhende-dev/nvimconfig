return {
  {
    "reedes/vim-pencil",
    ft = { "markdown", "text", "tex", "latex", "org", "fountain" },
    config = function()
      -- Configure pencil settings
      vim.g["pencil#wrapModeDefault"] = "soft" -- 'hard' or 'soft'
      vim.g["pencil#textwidth"] = 74
      vim.g["pencil#joinspaces"] = 0
      vim.g["pencil#cursorwrap"] = 1
      vim.g["pencil#conceallevel"] = 3
      vim.g["pencil#concealcursor"] = "c"
      vim.g["pencil#softDetectSample"] = 20
      vim.g["pencil#softDetectThreshold"] = 130
      
      -- Auto-enable pencil for writing filetypes
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "markdown", "text", "tex", "latex", "org", "fountain" },
        callback = function()
          vim.cmd("PencilSoft")
        end,
      })
    end,
  },
} 