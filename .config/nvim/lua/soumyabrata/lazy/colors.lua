-- Night-owl Theme
--return {
--	"oxfist/night-owl.nvim",
--	lazy = false,
--	priority = 1000,
--	config = function()
--		require("night-owl").setup({
--			bold = false,
--			italics = false,
--			underline = true,
--			undercurl = true,
--			transparent_background = true,
--		})
--		vim.cmd.colorscheme("night-owl")
--		vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#AECCEA", bold = false })
--		vim.api.nvim_set_hl(0, "LineNr", { fg = "#1966B3", bold = true })
--		vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#AECCEA", bold = false })
--	end,
--}

-- Sonokai colorscheme
return {
	"sainnhe/sonokai",
	lazy = false,
	priority = 1000,
	config = function()
		vim.g.sonokai_style = "andromeda"
		vim.g.sonokai_enable_italic = 1
		vim.g.sonokai_transparent_background = 2
		vim.g.sonokai_dim_inactive_windows = 1
		vim.g.sonokai_menu_selection_background = "green"
		vim.g.sonokai_diagnostic_text_highlight = 1
		vim.g.sonokai_diagnostic_line_highlight = 1
		vim.g.sonokai_better_performance = 1
		vim.cmd.colorscheme("sonokai")
	end,
}
