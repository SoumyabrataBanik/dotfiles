vim.g.barbar_auto_setup = false -- disable auto-setup

return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
		"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
	},
	config = function()
		require("barbar").setup({
			animation = true,
			auto_hide = false,
			tabpages = true,
			clickable = true,
			focus_on_close = "left",
			highlight_alternate = false,
			highlight_inactive_file_icons = false,
			highlight_visible = true,
			icons = {
				-- Configure the base icons on the bufferline.
				-- Valid options to display the buffer index and -number are `true`, 'superscript' and 'subscript'
				buffer_index = false,
				buffer_number = false,
				button = "",
				-- Enables / disables diagnostic symbols
				diagnostics = {
					[vim.diagnostic.severity.ERROR] = { enabled = true, icon = "ﬀ" },
					[vim.diagnostic.severity.WARN] = { enabled = false },
					[vim.diagnostic.severity.INFO] = { enabled = false },
					[vim.diagnostic.severity.HINT] = { enabled = true },
				},
				gitsigns = {
					added = { enabled = true, icon = "+" },
					changed = { enabled = true, icon = "~" },
					deleted = { enabled = true, icon = "-" },
				},
				filetype = {
					-- Sets the icon's highlight group.
					-- If false, will use nvim-web-devicons colors
					custom_colors = false,

					-- Requires `nvim-web-devicons` if `true`
					enabled = true,
				},
				separator = { left = "▎", right = "" },
				separator_at_end = true,
				modified = { button = "●" },
				pinned = { button = "", filename = true },
				preset = "default",
				alternate = { filetype = { enabled = false } },
				current = { buffer_index = true },
				inactive = { button = "×" },
				visible = { modified = { buffer_number = false } },
			},
			insert_at_end = false,
			insert_at_start = false,
			maximum_padding = 1,
			minimum_padding = 1,
			maximum_length = 30,
			minimum_length = 0,
			semantic_letters = true,
			sidebar_filetypes = {
				NvimTree = true,
				undotree = {
					text = "undotree",
					align = "center", -- *optionally* specify an alignment (either 'left', 'center', or 'right')
				},
				["neo-tree"] = { event = "BufWipeout" },
				Outline = { event = "BufWinLeave", text = "symbols-outline", align = "right" },
			},
			letters = "asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP",
			no_name_title = nil,
		})
		-- Keymaps

		local opts = { noremap = true, silent = true }
		vim.keymap.set("n", "<Space>C", vim.cmd.BufferClose, { desc = "Close current buffer" })
		vim.keymap.set("n", "<C-A>", vim.cmd.BufferPrevious, { desc = "Move to previous buffer" })
		vim.keymap.set("n", "<C-D>", vim.cmd.BufferNext, { desc = "Move to next buffer" })
		vim.keymap.set("n", "<C-1>", "<Cmd>BufferGoto 1<CR>", opts, { desc = "Jump to buffer 1" })
		vim.keymap.set("n", "<C-2>", "<Cmd>BufferGoto 2<CR>", opts, { desc = "Jump to buffer 2" })
		vim.keymap.set("n", "<C-3>", "<Cmd>BufferGoto 3<CR>", opts, { desc = "Jump to buffer 3" })
		vim.keymap.set("n", "<C-4>", "<Cmd>BufferGoto 4<CR>", opts, { desc = "Jump to buffer 4" })
		vim.keymap.set("n", "<C-5>", "<Cmd>BufferGoto 5<CR>", opts, { desc = "Jump to buffer 5" })
		vim.keymap.set("n", "<C-6>", "<Cmd>BufferGoto 6<CR>", opts, { desc = "Jump to buffer 6" })
		vim.keymap.set("n", "<C-7>", "<Cmd>BufferGoto 7<CR>", opts, { desc = "Jump to buffer 7" })
		vim.keymap.set("n", "<C-8>", "<Cmd>BufferGoto 8<CR>", opts, { desc = "Jump to buffer 8" })
		vim.keymap.set("n", "<C-9>", "<Cmd>BufferGoto 9<CR>", opts, { desc = "Jump to buffer 9" })
		vim.keymap.set("n", "<C-0>", "<Cmd>BufferLast<CR>", opts, { desc = "Jump to buffer 10" })
	end,
}
