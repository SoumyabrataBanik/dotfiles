return {
	"tpope/vim-fugitive",
	config = function()
		vim.keymap.set("n", "<leader>gg", "<CMD>Git<CR>", { desc = "Open fugitive" })
	end,
}
