-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.clipboard = "unnamedplus"
vim.opt.swapfile = false
vim.opt.backup = false
vim.g.editorconfig = true

-- In your init.lua, to address lag with some terminal emulators
local function paste()
  return {
    vim.fn.split(vim.fn.getreg(""), "\n"),
    vim.fn.getregtype(""),
  }
end

vim.g.clipboard = {
  name = "OSC 52",
  copy = {
    ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
    ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
  },
  paste = {
    -- ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
    -- ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
    ["*"] = paste,
    ["+"] = paste,
  },
}

-- Prettier config
vim.g.lazyvim_prettier_needs_config = true
vim.g.lazyvim_eslint_auto_format = true
