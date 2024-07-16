return {
	"stevearc/oil.nvim",
	opts = {},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local oil = require("oil")
		oil.setup({
			delete_to_trash = true,
			view_options = {
				show_hidden = true,
			},
			keymaps = {
				["<leader>e"] = { "actions.open_cwd", desc = "Open current working directory" },
				["<leader>q"] = { "actions.close", desc = "Close oil" },
				["<leader>tr"] = { "actions.toggle_trash", desc = "Open Trash" },
			},
		})

		vim.keymap.set("n", "<leader>o", "<CMD>Oil<CR>", { desc = "Open Oil" })
		vim.keymap.set("n", "<leader>s", oil.save, { desc = "Save changes in oil" })
	end,
}
