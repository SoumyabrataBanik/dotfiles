return {
	"OlegGulevskyy/better-ts-errors.nvim",
	dependencies = { "MunifTanjim/nui.nvim" },

	config = function()
		require("better-ts-errors").setup({
			keymaps = {
				toggle = "<Space>ts",
			},
		})
	end,
}
