return {
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
		require("rose-pine").setup({
			variant = "moon",
			dim_inactive_windows = false,
			extend_background_behind_borders = true,

			enable = {
				terminal = true,
				legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
				migrations = true, -- Handle deprecated options automatically
			},

			styles = {
				bold = true,
				italic = false,
				transparency = true,
			},
		})

		vim.cmd.colorscheme("rose-pine")
	end,
}

--return {
--	"sainnhe/sonokai",
--	lazy = false,
--	priority = 1000,
--	config = function()
--		vim.g.sonokai_style = "andromeda"
--		vim.g.sonokai_better_performance = 1
--		vim.g.sonokai_transparent_background = 2
--		vim.g.sonokai_dim_inactive_windows = 1
--		vim.g.sonokai_float_style = "bright"
--		vim.g.sonokai_diagnostic_line_highlight = 1
--		vim.g.sonokai_enable_italic = true
--		vim.cmd.colorscheme("sonokai")
--	end,
--}

--return {
--	"catppuccin/nvim",
--	name = "catppuccin",
--	priority = 1000,
--
--	config = function()
--		require("catppuccin").setup({
--			flavour = "macchiato", -- latte, frappe, macchiato, mocha
--			background = { -- :h background
--				light = "latte",
--				dark = "macchiato",
--			},
--			transparent_background = true, -- disables setting the background color.
--			show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
--			term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
--			dim_inactive = {
--				enabled = true, -- dims the background color of inactive window
--				shade = "dark",
--				percentage = 0.15, -- percentage of the shade to apply to the inactive window
--			},
--			no_italic = false, -- Force no italic
--			no_bold = false, -- Force no bold
--			no_underline = false, -- Force no underline
--			styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
--				comments = { "italic" }, -- Change the style of comments
--				conditionals = { "italic" },
--				loops = {},
--				functions = { "italic" },
--				keywords = { "italic" },
--				strings = {},
--				variables = {},
--				numbers = {},
--				booleans = { "italic" },
--				properties = {},
--				types = { "italic" },
--				operators = {},
--				-- miscs = {}, -- Uncomment to turn off hard-coded styles
--			},
--			color_overrides = {},
--			custom_highlights = {},
--			default_integrations = true,
--			integrations = {
--				cmp = true,
--				gitsigns = true,
--				nvimtree = true,
--				treesitter = true,
--				notify = false,
--				mini = {
--					enabled = true,
--					indentscope_color = "",
--				},
--				-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
--			},
--		})
--
--		-- setup must be called before loading
--		vim.cmd.colorscheme("catppuccin")
--	end,
--}
