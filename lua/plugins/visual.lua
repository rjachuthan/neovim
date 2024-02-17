return {
	{
		"lukas-reineke/virt-column.nvim",
		config = function()
			require("virt-column").setup({
				-- char = "|",
				virtcolumn = "80,120",
			})
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
	},
}
