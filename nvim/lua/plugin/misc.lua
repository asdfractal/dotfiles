return {
    {
        "mbbill/undotree",

        config = function()
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
        end,
    },

    "numToStr/Comment.nvim",
    "tpope/vim-surround",
}
