return {
  "zk-org/zk-nvim",
  config = function()
    require("zk").setup({
      picker = "snack_picker",
      picker_options = {
        snacks_picker = {
          layout = {
            preset = "telescope"
          }
        },
      },
    })

    local opts = { noremap = true, silent = false }

    vim.keymap.set("n", "<leader>zn", "<Cmd>ZkNew<CR>", opts)

    -- Open notes.
    vim.keymap.set("n", "<leader>zo", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", opts)
    -- Open notes associated with the selected tags.
    vim.keymap.set("n", "<leader>zt", "<Cmd>ZkTags<CR>", opts)

    -- Search for the notes matching a given query.
    vim.keymap.set("n", "<leader>zf",
      "<Cmd>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Search: ') } }<CR>", opts)
    -- Search for the notes matching the current visual selection.
    vim.keymap.set("v", "<leader>zf", ":'<,'>ZkMatch<CR>", opts)
  end
}
