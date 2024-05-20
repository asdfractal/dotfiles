local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', builtin.grep_string, {})
vim.keymap.set('n', '<leader>pa', builtin.live_grep, {})
-- vim.keymap.set('n', '<leader>ps', function()
--     builtin.grep_string({ search = vim.fn.input("Grep > ") });
-- end)

require('telescope').setup {
    extensions = {
        fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
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
        }
    }
}

require('telescope').load_extension('fzf')
require('telescope').load_extension('advanced_git_search')
