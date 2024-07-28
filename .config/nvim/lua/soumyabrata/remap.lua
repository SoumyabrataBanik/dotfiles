vim.g.mapleader = " "

vim.keymap.set("n", "<leader>rex", vim.cmd.Rex, { desc = "Toggle builtin tree" })
vim.keymap.set("n", "<leader>ex", vim.cmd.Ex, { desc = "Open Netrw" })
vim.keymap.set("n", "<leader>so", vim.cmd.so, { desc = "source neovim" })
vim.keymap.set("n", "<C-s>", vim.cmd.w, { desc = "Save file under current buffer" })
--vim.keymap.set("n", "<leader>q", vim.cmd.q)
vim.keymap.set({ "n", "v" }, "<leader>ww", vim.cmd.q, { desc = "Quit vim" })
vim.keymap.set({ "n", "v" }, "<leader>wq", vim.cmd.wq, { desc = "Save file under current buffer and quit vim" })
vim.keymap.set({ "n", "v" }, "<leader>wf", "<CMD>q!<CR>", { desc = "Force quit neovim" })

-- Pasting a file from clipboard
vim.keymap.set("n", "<leader>p", '"+p', { desc = "Paste from clipboard" })
-- Copying to clipbaord
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Copy to clipboard" })

-- Exiting modes
vim.keymap.set("n", "<C-c>", "<Esc>", { desc = "Escape from current mode" })
vim.keymap.set("v", "<C-c>", "<Esc>", { desc = "Escape from current mode" })
vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "Escape from current mode" })
