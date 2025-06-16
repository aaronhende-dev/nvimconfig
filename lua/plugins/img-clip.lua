return {
  {
    "HakonHarnes/img-clip.nvim",
    event = "VeryLazy",
    opts = {
      default = {
        dir_path = "assets", -- directory path to save images to, can be relative (cwd or current file) or absolute
        file_name = "%Y-%m-%d-%H-%M-%S", -- file name format (see lua.org/pil/22.1.html)
        url_encode_path = false, -- encode spaces and special characters in file path
        use_absolute_path = false, -- expands dir_path to an absolute path
        prompt_for_file_name = true, -- ask user for file name before saving, leave empty to use default
        show_dir_path_in_prompt = false, -- show dir_path in prompt when prompting for file name
        use_cursor_in_template = true, -- jump to cursor position in template after pasting
        insert_mode_after_paste = true, -- enter insert mode after pasting the markup code
        relative_to_current_file = false, -- make dir_path relative to current file rather than the cwd
        template = "$FILE_PATH", -- default template
      },
      
      -- file-type specific options
      filetypes = {
        markdown = {
          url_encode_path = true,
          template = "![$CURSOR]($FILE_PATH)",
        },
        
        html = {
          template = '<img src="$FILE_PATH" alt="$CURSOR">',
        },
        
        tex = {
          template = "\\begin{figure}[h]\n  \\centering\n  \\includegraphics[width=0.8\\textwidth]{$FILE_PATH}\n  \\caption{$CURSOR}\n  \\label{fig:$LABEL}\n\\end{figure}",
        },
        
        typst = {
          template = "#figure(\n  image(\"$FILE_PATH\", width: 80%),\n  caption: [$CURSOR],\n) <fig-$LABEL>",
        },
        
        rst = {
          template = ".. image:: $FILE_PATH\n   :alt: $CURSOR\n   :width: 80%",
        },
        
        asciidoc = {
          template = 'image::$FILE_PATH[width=80%, alt="$CURSOR"]',
        },
        
        org = {
          template = "#+BEGIN_FIGURE\n[[file:$FILE_PATH]]\n#+CAPTION: $CURSOR\n#+NAME: fig:$LABEL\n#+END_FIGURE",
        },
        
        vimwiki = {
          template = '{{local:$FILE_PATH|$CURSOR}}',
        },
      },
    },
    keys = {
      -- Changed from <leader>p to avoid conflict with yanky.nvim
      { "<leader>pi", "<cmd>PasteImage<cr>", desc = "Paste clipboard image" },
    },
  },
} 