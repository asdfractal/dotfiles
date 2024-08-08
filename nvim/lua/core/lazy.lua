local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    -- Find things
    'junegunn/fzf.vim',
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' },
    },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    { 'nvim-treesitter/nvim-treesitter',          build = ':TSUpdate' },
    'nvim-treesitter/nvim-treesitter-context',

    {
        "aaronhallaert/advanced-git-search.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "tpope/vim-fugitive",
            "tpope/vim-rhubarb",
        },
        config = function()

        end,
    },
    {
        'asdfractal/wilder.nvim',
        config = function()
        end,
        -- rocks = { 'prec2' }
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
        "nvim-pack/nvim-spectre",
    },
    "wsdjeg/vim-fetch",

    -- LSP/Language
    'nvimtools/none-ls.nvim',
    {
        "williamboman/mason.nvim", build = ':MasonUpdate',
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        },
    },
    'ray-x/go.nvim',
    { 'codota/tabnine-nvim',   build = "./dl_binaries.sh" },

    "jay-babu/mason-nvim-dap.nvim",
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    },
    {
        'zadirion/Unreal.nvim',
        dependencies =
        {
            "tpope/vim-dispatch",
        },
    },

    --
    'ojroques/nvim-hardline',
    'mbbill/undotree',
    'tpope/vim-surround',
    { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end },
    'airblade/vim-gitgutter',
    'sindrets/diffview.nvim',
    'Aasim-A/scrollEOF.nvim',

    -- preview markdown
    -- {"ellisonleao/glow.nvim", config = true, cmd = "Glow"},

    -- Theme/visual
    'eandrju/cellular-automaton.nvim',
    {
        'asdfractal/oceanic-next-vim',
        name = 'oceanicnext',
        config = function()
            vim.cmd('let g:oceanic_transparent_bg = 0')
            vim.cmd('colorscheme oceanicnext')
        end
    },
})
