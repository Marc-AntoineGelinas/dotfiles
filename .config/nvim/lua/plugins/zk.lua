return {
    "zk-org/zk-nvim",
    config = function()
        require("zk").setup({
            picker = "snacks_picker",
            picker_options = {
                snacks_picker = {
                    layout = {
                        preset = "telescope",
                    },
                },
            },
        })

        local opts = { noremap = true, silent = false }
        -- Open the link under the caret.
        vim.keymap.set("n", "<CR>", "<Cmd>lua vim.lsp.buf.definition()<CR>", { opts, desc = "Enter link under caret" })
        vim.keymap.set("n", "<leader>zn", "<Cmd>ZkNew<CR>", { opts, desc = "Create new note" })
        -- Open notes.
        vim.keymap.set(
            "n",
            "<leader>zo",
            "<Cmd>ZkNotes { sort = { 'modified' } }<CR>",
            { opts, desc = "List all notes" }
        )
        -- Open notes associated with the selected tags.
        vim.keymap.set(
            "n",
            "<leader>zt",
            "<Cmd>ZkTags<CR>",
            { opts, desc = "List notes associated with selected tags" }
        )
        -- Search for the notes matching a given query.
        vim.keymap.set(
            "n",
            "<leader>zf",
            "<Cmd>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Search: ') } }<CR>",
            { opts, desc = "List all notes within a given query" }
        )
        -- Create a new note in the same directory as the current buffer, using the current selection for title.
        vim.keymap.set(
            "v",
            "<leader>znt",
            ":'<,'>ZkNewFromTitleSelection { dir = vim.fn.expand('%:p:h') }<CR>",
            { opts, desc = "Create a new note with the current selected text as title" }
        )
        -- Create a new note in the same directory as the current buffer, using the current selection for note content and asking for its title.
        vim.keymap.set(
            "v",
            "<leader>znc",
            ":'<,'>ZkNewFromContentSelection { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<CR>",
            { opts, desc = "Createa a new note with selected text as content" }
        )
        -- Open notes linking to the current buffer.
        vim.keymap.set(
            "n",
            "<leader>zb",
            "<Cmd>ZkBacklinks<CR>",
            { opts, desc = "Open notes linked to the current note" }
        )
        -- Open notes linked by the current buffer.
        vim.keymap.set("n", "<leader>zl", "<Cmd>ZkLinks<CR>", { opts, desc = "Open notes linked by the current note" })
        -- Search for the notes matching the current visual selection.
        vim.keymap.set(
            "v",
            "<leader>zf",
            ":'<,'>ZkMatch<CR>",
            { opts, desc = "Open notes matches selected visual text" }
        )
    end,
}
