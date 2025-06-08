--https://tmuxcheatsheet.com/ Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- File explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Project View" })

-- set <leader>, as escape in insert mode
vim.keymap.set("i", "<leader>,", "<Esc>", { desc = "Map Space-, as escape while in insert mode" })
