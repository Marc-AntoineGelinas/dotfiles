return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          visible = true,
          show_hidden_count = true,
          hide_dotfiles = false,
        },
      },
    })
    vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>", {desc = "Neotree toggle"})
    vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {desc = "Reveal Netree buffer"})
  end,
}
