return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
      "vim",
      "lua",

      -- web stuff
      "html",
      "css",
      "javascript",
      "typescript",
      "tsx",
      "sql",

      -- c stuff
      "c",
      "cpp",

      -- python stuff
      "python",

      -- misc
      "go",
      "json",
      "json5",
      "graphql",
      "markdown",
      "markdown_inline",
      "yaml",
    })
  end,
}
