return {
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      -- header (aesthetic ASCII)
      dashboard.section.header.val = {
        " ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
        " ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
        " ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
        " ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
        " ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
        " ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
        "",
        "            NEOVIM · DASHBOARD",
      }

      -- buttons (telescope + workflow)
      dashboard.section.buttons.val = {
        dashboard.button("f", " Find File", ":Telescope find_files<CR>"),
        dashboard.button("g", " Live Grep", ":Telescope live_grep<CR>"),
        dashboard.button("r", " Recent Files", ":Telescope oldfiles<CR>"),
        dashboard.button("e", " Explorer", ":Oil<CR>"),
        dashboard.button("u", " Update Plugins", ":Lazy update<CR>"),
        dashboard.button("q", " Quit", ":qa<CR>"),
      }

      -- footer
      dashboard.section.footer.val = "fast setup · clean workflow · no noise"

      -- layout
      dashboard.config.layout = {
        { type = "padding", val = 2 },
        dashboard.section.header,
        { type = "padding", val = 2 },
        dashboard.section.buttons,
        { type = "padding", val = 1 },
        dashboard.section.footer,
      }

      alpha.setup(dashboard.config)

      -- hide dashboard when opening file
      vim.api.nvim_create_autocmd("BufEnter", {
        callback = function()
          if vim.bo.filetype ~= "alpha" and vim.fn.argc() > 0 then
            pcall(vim.cmd, "AlphaClose")
          end
        end,
      })
    end,
  },
}
