return {
	"lewis6991/hover.nvim",
	config = function()
		require("hover").setup({
			init = function()
				require("hover.providers.lsp")
				require("hover.providers.diagnostic")
			end,
		})

		--keymaps
		vim.keymap.set("n", "K", require("hover").hover, { desc = "hover.nvim" })
	end,
}
