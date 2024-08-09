function ColorMyPencils()
    vim.cmd.colorscheme("oceanicnext")
	-- vim.cmd('let g:oceanic_transparent_bg = 0')
	vim.g.oceanic_transparent_bg = 0

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
    vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
end

return {
	'eandrju/cellular-automaton.nvim',

    {
        'asdfractal/oceanic-next-vim',
        name = 'oceanicnext',
        config = function()
			ColorMyPencils()
            -- vim.cmd('let g:oceanic_transparent_bg = 0')
            -- vim.cmd('colorscheme oceanicnext')
        end
    },
}
