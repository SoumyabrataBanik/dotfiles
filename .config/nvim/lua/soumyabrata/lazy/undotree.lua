return {
	"mbbill/undotree",

	config = function()
		vim.keymap.set("n", "<Space>ut", "<CMD>UndotreeToggle<CR>", { desc = "Toggle undotree" })
	end,
}
