return {
	-- A pretty diagnostics, references, telescope results, quickfix and location list to help you solve all the trouble your code is causing.
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cmd = { "TroubleToggle", "Trouble" },
	opts = {
		use_diagnostic_signs = false,
		position = "bottom", -- position of the list can be: bottom, top, left, right
		icons = true, -- use devicons for filenames
		mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
		group = true, -- group results by file
		fold_open = "", -- icon used for open folds
		fold_closed = "", -- icon used for closed folds
		padding = true, -- add an extra new line on top of the list
		win_config = { border = "single" }, -- window configuration for floating windows. See |nvim_open_win()|.
		auto_close = true, -- automatically close the list when you have no diagnostics
		auto_fold = true, -- automatically fold a file trouble list at creation
		cycle_results = true, -- cycle item list when reaching beginning or end of list
		signs = {
			-- icons / text used for a diagnostic
			error = "",
			warning = "",
			hint = "",
			information = "",
			other = "",
		},
	},
	keys = {
		{ "<leader>xx", ":TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
		{ "<leader>xX", ":TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
		{ "<leader>xl", ":TroubleToggle loclist<cr>", desc = "Location List (Trouble)" },
		{ "<leader>xq", ":TroubleToggle quickfix<cr>", desc = "Quickfix List (Trouble)" },
		{
			"[q",
			function()
				if require("trouble").is_open() then
					require("trouble").previous({ skip_groups = true, jump = true })
				else
					local ok, err = pcall(vim.cmd.cprev)
					if not ok then
						vim.notify(err, vim.log.levels.ERROR)
					end
				end
			end,
			desc = "Previous trouble/quickfix item",
		},
		{
			"]q",
			function()
				if require("trouble").is_open() then
					require("trouble").next({ skip_groups = true, jump = true })
				else
					local ok, err = pcall(vim.cmd.cnext)
					if not ok then
						---@diagnostic disable-next-line: param-type-mismatch
						vim.notify(err, vim.log.levels.ERROR)
					end
				end
			end,
			desc = "Next trouble/quickfix item",
		},
	},
}
