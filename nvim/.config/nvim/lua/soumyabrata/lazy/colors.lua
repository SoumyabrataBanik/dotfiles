-- Night-owl Theme

return {
	"oxfist/night-owl.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("night-owl").setup({
			bold = false,
			italics = false,
			underline = true,
			undercurl = true,
			transparent_background = true,
		})
		vim.cmd.colorscheme("night-owl")
		vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#AECCEA", bold = false })
		vim.api.nvim_set_hl(0, "LineNr", { fg = "#1966B3", bold = true })
		vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#AECCEA", bold = false })
	end,
}
