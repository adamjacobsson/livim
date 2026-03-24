return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "mfussenegger/nvim-dap-python",
            "nvim-neotest/nvim-nio",
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            dapui.setup({
                -- Sidebar only shows variables/scopes plus watches.
                layouts = {
                    {
                        elements = {
                            -- Watches should appear at the top of the sidebar.
                            { id = "watches", size = 0.35 },
                            { id = "scopes", size = 0.65 },
                        },
                        size = 40,
                        position = "left",
                    },
                    {
                        -- Keep the terminal/output panes in the tray.
                        elements = { "repl", "console" },
                        size = 12,
                        position = "bottom",
                    },
                },
                -- Show play/step controls above the REPL tray.
                controls = {
                    enabled = true,
                    element = "repl",
                },
            })
            vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", numhl = "" })
            vim.fn.sign_define("DapStopped", { text = "", texthl = "DiagnosticSignWarn", numhl = "" })
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end

            local function python_path()
                local venv = vim.env.VIRTUAL_ENV
                if venv and venv ~= "" then
                    return venv .. "/bin/python"
                end

                local python3 = vim.fn.exepath("python3")
                if python3 ~= nil and python3 ~= "" then
                    return python3
                end

                local python = vim.fn.exepath("python")
                if python ~= nil and python ~= "" then
                    return python
                end

                return "python3"
            end

            require("dap-python").setup(python_path())

            local function map(mode, lhs, rhs, desc)
                vim.keymap.set(mode, lhs, rhs, { desc = desc, silent = true })
            end

            map("n", "<F5>", dap.continue, "DAP Continue")
            map("n", "<F10>", dap.step_over, "DAP Step Over")
            map("n", "<F11>", dap.step_into, "DAP Step Into")
            map("n", "<F12>", dap.step_out, "DAP Step Out")
            map("n", "<leader>db", dap.toggle_breakpoint, "DAP Toggle Breakpoint")
            map("n", "<leader>dB", function()
                dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
            end, "DAP Conditional Breakpoint")
            map("n", "<leader>dL", function()
                dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
            end, "DAP Log Point")
            map("n", "<leader>dl", dap.run_last, "DAP Run Last")
            map("n", "<leader>dr", dap.repl.toggle, "DAP Toggle REPL")
            map({ "n", "v" }, "<leader>de", function()
                dapui.eval()
            end, "DAP Evaluate")
            map("n", "<leader>du", dapui.toggle, "DAP Toggle UI")
            map("n", "<leader>dC", function()
                dap.clear_breakpoints()
            end, "DAP Clear Breakpoints")
            map("n", "<leader>dx", dap.terminate, "DAP Terminate")
        end,
    },
}
