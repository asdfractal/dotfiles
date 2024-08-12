return {
    "junegunn/fzf.vim",

    {
        "aaronhallaert/advanced-git-search.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "tpope/vim-fugitive",
            "tpope/vim-rhubarb",
        },
        config = function() end,
    },

    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
                cond = function()
                    return vim.fn.executable("make") == 1
                end,
            },
            { "nvim-telescope/telescope-ui-select.nvim" },
            { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
        },

        config = function()
            require("telescope").setup({
                extensions = {
                    fzf = {
                        fuzzy = true, -- false will only do exact matching
                        override_generic_sorter = true, -- override the generic sorter
                        override_file_sorter = true, -- override the file sorter
                        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
                        -- the default case_mode is "smart_case"
                    },
                    advanced_git_search = {
                        -- Fugitive or diffview
                        diff_plugin = "fugitive",
                        -- Customize git in previewer
                        -- e.g. flags such as { "--no-pager" }, or { "-c", "delta.side-by-side=false" }
                        git_flags = {},
                        -- Customize git diff in previewer
                        -- e.g. flags such as { "--raw" }
                        git_diff_flags = {},
                        -- Show builtin git pickers when executing "show_custom_functions" or :AdvancedGitSearch
                        show_builtin_git_pickers = false,
                    },
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown(),
                    },
                },
            })
            pcall(require("telescope").load_extension, "fzf")
            pcall(require("telescope").load_extension, "ui-select")

            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>ph", builtin.help_tags, { desc = "[S]earch [H]elp" })
            vim.keymap.set("n", "<leader>pk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
            vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
            vim.keymap.set("n", "<C-p>", builtin.git_files, {})
            vim.keymap.set("n", "<leader>ps", builtin.grep_string, {})
            --  See `:help telescope.builtin.live_grep()` for information about particular keys
            vim.keymap.set("n", "<leader>pa", builtin.live_grep, {})
            vim.keymap.set("n", "<leader>pd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
            vim.keymap.set("n", "<leader>pws", function()
                local word = vim.fn.expand("<cword>")
                builtin.grep_string({ search = word })
            end)
            vim.keymap.set("n", "<leader>pWs", function()
                local word = vim.fn.expand("<cWORD>")
                builtin.grep_string({ search = word })
            end)
            vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})
        end,
    },

    {
        "asdfractal/wilder.nvim",
        config = function()
            local wilder = require("wilder")
            wilder.setup({ modes = { ":", "/", "?" } })

            wilder.set_option("pipeline", {
                wilder.branch(
                    wilder.cmdline_pipeline({
                        fuzzy = 1,
                        set_pcre2_pattern = 1,
                    }),
                    wilder.python_search_pipeline({
                        pattern = "fuzzy",
                    })
                ),
            })
        end,

        -- local highlighters = {
        --     wilder.pcre2_highlighter(),
        --     wilder.basic_highlighter(),
        -- }

        -- wilder.set_option('renderer', wilder.renderer_mux({
        --     [':'] = wilder.popupmenu_renderer({
        --         highlighter = highlighters,
        --     }),
        --     ['/'] = wilder.wildmenu_renderer({
        --         highlighter = highlighters,
        --     }),
        -- }))
        -- rocks = { 'prec2' }
    },

    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local harpoon = require("harpoon")

            harpoon:setup()

            -- basic telescope configuration
            -- local conf = require("telescope.config").values
            -- local function toggle_telescope(harpoon_files)
            --     local file_paths = {}
            --     for _, item in ipairs(harpoon_files.items) do
            --         table.insert(file_paths, item.value)
            --     end
            --
            --     require("telescope.pickers").new({}, {
            --         prompt_title = "Harpoon",
            --         finder = require("telescope.finders").new_table({
            --             results = file_paths,
            --         }),
            --         previewer = conf.file_previewer({}),
            --         sorter = conf.generic_sorter({}),
            --     }):find()
            -- end
            -- vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
            --     { desc = "Open harpoon window" })

            vim.keymap.set("n", "<leader>a", function()
                harpoon:list():add()
            end)
            vim.keymap.set("n", "<C-e>", function()
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end)
            vim.keymap.set("n", "<leader>1", function()
                harpoon:list():select(1)
            end)
            vim.keymap.set("n", "<leader>2", function()
                harpoon:list():select(2)
            end)
            vim.keymap.set("n", "<leader>3", function()
                harpoon:list():select(3)
            end)
            vim.keymap.set("n", "<leader>4", function()
                harpoon:list():select(4)
            end)
            vim.keymap.set("n", "<leader>5", function()
                harpoon:list():select(5)
            end)
            vim.keymap.set("n", "<leader>6", function()
                harpoon:list():select(6)
            end)
            vim.keymap.set("n", "<C-q>", function()
                harpoon:list():next()
            end)
            vim.keymap.set("n", "<C-w>", function()
                harpoon:list():prev()
            end)
            -- vim.keymap.set("n", "<leader><C-h>", function() harpoon:list():replace_at(1) end)
            -- vim.keymap.set("n", "<leader><C-t>", function() harpoon:list():replace_at(2) end)
            -- vim.keymap.set("n", "<leader><C-n>", function() harpoon:list():replace_at(3) end)
            -- vim.keymap.set("n", "<leader><C-s>", function() harpoon:list():replace_at(4) end)
        end,
    },

    "nvim-pack/nvim-spectre",
    "wsdjeg/vim-fetch",
    "Aasim-A/scrollEOF.nvim",
}
