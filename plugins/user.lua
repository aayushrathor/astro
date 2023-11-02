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
      }
      vim.keymap.set("n", "<C-/>", "<cmd> CloakToggle <CR>")
    end,
  },
}
