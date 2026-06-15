return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        direction = "horizontal",
        size = 10,
        start_in_insert = true,
        persist_mode = true,
        close_on_exit = false,
      })

      local Terminal = require("toggleterm.terminal").Terminal

      local run_term = Terminal:new({
        direction = "horizontal",
        size = 10,
        close_on_exit = false,
        hidden = true,
      })

      local function get_cmd()
        local ft = vim.bo.filetype

        if ft == "python" then
          return "python3 " .. vim.fn.expand("%")
        elseif ft == "c" then
          return "gcc " .. vim.fn.expand("%") .. " -o out && ./out"
        elseif ft == "sh" then
          return "bash " .. vim.fn.expand("%")
        elseif ft == "lua" then
          vim.cmd("source %")
          return nil
        end

        return nil
      end

      vim.keymap.set("n", "<leader>r", function()
        local cmd = get_cmd()
        if not cmd then return end

        run_term:toggle()
        run_term:send(cmd, true)
      end, { desc = "Run file (toggleterm)" })
    end,
  },
}
