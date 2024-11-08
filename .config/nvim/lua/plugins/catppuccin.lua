return {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    opts = {
      transparent_background = true,
    },
    integrations = {
      cmp = true,
      gitsigns = true,
      treesitter = true,
      telescope = true,
      mason = true,
    },
    config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin-mocha")
    end,
}
