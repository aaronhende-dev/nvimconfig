-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>e", function()
  require("mini.files").open(vim.fn.expand("%:p:h")) -- Opens the file's directory
end, { desc = "Open file in mini file" })

vim.keymap.set("n", "<leader>cb", function()
  local file = vim.fn.expand("%:p") -- Get full path of current file
  local filetype = vim.bo.filetype -- Detect file type
  local cmd

  -- Define run commands based on file type
  if filetype == "python" then
    cmd = "python3 " .. file
  elseif filetype == "javascript" then
    cmd = "node " .. file
  elseif filetype == "sh" then
    cmd = "bash " .. file
  else
    vim.notify("No run command defined for filetype: " .. filetype, vim.log.levels.ERROR)
    return
  end

  -- Open the terminal and execute the command
  require("toggleterm.terminal").Terminal:new({ cmd = cmd, direction = "horizontal" }):toggle()
end, { desc = "Run Current File in Terminal" })

-- Map Esc Esc to exit terminal mode
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.api.nvim_buf_set_keymap(0, "t", "<Esc><Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(0, "n", "q", ":q!<CR>", { noremap = true, silent = true }) -- 'q' in normal mode
  end,
})

-- ============================================================================
-- WRITING PLUGINS KEYBINDINGS (from OVIWrite integration)
-- ============================================================================

-- ┌─────────────────────────────────────────────────────────────────────────┐
-- │ ZEN MODE & DISTRACTION-FREE WRITING                                    │
-- └─────────────────────────────────────────────────────────────────────────┘
-- NOTE: Changed from <leader>zz to avoid potential conflicts
vim.keymap.set("n", "<leader>zm", "<cmd>ZenMode<cr>", { desc = "Toggle Zen Mode" })
vim.keymap.set("n", "<leader>zt", "<cmd>Twilight<cr>", { desc = "Toggle Twilight" })

-- ┌─────────────────────────────────────────────────────────────────────────┐
-- │ VIM-PENCIL (Prose Writing) - Using <leader>P for Prose                 │
-- └─────────────────────────────────────────────────────────────────────────┘
vim.keymap.set("n", "<leader>Ps", "<cmd>PencilSoft<cr>", { desc = "Pencil Soft Wrap" })
vim.keymap.set("n", "<leader>Ph", "<cmd>PencilHard<cr>", { desc = "Pencil Hard Wrap" })
vim.keymap.set("n", "<leader>Pt", "<cmd>PencilToggle<cr>", { desc = "Toggle Pencil" })
vim.keymap.set("n", "<leader>Po", "<cmd>PencilOff<cr>", { desc = "Pencil Off" })

-- ┌─────────────────────────────────────────────────────────────────────────┐
-- │ GRAMMAR CHECKING (vim-grammarous) - Using <leader>G to avoid git conflicts│
-- └─────────────────────────────────────────────────────────────────────────┘
vim.keymap.set("n", "<leader>Gc", "<cmd>GrammarousCheck<cr>", { desc = "Grammar Check" })
vim.keymap.set("n", "<leader>Gr", "<cmd>GrammarousReset<cr>", { desc = "Grammar Reset" })
vim.keymap.set("n", "<leader>Gn", "<Plug>(grammarous-move-to-next-error)", { desc = "Next Grammar Error" })
vim.keymap.set("n", "<leader>Gp", "<Plug>(grammarous-move-to-previous-error)", { desc = "Previous Grammar Error" })
vim.keymap.set("n", "<leader>Gf", "<Plug>(grammarous-fixit)", { desc = "Fix Grammar Error" })

-- ┌─────────────────────────────────────────────────────────────────────────┐
-- │ LATEX (VimTeX) - Using <leader>L for LaTeX to avoid diagnostics conflict│
-- └─────────────────────────────────────────────────────────────────────────┘
vim.keymap.set("n", "<leader>Ll", "<cmd>VimtexCompile<cr>", { desc = "LaTeX Compile" })
vim.keymap.set("n", "<leader>Lv", "<cmd>VimtexView<cr>", { desc = "LaTeX View PDF" })
vim.keymap.set("n", "<leader>Lc", "<cmd>VimtexClean<cr>", { desc = "LaTeX Clean" })
vim.keymap.set("n", "<leader>LC", "<cmd>VimtexCleanFull<cr>", { desc = "LaTeX Clean Full" })
vim.keymap.set("n", "<leader>Ls", "<cmd>VimtexStop<cr>", { desc = "LaTeX Stop" })
vim.keymap.set("n", "<leader>Lt", "<cmd>VimtexTocToggle<cr>", { desc = "LaTeX TOC Toggle" })
vim.keymap.set("n", "<leader>Le", "<cmd>VimtexErrors<cr>", { desc = "LaTeX Errors" })

-- LaTeX Live Preview
vim.keymap.set("n", "<leader>Lp", "<cmd>LLPStartPreview<cr>", { desc = "Start LaTeX Live Preview" })

-- ┌─────────────────────────────────────────────────────────────────────────┐
-- │ VIMWIKI                                                                 │
-- └─────────────────────────────────────────────────────────────────────────┘
vim.keymap.set("n", "<leader>vw", "<cmd>VimwikiIndex<cr>", { desc = "Wiki Index" })
vim.keymap.set("n", "<leader>vt", "<cmd>VimwikiTabIndex<cr>", { desc = "Wiki Tab Index" })
vim.keymap.set("n", "<leader>vs", "<cmd>VimwikiUISelect<cr>", { desc = "Wiki Select" })
vim.keymap.set("n", "<leader>vd", "<cmd>VimwikiDiaryIndex<cr>", { desc = "Wiki Diary Index" })
vim.keymap.set("n", "<leader>vn", "<cmd>VimwikiMakeDiaryNote<cr>", { desc = "Wiki New Diary Note" })
vim.keymap.set("n", "<leader>vg", "<cmd>VimwikiDiaryGenerateLinks<cr>", { desc = "Wiki Generate Diary Links" })

-- ┌─────────────────────────────────────────────────────────────────────────┐
-- │ ZETTELKASTEN (vim-zettel)                                              │
-- └─────────────────────────────────────────────────────────────────────────┘
vim.keymap.set("n", "<leader>zn", "<cmd>ZettelNew<cr>", { desc = "New Zettel" })
vim.keymap.set("n", "<leader>zo", "<cmd>ZettelOpen<cr>", { desc = "Open Zettel" })
vim.keymap.set("n", "<leader>zb", "<cmd>ZettelBackLinks<cr>", { desc = "Zettel Backlinks" })
vim.keymap.set("n", "<leader>zi", "<cmd>ZettelInsertNote<cr>", { desc = "Insert Zettel Link" })
vim.keymap.set("n", "<leader>zs", "<cmd>ZettelSearch<cr>", { desc = "Search Zettel" })
vim.keymap.set("n", "<leader>zy", "<cmd>ZettelYankName<cr>", { desc = "Yank Zettel Name" })



-- ┌─────────────────────────────────────────────────────────────────────────┐
-- │ IMAGE PASTING (img-clip) - Changed from <leader>p to avoid conflict    │
-- └─────────────────────────────────────────────────────────────────────────┘
-- NOTE: <leader>p conflicts with yanky.nvim, using <leader>pi instead
vim.keymap.set("n", "<leader>pi", "<cmd>PasteImage<cr>", { desc = "Paste clipboard image" })

-- ┌─────────────────────────────────────────────────────────────────────────┐
-- │ WRITING-SPECIFIC UTILITIES                                              │
-- └─────────────────────────────────────────────────────────────────────────┘

-- Quick toggle for spell checking (no conflict - LazyVim has same binding)
vim.keymap.set("n", "<leader>us", function()
  vim.opt.spell = not vim.opt.spell:get()
  vim.notify("Spell check: " .. (vim.opt.spell:get() and "ON" or "OFF"))
end, { desc = "Toggle Spell Check" })

-- Word count for writers
vim.keymap.set("n", "<leader>Pc", function()
  local word_count = vim.fn.wordcount()
  local msg = string.format("Words: %d | Characters: %d | Lines: %d", 
    word_count.words or 0, 
    word_count.chars or 0, 
    vim.fn.line('$'))
  vim.notify(msg, vim.log.levels.INFO)
end, { desc = "Word Count" })

-- Toggle line numbers - Changed from <leader>un to avoid conflict with notifications
vim.keymap.set("n", "<leader>uN", function()
  vim.opt.number = not vim.opt.number:get()
  vim.opt.relativenumber = not vim.opt.relativenumber:get()
  vim.notify("Line numbers: " .. (vim.opt.number:get() and "ON" or "OFF"))
end, { desc = "Toggle Line Numbers" })

-- Toggle conceallevel (no conflict - LazyVim has same binding)
vim.keymap.set("n", "<leader>uc", function()
  local current = vim.opt.conceallevel:get()
  local new_level = current == 0 and 2 or 0
  vim.opt.conceallevel = new_level
  vim.notify("Conceal level: " .. new_level)
end, { desc = "Toggle Conceal Level" })
