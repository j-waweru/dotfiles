return {
	{
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
					"codelldb",
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
					console = "integratedTerminal",
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

			dap.configurations.python = {
				{
					type = "python",
					request = "launch",
					name = "Launch file",
					program = "${file}",
					console = "integratedTerminal",
					pythonPath = function()
						local cwd = vim.fn.getcwd()

						if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
							return cwd .. "/venv/bin/python"
						elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
							return cwd .. "/.venv/bin/python"
						else
							return "/usr/bin/python3"
						end
					end,
				},
			}

			------------------------------------------------------------------
			-- Rust
			------------------------------------------------------------------

			dap.adapters.codelldb = {
				type = "server",
				port = "${port}",
				executable = {
					command = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/codelldb",
					args = { "--port", "${port}" },
				},
			}

			dap.configurations.rust = {
				{
					name = "Launch Rust executable",
					type = "codelldb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
					console = "integratedTerminal",
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
			map("n", "<leader>dR", function()
				dapui.close({})
				dapui.open({})
			end, { desc = "Reload DAP UI layout" })
		end,
	},

	{
		"mrcjkb/rustaceanvim",
		version = "^5", -- Recommended version rule
		lazy = false, -- Already lazy-loads internally
		config = function()
			local mason_registry = require("mason-registry")
			local codelldb = mason_registry.get_package("codelldb")
			local extension_path = codelldb:get_install_path() .. "/extension/"
			local codelldb_path = extension_path .. "adapter/codelldb"

			-- Automatically handle platform extension for liblldb
			local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
			if vim.fn.has("mac") == 1 then
				liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"
			end

			local cfg = require("rustaceanvim.config")

			vim.g.rustaceanvim = {
				server = {
					on_attach = function(_, bufnr)
						local map = function(lhs, rhs, desc)
							vim.keymap.set("n", lhs, rhs, { buffer = bufnr, desc = desc })
						end
						-- Rust-specific debugging keymaps powered by rustaceanvim
						map("<leader>dr", function()
							vim.cmd.RustLsp("debug")
						end, "Rust Debug")
						map("<leader>drt", function()
							vim.cmd.RustLsp("testables")
						end, "Rust Testables")
					end,
				},
				dap = {
					adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
				},
			}
		end,
	},
}
