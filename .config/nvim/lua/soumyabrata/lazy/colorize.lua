return {
	"norcalli/nvim-colorizer.lua",

	config = function()
		require("colorizer").setup({
			"css",
			"html",
			"javascript",
			"typescript",
			"javascriptreact",
			"typescriptreact",
		}, { css = true, mode = "background" })
	end,
}
