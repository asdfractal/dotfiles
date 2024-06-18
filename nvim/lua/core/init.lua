require("core.remap")
require("core.set")
require("core.lazy")
require('tabnine').setup({
    disable_auto_comment = true,
    -- accept_keymap = "<Tab>",
    accept_keymap = "<F9>",
    dismiss_keymap = "<C-]>",
    debounce_ms = 800,
    suggestion_color = { gui = "#808080", cterm = 244 },
    exclude_filetypes = { "TelescopePrompt", "NvimTree" },
    log_file_path = nil, -- absolute path to Tabnine log file
})

vim.opt.termguicolors = true
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.g.omni_sql_default_compl_type = 'syntax'
-- vim.g.python3_host_prog = '/home/linuxbrew/.linuxbrew/bin/python3'
