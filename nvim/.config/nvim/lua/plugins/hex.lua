return {
  "RaafatTurki/hex.nvim",
  -- Lazy load on hex commands or binary filetypes
  cmd = { "HexDump", "HexAssemble", "HexToggle" },
  ft = { "bin", "hex", "exe", "out" },
  config = function()
    require("hex").setup({
      -- Assembles automatically on save (:w) and dumps on read
      hooks = {
        -- You can customize behavior here if needed
      }
    })
  end,
}

