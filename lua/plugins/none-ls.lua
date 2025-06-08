return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics

    null_ls.setup({
      debug = false,
      sources = {
        -- Python
        formatting.black, -- formatter
        formatting.isort, -- import formatter
        diagnostics.pylint, -- linter

        -- Golang
        formatting.gofmt, -- basic formatter
        formatting.goimports, -- import formatter
        diagnostics.golangci_lint, -- linter suite

        -- TypeScript/JavaScript
        formatting.prettier.with({
          filetypes = {
            "javascript",
            "typescript",
            "css",
            "scss",
            "html",
            "json",
            "yaml",
            "markdown",
            "graphql",
            "md",
            "txt",
          },
        }),

        -- Lua
        formatting.stylua, -- formatter

        -- Terraform
        formatting.terraform_fmt,
      },

      -- Format on save
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({
                bufnr = bufnr,
                filter = function(client)
                  -- Use none-ls for formatting instead of LSP
                  return client.name == "null-ls"
                end,
              })
            end,
          })
        end
      end,
    })
  end,
}
