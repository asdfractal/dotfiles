-- require('/home/asdfractal/.local/share/nvim/site/pack/plugins/start/oceanic-next-vim/colors/oceanicnext.vim').setup({
--     disable_background = true
-- })

function ColorMyPencils(color)
    color = color or "oceanicnext"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
    vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
end

ColorMyPencils()