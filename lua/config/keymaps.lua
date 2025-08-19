-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map({ "n", "v" }, "gh", "0", { desc = "Go to line start (first character)", silent = true })
map({ "n", "v" }, "gs", "^", { desc = "Go to line start (first non-blank)", silent = true })
map({ "n", "v" }, "gl", "$", { desc = "Go to line end", silent = true })
map({ "n", "v" }, "ge", "G", { desc = "Go to end of file", silent = true })
map("i", "<C-h>", "<Left>", { desc = "Move left" })
map("i", "<C-j>", "<Down>", { desc = "Move down" })
map("i", "<C-k>", "<Up>", { desc = "Move up" })
map("i", "<C-l>", "<Right>", { desc = "Move right" })

vim.keymap.set("x", "p", '"_dP', { desc = "Paste (keep register)", remap = false })

vim.keymap.del({ "n", "x" }, "j")
vim.keymap.del({ "n", "x" }, "k")

vim.api.nvim_set_keymap("n", "j", "<Plug>(accelerated_jk_gj)", {})
vim.api.nvim_set_keymap("n", "k", "<Plug>(accelerated_jk_gk)", {})

if vim.g.vscode then
  -- VSCode extension

  local vscode = require("vscode")

  map({ "n", "x" }, "gr", function()
    vscode.call("editor.action.referenceSearch.trigger")
  end)

  map({ "n", "x" }, "gi", function()
    vscode.call("editor.action.peekImplementation")
  end)

  map({ "n", "x" }, "<leader>r", function()
    vscode.action("editor.action.rename")
  end)

  map("n", "<leader>k", function()
    vscode.call("editor.action.showHover")
  end)
else
  -- ordinary Neovim
end
