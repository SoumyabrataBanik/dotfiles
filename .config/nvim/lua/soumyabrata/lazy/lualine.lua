return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		lualine.setup({
			options = {
				theme = "dracula-nvim",
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = {
					{
						"mode",
						icons_enabled = true,
						separator = { right = "" },
					},
				},
				lualine_b = {
					{
						"branch",
						separator = { right = "" },
					},
				},
				lualine_c = {
					{
						"diagnostics",

						sources = { "nvim_diagnostic", "nvim_lsp" },

						sections = { "error", "warn", "info", "hint" },

						diagnostics_color = {
							error = "DiagnosticError", -- Changes diagnostics' error color.
							warn = "DiagnosticWarn", -- Changes diagnostics' warn color.
							info = "DiagnosticInfo", -- Changes diagnostics' info color.
							hint = "DiagnosticHint", -- Changes diagnostics' hint color.
						},
						symbols = { error = "E", warn = "W", info = "I", hint = "H" },
						colored = true, -- Displays diagnostics status in color if set to true.
						update_in_insert = true, -- Update diagnostics in insert mode.
						always_visible = false, -- Show diagnostics even if there are none.
					},
				},
				--lualine_x = { "filename", "encoding", "fileformat", "filetype" },
				lualine_x = { "filetype", "fileformat" },
				lualine_z = {},
			},
		})
	end,
}
