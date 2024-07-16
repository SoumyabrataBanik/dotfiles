--return {
--	"rose-pine/neovim",
--	name = "rose-pine",
--	config = function()
--		require("rose-pine").setup({
--			variant = "main",
--			dim_inactive_windows = false,
--			extend_background_behind_borders = true,
--
--			enable = {
--				terminal = true,
--				legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
--				migrations = true, -- Handle deprecated options automatically
--			},
--
--			styles = {
--				bold = true,
--				italic = false,
--				transparency = true,
--			},
--		})
--
--		vim.cmd.colorscheme("rose-pine")
--	end,
--}

return {
	"sainnhe/sonokai",
	lazy = false,
	priority = 1000,
	config = function()
		vim.g.sonokai_style = "andromeda"
		vim.g.sonokai_better_performance = 1
		vim.g.sonokai_transparent_background = 2
		vim.g.sonokai_dim_inactive_windows = 1
		vim.g.sonokai_float_style = "bright"
		vim.g.sonokai_diagnostic_line_highlight = 1
		vim.g.sonokai_enable_italic = true
		vim.cmd.colorscheme("sonokai")
	end,
}
