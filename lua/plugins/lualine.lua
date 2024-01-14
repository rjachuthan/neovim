return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	init = function()
		-- Disable until lualine loads
		vim.o.laststatus = 0
	end,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "auto",
				icons_enabled = true,
				-- section_separators = { left = "", right = "" },
				-- component_separators = { left = "", right = "" },
				component_separators = "|",
				section_separators = "",
				globalstatus = false,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename" , "buffer" },
				lualine_x = { "filetype" },
				lualine_y = { "" },
				lualine_z = { "location" },
			},
		})
	end,
}
