-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.snacks_animate = false

local opt = vim.opt

if vim.g.vscode then
  -- VSCode extension

  -- clipboard
  if vim.fn.has("clipboard") == 1 then
    if vim.fn.has("unnamedplus") == 1 then
      -- When possible use + register for copy-paste
      opt.clipboard = "unnamed,unnamedplus"
    else
      -- On mac and Windows, use * register for copy-paste
      opt.clipboard = "unnamed"
    end
  end
else
  -- ordinary Neovim
end
