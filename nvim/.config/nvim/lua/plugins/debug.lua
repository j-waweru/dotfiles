return {
	"mfussenegger/nvim-dap",
	event = "VeryLazy",

	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"jay-babu/mason-nvim-dap.nvim",
		"theHamsta/nvim-dap-virtual-text",
	},

	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		local mason_dap = require("mason-nvim-dap")

		require("nvim-dap-virtual-text").setup()

		dapui.setup()

		mason_dap.setup({
			ensure_installed = {
				"cppdbg",
				"python",
				"node2",
			},

			automatic_installation = true,

			handlers = {
				function(config)
					require("mason-nvim-dap").default_setup(config)
				end,
			},
		})

		------------------------------------------------------------------
		-- C / C++
		------------------------------------------------------------------

		dap.configurations.cpp = {
			{
				name = "Launch file",
				type = "cppdbg",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopAtEntry = false,
				MIMode = "gdb",
			},
		}

		dap.configurations.c = dap.configurations.cpp

		------------------------------------------------------------------
		-- Python
		------------------------------------------------------------------

		-- 	dap.configurations.python = {
		-- 		{
		-- 			type = "python",
		-- 			request = "launch",
		-- 			name = "Launch file",
		-- 			program = "${file}",
		-- 			pythonPath = function()
		-- 			local cwd = vim.fn.getcwd()
		--
		-- 			if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
		-- 				return cwd .. "/venv/bin/python"
		-- 				elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
		-- 					return cwd .. "/.venv/bin/python"
		-- 					else
		-- 						return "/usr/bin/python3"
		-- 						end
		-- 						end,
		-- 		},
		-- 	}
		dap.configurations.python = {
			{
				type = "python",
				request = "launch",
				name = "KPL",

				module = "kpl.main",

				cwd = "${workspaceFolder}",

				justMyCode = false,

				pythonPath = function()
					local cwd = vim.fn.getcwd()

					if vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
						return cwd .. "/.venv/bin/python"
					end

					return "python3"
				end,
			},
		}

		------------------------------------------------------------------
		-- JavaScript
		------------------------------------------------------------------

		dap.configurations.javascript = {
			{
				name = "Launch",
				type = "node2",
				request = "launch",
				program = "${file}",
				cwd = vim.fn.getcwd(),
				sourceMaps = true,
				protocol = "inspector",
				console = "integratedTerminal",
			},
			{
				name = "Attach",
				type = "node2",
				request = "attach",
				processId = require("dap.utils").pick_process,
			},
		}

		dap.configurations.typescript = dap.configurations.javascript

		------------------------------------------------------------------
		-- Signs
		------------------------------------------------------------------

		vim.fn.sign_define("DapBreakpoint", {
			text = "●",
			texthl = "DiagnosticSignError",
		})

		------------------------------------------------------------------
		-- Auto UI
		------------------------------------------------------------------

		dap.listeners.before.attach.dapui = function()
			dapui.open()
		end

		dap.listeners.before.launch.dapui = function()
			dapui.open()
		end

		dap.listeners.before.event_terminated.dapui = function()
			dapui.close()
		end

		dap.listeners.before.event_exited.dapui = function()
			dapui.close()
		end

		------------------------------------------------------------------
		-- Keymaps
		------------------------------------------------------------------

		local map = vim.keymap.set

		map("n", "<leader>dt", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
		map("n", "<leader>dc", dap.continue, { desc = "Continue" })
		map("n", "<leader>di", dap.step_into, { desc = "Step Into" })
		map("n", "<leader>do", dap.step_over, { desc = "Step Over" })
		map("n", "<leader>dO", dap.step_out, { desc = "Step Out" })
		map("n", "<leader>dr", dap.repl.open, { desc = "Open REPL" })
		map("n", "<leader>dl", dap.run_last, { desc = "Run Last" })
		map("n", "<leader>dq", dap.terminate, { desc = "Terminate" })

		-- DAP UI
		map("n", "<leader>du", dapui.toggle, { desc = "Toggle DAP UI" })
		map("n", "<leader>dU", dapui.open, { desc = "Open DAP UI" })
		map("n", "<leader>dx", dapui.close, { desc = "Close DAP UI" })
	end,
}
