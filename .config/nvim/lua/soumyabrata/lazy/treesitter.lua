return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		treesitter.setup({
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"css",
				"javascript",
				"typescript",
				"go",
				"gomod",
				"gosum",
				"json",
				"html",
				"xml",
				"http",
				"sql",
				"markdown",
				"markdown_inline",
				"tsx",
			},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})

		require("nvim-ts-autotag").setup({
			opts = {
				enable_close = true,
				enable_rename = true,
				enable_close_on_slash = true,
			},
			filetypes = { "tsx", "typescriptreact", "jsx", "javascriptreact", "html" },
		})
	end,
}
