function ColorMyPencils(color)
	color = color or "gruvbox"
	vim.cmd.colorscheme(color)
	vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#51B3EC", bold = true })
	vim.api.nvim_set_hl(0, "LineNr", { fg = "white", bold = true })
	vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#FB508F", bold = true })
end

-- Moonfly Colorscheme -
--return {
--	"bluz71/vim-moonfly-colors",
--	name = "moonfly",
--	lazy = false,
--	priority = 1000,
--
--	config = function()
--		vim.g.moonflyTransparent = true
--		ColorMyPencils()
--	end,
--}

-- Rose-pine colorscheme
--return {
--	"rose-pine/neovim",
--	name = "rose-pine",
--	config = function()
--		require("rose-pine").setup({
--			variant = "moon", -- auto, main, moon, or dawn
--			dark_variant = "moon", -- main, moon, or dawn
--			dim_inactive_windows = true,
--			styles = {
--				italic = false,
--				transparency = true,
--			},
--		})
--
--		ColorMyPencils()
--	end,
--}

-- Gruvbox colorscheme
return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	opts = {},

	config = function()
		local gruv = require("gruvbox")
		gruv.setup({
			italic = {
				strings = false,
			},
			transparent_mode = true,
			contrast = "hard",
		})

		vim.cmd("colorscheme gruvbox")
		vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#b8bb26", bold = false })
		vim.api.nvim_set_hl(0, "LineNr", { fg = "orange", bold = false })
		vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#fabd2f", bold = false })
	end,
}
