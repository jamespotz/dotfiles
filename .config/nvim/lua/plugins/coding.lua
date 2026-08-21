return {
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = {
        stylua = { "stylua" },
        python = { "isort", "black" },
        javascript = { "eslint_d", "prettier" },
        typescript = { "eslint_d", "prettier" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        -- kdl = { "kdlfmt" }
      }
      return opts
    end,
  },
}
