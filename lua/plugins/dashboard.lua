return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      dashboard = {
        enabled = true,
        sections = {
          {
            section = "terminal",
            -- Use the ascii-image-converter with a width flag (‑W 150) to produce 150-column output
            cmd = "ascii-image-converter C:\\Users\\Aaron.Henderson1\\AppData\\Local\\nvim\\Howden.png -C -c -W 100",
            pane = 2,
            height = 20,
            width = 100, -- The container width for the ascii art; must match or exceed the converter's output
            indent = 0, -- No indent so the art starts at column 0
            align = "left", -- Force left alignment within the pane
            padding = 0, -- No extra padding on either side
          },
          { section = "keys", gap = 1, padding = 1, indent = 0, align = "left", pane = 1 },
          { section = "startup", indent = 0, align = "left", pane = 1 },
        },
      },
    },
  },
}
