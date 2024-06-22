return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.6",
	-- or                              , branch = '0.1.x',
	dependencies = { "nvim-lua/plenary.nvim", "sharkdp/fd" },

	config = function()
		local actions = require("telescope.actions")
		require("telescope").setup({
			defaults = {
				mappings = {
					i = {
						["<C-q>"] = actions.close,
						["<C-Q>"] = actions.close,
					},
				},
			},
		})
		local builtin = require("telescope.builtin")
		local utils = require("telescope.utils")
		vim.keymap.set("n", "<leader>ff", function()
			builtin.find_files({ utils.buffer_dir() })
		end)
		vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "find git files" })
		vim.keymap.set("n", "<leader>fs", function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end)
	end,
}
