return {
  {
    "rhysd/vim-grammarous",
    ft = { "markdown", "text", "tex", "latex", "org" },
    config = function()
      -- Configure grammarous settings
      vim.g["grammarous#languagetool_cmd"] = "languagetool"
      vim.g["grammarous#show_first_error"] = 1
      vim.g["grammarous#jump_to_first_error"] = 1
      vim.g["grammarous#use_vim_spelllang"] = 1
      
      -- Default language (can be overridden)
      vim.g["grammarous#default_comments_only_filetypes"] = {
        ["*"] = 1,
        help = 0,
        markdown = 0,
        text = 0,
      }
    end,
  },
} 