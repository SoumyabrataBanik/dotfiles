vim.g.mapleader = " "
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader><leader>", vim.cmd.Ex, { desc = "Toggle builtin tree" })
vim.keymap.set("n", "<leader>so", vim.cmd.so, { desc = "source neovim" })
vim.keymap.set("n", "<C-s>", vim.cmd.w, { desc = "Save file under current buffer" })
--vim.keymap.set("n", "<leader>q", vim.cmd.q)
vim.keymap.set("n", "<C-q>", vim.cmd.q, { desc = "Quit vim" })
vim.keymap.set("n", "<C-Q>", vim.cmd.q, { desc = "Quit vim" })
vim.keymap.set("n", "<leader>wq", vim.cmd.wq, { desc = "Save file under current buffer and quit vim" })

-- Pasting a file from clipboard
vim.keymap.set("n", "<leader>p", '"+p', { desc = "Paste from clipboard" })

-- Copying to clipbaord
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Copy to clipboard" })

vim.keymap.set("n", "<C-c>", "<Esc>", { desc = "Escape from current mode" })
vim.keymap.set("v", "<C-c>", "<Esc>", { desc = "Escape from current mode" })
vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "Escape from current mode" })

-- Oil.Nvim
vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open Parent directory" })

-- Bufferline
vim.keymap.set("n", "<C-x>", vim.cmd.BufferClose, { desc = "Close current buffer" })
vim.keymap.set("n", "<C-a>", vim.cmd.BufferPrevious, { desc = "Move to previous buffer" })
vim.keymap.set("n", "<C-d>", vim.cmd.BufferNext, { desc = "Move to next buffer" })
vim.keymap.set("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", opts, { desc = "Jump to buffer 1" })
vim.keymap.set("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", opts, { desc = "Jump to buffer 2" })
vim.keymap.set("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts, { desc = "Jump to buffer 3" })
vim.keymap.set("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts, { desc = "Jump to buffer 4" })
vim.keymap.set("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts, { desc = "Jump to buffer 5" })
vim.keymap.set("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", opts, { desc = "Jump to buffer 6" })
vim.keymap.set("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", opts, { desc = "Jump to buffer 7" })
vim.keymap.set("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", opts, { desc = "Jump to buffer 8" })
vim.keymap.set("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", opts, { desc = "Jump to buffer 9" })
vim.keymap.set("n", "<A-0>", "<Cmd>BufferLast<CR>", opts, { desc = "Jump to buffer 10" })

-- Telescope keymaps
vim.keymap.set("n", "<C-k>", "<Cmd>Telescope keymaps<CR>", { desc = "Open telescope to show keymaps" })
