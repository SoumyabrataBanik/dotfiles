return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.6",
	-- or                              , branch = '0.1.x',
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sharkdp/fd",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

		"nvim-telescope/telescope-smart-history.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
	},

	config = function()
		local actions = require("telescope.actions")
		require("telescope").setup({
			extensions = {
				warp_results = true,
				fzf = {},
				["ui-select"] = {
					require("telescope.themes").get_dropdown({}),
				},
			},
			defaults = {
				mappings = {
					i = {
						["<C-q>"] = actions.close,
						["<C-Q>"] = actions.close,
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
					},
				},
			},
		})

		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")

		local builtin = require("telescope.builtin")
		local actions = require("telescope.actions")

		vim.keymap.set("n", "<Space>ff", function()
			builtin.find_files({ hidden = true })
		end, { desc = "Find Files" })
		vim.keymap.set("n", "<Space>gf", builtin.git_files, { desc = "Get git files" })
		vim.keymap.set("n", "<Space>hh", builtin.help_tags, { desc = "Open help tags" })
		vim.keymap.set("n", "<Space>fg", builtin.live_grep, { desc = "Grep words from Files" })
		vim.keymap.set("n", "<Space>/", builtin.current_buffer_fuzzy_find, { desc = "Fuzzy find in current buffer" })
		vim.keymap.set("n", "<space>gw", builtin.grep_string)
		vim.keymap.set("n", "<space>fa", function()
			---@diagnostic disable-next-line: param-type-mismatch
			builtin.find_files({ cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy") })
		end)
		vim.keymap.set("n", "<space>fn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end)
		vim.keymap.set("n", "<Space>km", builtin.keymaps, { desc = "Get the Keymaps" })
	end,
}
