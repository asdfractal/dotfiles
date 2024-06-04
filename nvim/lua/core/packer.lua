-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Find things
    use {
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use('nvim-treesitter/nvim-treesitter-context')

    use({
        "aaronhallaert/advanced-git-search.nvim",
        config = function()

        end,
        requires = {
            "nvim-telescope/telescope.nvim",
            "tpope/vim-fugitive",
            "tpope/vim-rhubarb",
        },
    })

    use {
        'gelguy/wilder.nvim',
        config = function()
        end,
        -- rocks = { 'prec2' }
    }

    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { { "nvim-lua/plenary.nvim" } }
    }

    --

    -- LSP/Language
    use({ 'nvimtools/none-ls.nvim' })
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {
                -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    }
    use 'ray-x/go.nvim'
    use { 'codota/tabnine-nvim', run = "./dl_binaries.sh" }
    use 'mfussenegger/nvim-dap'
    use {
        'jay-babu/mason-nvim-dap.nvim',
        requires = {
            { 'williamboman/mason.nvim' },
            { 'mfussenegger/nvim-dap' },
        }
    }
    use { 'rcarriga/nvim-dap-ui',
        requires = {
            { 'mfussenegger/nvim-dap' },
            { 'nvim-neotest/nvim-nio' },
        }
    }
    use { 'zadirion/Unreal.nvim',
        requires =
        {
            { "tpope/vim-dispatch" }
        }
    }
    --

    use('ojroques/nvim-hardline')
    use('mbbill/undotree')
    use('tpope/vim-surround')
    use { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end }
    use('airblade/vim-gitgutter')
    use('sindrets/diffview.nvim')
    use('Aasim-A/scrollEOF.nvim')

    -- preview markdown
    use { 'ellisonleao/glow.nvim', config = function() require("glow").setup() end }


    -- Theme/visual
    use('eandrju/cellular-automaton.nvim')
    use({
        -- https://github.com/adrian5/oceanic-next-vim
        -- git clone https://github.com/adrian5/oceanic-next-vim.git ~/.local/share/nvim/site/pack/plugins/start/oceanic-next-vim
        os.getenv("HOME") .. '/.local/share/nvim/site/pack/plugins/start/oceanic-next-vim',
        as = 'oceanicnext',
        config = function()
            vim.cmd('let g:oceanic_transparent_bg = 0')
            vim.cmd('colorscheme oceanicnext')
        end
    })
end)
