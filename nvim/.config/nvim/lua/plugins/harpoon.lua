return 	-- =========================================
	-- HARPOON
	-- =========================================
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },

		config = function()
			require("harpoon"):setup()
		end,

		keys = {
			{
				"<leader>ha",
				function()
					require("harpoon"):list():add()
				end,
				desc = "Harpoon add file",
			},
			{
				"<leader>hc",
				function()
					require("harpoon"):list():clear()
				end,
				desc = "Harpoon clear",
			},

			{
				"<leader>hm",
				function()
					local harpoon = require("harpoon")
					harpoon.ui:toggle_quick_menu(harpoon:list())
				end,
				desc = "Harpoon menu",
			},

			-- File 1
			{
				"<leader>hh",
				function()
					require("harpoon"):list():select(1)
				end,
				desc = "Harpoon file 1",
			},

			-- File 2
			{
				"<leader>ht",
				function()
					require("harpoon"):list():select(2)
				end,
				desc = "Harpoon file 2",
			},

			-- File 3
			{
				"<leader>hn",
				function()
					require("harpoon"):list():select(3)
				end,
				desc = "Harpoon file 3",
			},

			-- File 4
			{
				"<leader>hs",
				function()
					require("harpoon"):list():select(4)
				end,
				desc = "Harpoon file 4",
			},

			-- Previous Harpoon file
			{
				"<leader>hk",
				function()
					require("harpoon"):list():prev()
				end,
				desc = "Harpoon previous",
			},

			-- Next Harpoon file
			{
				"<leader>hj",
				function()
					require("harpoon"):list():next()
				end,
				desc = "Harpoon next",
			},

			-- Move current entry up in Harpoon list
			{
				"<leader>hu",
				function()
					local list = require("harpoon"):list()
					local idx = list.config.current_index

					if idx and idx > 1 then
						list:move(idx, idx - 1)
					end
				end,
				desc = "Harpoon move entry up",
			},

			-- Move current entry down in Harpoon list
			{
				"<leader>hd",
				function()
					local list = require("harpoon"):list()
					local idx = list.config.current_index

					if idx and idx < #list.items then
						list:move(idx, idx + 1)
					end
				end,
				desc = "Harpoon move entry down",
			},
		},
	}
