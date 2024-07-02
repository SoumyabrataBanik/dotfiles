return {
	"mistweaverco/kulala.nvim",

	config = function()
		local kulala = require("kulala")
		kulala.setup({
			-- default_view, body or headers
			default_view = "body",
			-- dev, test, prod, can be anything
			-- see: https://learn.microsoft.com/en-us/aspnet/core/test/http-files?view=aspnetcore-8.0#environment-files
			default_env = "dev",
			-- enable/disable debug mode
			debug = false,
		})

		vim.filetype.add({
			extension = {
				["http"] = "http",
			},
		})

		vim.keymap.set("n", "<leader>rr", kulala.run, { desc = "Run Kulala" })
		vim.keymap.set("n", "<leader>rt", kulala.toggle_view, { desc = "Switch between header and body" })
	end,
}
