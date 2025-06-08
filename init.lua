-- bootstrap lazy.nvim, LazyVim and your plugins
if vim.g.vscode then
  -- Load VSCode
  require("config.lazy")
else
  require("config.lazy")
end
