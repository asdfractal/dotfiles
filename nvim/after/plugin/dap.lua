local dap = require('dap')
-- require('dap').set_log_level('INFO')
local dapui = require('dapui')
local mdap = require('mason-nvim-dap')

mdap.setup({
    ensure_installed = { "codelldb" }
})

dap.set_log_level('INFO')

dap.configurations.cpp = {
    {
        name = "Debug",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        -- cwd = '${workspaceFolder}',
        -- stopOnEntry = false,
        -- program = "${file}",
    },
}

dap.adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = {
        command = "/home/asdfractal/.local/share/nvim/mason/bin/codelldb",
        args = { "--port", "${port}" },
    }
}

dapui.setup({
    icons = { expanded = "▾", collapsed = "▸" },
    mappings = {
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t",
    },
    expand_lines = vim.fn.has("nvim-0.7"),
    layouts = {
        {
            elements = {
                "scopes",
            },
            size = 0.3,
            position = "right"
        },
        {
            elements = {
                "repl",
                "breakpoints"
            },
            size = 0.3,
            position = "bottom",
        },
    },
    floating = {
        max_height = nil,
        max_width = nil,
        border = "single",
        mappings = {
            close = { "q", "<Esc>" },
        },
    },
    windows = { indent = 1 },
    render = {
        max_type_length = nil,
    },
})

-- vim.fn.sign_define('DapBreakpoint', { text = '🐞' })
--
-- -- Start debugging session
-- vim.keymap.set("n", "<localleader>ds", function()
--     dap.continue()
--     ui.toggle({})
--     vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>=", false, true, true), "n", false) -- Spaces buffers evenly
-- end)
--
-- -- Set breakpoints, get variable values, step into/out of functions, etc.
-- vim.keymap.set("n", "<localleader>dl", require("dap.ui.widgets").hover)
-- vim.keymap.set("n", "<localleader>dc", dap.continue)
-- vim.keymap.set("n", "<localleader>db", dap.toggle_breakpoint)
-- vim.keymap.set("n", "<localleader>dn", dap.step_over)
-- vim.keymap.set("n", "<localleader>di", dap.step_into)
-- vim.keymap.set("n", "<localleader>do", dap.step_out)
-- vim.keymap.set("n", "<localleader>dC", function()
--     dap.clear_breakpoints()
--     require("notify")("Breakpoints cleared", "warn")
-- end)
--
-- -- Close debugger and clear breakpoints
-- vim.keymap.set("n", "<localleader>de", function()
--     dap.clear_breakpoints()
--     ui.toggle({})
--     dap.terminate()
--     vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>=", false, true, true), "n", false)
--     require("notify")("Debugger session ended", "warn")
-- end)

-- dap.listeners.before.attach.dapui_config = function()
--     dapui.open()
-- end
-- dap.listeners.before.launch.dapui_config = function()
--     dapui.open()
-- end
-- dap.listeners.before.event_terminated.dapui_config = function()
--     dapui.close()
-- end
