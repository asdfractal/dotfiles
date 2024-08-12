require("config.remap")
require("config.set")
require("config.lazy_init")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local asdfractal_group = augroup("asdfractal", {})
local yank_group = augroup("HighlightYank", {})
local ft_group = augroup("fileType", { clear = true })
local netrw_group = augroup("netrw", { clear = true })

autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "WildMenu",
			timeout = 60,
		})
	end,
})

autocmd("LspAttach", {
	group = asdfractal_group,
	callback = function(e)
		local opts = { buffer = e.buf }

		vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, opts)
		vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, opts)
		vim.keymap.set("n", "gI", require("telescope.builtin").lsp_implementations, opts)
		vim.keymap.set("n", "<leader>D", require("telescope.builtin").lsp_type_definitions, opts)
		vim.keymap.set("n", "<leader>ds", require("telescope.builtin").lsp_document_symbols, opts)
		vim.keymap.set("n", "<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
		vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
		vim.keymap.set("n", "<leader>ve", vim.diagnostic.setqflist, opts)
		vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
		vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
		vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
		vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)

		-- if client.name == "eslint" then
		-- 	local ns = vim.lsp.diagnostic.get_namespace(client.id)
		-- 	vim.diagnostic.disable(nil, ns)
		-- end
	end
		-- autocmd("BufWritePre", {
		-- 	buffer = e.buf,
		-- 	callback = function()
		-- 		vim.lsp.buf.format { async = false, id = e.data.client_id }
		-- 	end,
		-- })

		-- highlight when hover and rest
		local client = vim.lsp.get_client_by_id(e.data.client_id)
		if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = e.buf,
				group = asdfractal_group,
				callback = vim.lsp.buf.document_highlight,
			})

			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = e.buf,
				group = asdfractal_group,
				callback = vim.lsp.buf.clear_references,
			})

			vim.api.nvim_create_autocmd("LspDetach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
				callback = function(e2)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds({ group = "asdfractal_group", buffer = e2.buf })
				end,
			})
		end
	end,
})

autocmd("filetype", {
	group = ft_group,
	callback = function(e)
		vim.bo[e.buf].commentstring = "; %s"
	end,
	pattern = { "autohotkey" },
})

autocmd("filetype", {
	group = netrw_group,
	callback = function(e)
		-- vim.keymap.set("n", "<c-j>", ":wincmd j <cr>", { noremap = true })
		-- vim.keymap.set("n", "<c-h>", ":wincmd h <cr>", { noremap = true })
		-- vim.keymap.set("n", "<c-k>", ":wincmd k <cr>", { noremap = true })
		vim.api.nvim_buf_set_keymap(0, "n", "<c-l>", "", {})
	end,
	pattern = { "netrw" },
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.g.omni_sql_default_compl_type = 'syntax'
vim.g.python3_host_prog = '/usr/bin/python3.11'

vim.g.fzf_vim = {}
