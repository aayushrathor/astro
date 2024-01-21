return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  {
    "andweeb/presence.nvim",
    lazy = false,
  },
  {
    "laytan/cloak.nvim",
    lazy = false,
    config = function()
      require("cloak").setup {
        enabled = true,
        cloak_character = "*",
        -- The applied highlight group (colors) on the cloaking, see `:h highlight`.
        highlight_group = "Comment",
        patterns = {
          {
            -- Match any file starting with ".env".
            -- This can be a table to match multiple file patterns.
            file_pattern = {
              ".env*",
              "wrangler.toml",
              ".dev.vars",
              "local.env*",
            },
            -- Match an equals sign and any character after it.
            -- This can also be a table of patterns to cloak,
            -- example: cloak_pattern = { ":.+", "-.+" } for yaml files.
            cloak_pattern = "=.+",
          },
        },
      }
    end,
  },
  -- {
  --   "github/copilot.vim",
  --   event = "VeryLazy",
  --   version = "*",
  --   autostart = true,
  -- },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "InsertEnter",
    config = function()
      require("copilot").setup {
        panel = {
          enabled = true,
          auto_refresh = true,
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          accept = false, -- disable built-in keymapping
        },
      }

      -- hide copilot suggestions when cmp menu is open
      -- to prevent odd behavior/garbled up suggestions
      local cmp_status_ok, cmp = pcall(require, "cmp")
      if cmp_status_ok then
        cmp.event:on("menu_opened", function() vim.b.copilot_suggestion_hidden = true end)

        cmp.event:on("menu_closed", function() vim.b.copilot_suggestion_hidden = false end)
      end

      -- disable copilot if we are in a private project
      if not enable_ai() then vim.cmd "Copilot disable" end
    end,
  },
}
