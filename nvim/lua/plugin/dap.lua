return {
    "jay-babu/mason-nvim-dap.nvim",

    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
        config = function()
            require("dapui").setup()

            vim.keymap.set("n", "<leader>dus", function()
                require("dapui").toggle()
            end)
        end,
    },

    {
        "leoluz/nvim-dap-go",
        ft = "go",
        dependencies = { "mfussenegger/nvim-dap" },
        config = function()
            require("dap-go").setup()

            vim.keymap.set("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>")
            vim.keymap.set("n", "<leader>dr", "<cmd> DapContinue <CR>")
            vim.keymap.set("n", "<leader>dso", "<cmd> DapStepOver <CR>")
            vim.keymap.set("n", "<leader>dsi", "<cmd> DapStepInto <CR>")
            vim.keymap.set("n", "<leader>dgt", function()
                require("dap-go").debug_test()
            end)
            vim.keymap.set("n", "<leader>dgl", function()
                require("dap-go").debug_last()
            end)
        end,
    },
}
