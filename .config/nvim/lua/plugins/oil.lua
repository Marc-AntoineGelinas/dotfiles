return {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },

    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Oil" }),
}
