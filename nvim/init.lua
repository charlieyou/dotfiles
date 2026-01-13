-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Enable true colors
vim.opt.termguicolors = true

-- OSC 52 for system clipboard copy (works over SSH), paste uses internal register
local osc52 = require('vim.ui.clipboard.osc52')
local last_yanked = {}
vim.g.clipboard = {
  name = 'OSC 52',
  copy = {
    ['+'] = function(lines) last_yanked = lines; osc52.copy('+')(lines) end,
    ['*'] = function(lines) last_yanked = lines; osc52.copy('*')(lines) end,
  },
  paste = {
    ['+'] = function() return last_yanked end,
    ['*'] = function() return last_yanked end,
  },
}

-- Plugins
require("lazy").setup({
  { "christoomey/vim-tmux-navigator" },
  { "bullets-vim/bullets.vim" },

  -- Colorscheme
  {
    "projekt0n/github-nvim-theme",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("github_dark_default")
    end,
  },

  -- Treesitter for syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
})

-- LSP (built-in for Neovim 0.11+)
vim.lsp.enable("gleam")

-- Enable treesitter highlighting for all supported languages
vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    pcall(vim.treesitter.start)
  end,
})

-- Settings (defer to ensure plugins don't override)
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.opt.relativenumber = true
    vim.opt.number = true
  end,
})
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.mouse = "a"
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.undofile = true
vim.opt.clipboard = "unnamedplus"
vim.opt.scrolloff = 8

-- Per-language indent conventions
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "lua", "javascript", "typescript", "typescriptreact", "javascriptreact", "json", "yaml", "html", "css", "svelte", "vue", "gleam" },
  callback = function()
    vim.bo.shiftwidth = 2
    vim.bo.tabstop = 2
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "go", "make" },
  callback = function()
    vim.bo.expandtab = false
    vim.bo.shiftwidth = 4
    vim.bo.tabstop = 4
  end,
})

-- Keymaps
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("i", "kj", "<Esc>")
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "B", "^")
vim.keymap.set("n", "E", "$")
