return {
    "folke/snacks.nvim",
    lazy = false,
    priority = 1000,
    ---@type snacks.Config
    opts = {
        picker = {
            layout = {
                preset = "telescope",
            },
        },
        matcher = {
            frecency = true,
            cwd_bonus = true,
        },
        filter = {
            cwd = true,
        },
    },
    keys = {
        -- Explorer
        {
            "<leader>sf",
            function()
                Snacks.picker.smart()
            end,
            desc = "Smart Find Files",
        },
        {
            "<leader>,",
            function()
                Snacks.picker.buffers()
            end,
            desc = "Buffers",
        },
        {
            "<leader>/",
            function()
                Snacks.picker.grep()
            end,
            desc = "Grep",
        },
        {
            "<leader>:",
            function()
                Snacks.picker.command_history()
            end,
            desc = "Command History",
        },

        -- Find
        {
            "<leader><leader>",
            function()
                Snacks.picker.buffers()
            end,
            desc = "Buffers",
        },
        {
            "<leader>ff",
            function()
                Snacks.picker.files()
            end,
            desc = "Find Files",
        },

        -- Git
        {
            "<leader>gb",
            function()
                Snacks.picker.git_branches()
            end,
            desc = "Git Branches",
        },
        {
            "<leader>gl",
            function()
                Snacks.picker.git_log()
            end,
            desc = "Git Log",
        },
        {
            "<leader>gL",
            function()
                Snacks.picker.git_log_line()
            end,
            desc = "Git Log Line",
        },
        {
            "<leader>gs",
            function()
                Snacks.picker.git_status()
            end,
            desc = "Git Status",
        },
        {
            "<leader>gS",
            function()
                Snacks.picker.git_stash()
            end,
            desc = "Git Stash",
        },
        {
            "<leader>gf",
            function()
                Snacks.picker.git_log_file()
            end,
            desc = "Git Log File",
        },

        -- Grep
        {
            "<leader>sb",
            function()
                Snacks.picker.lines()
            end,
            desc = "Buffer Lines",
        },
        {
            "<leader>sk",
            function()
                Snacks.picker.keymaps()
            end,
            desc = "Keymaps",
        },

        -- Help
        {
            "<leader>sh",
            function()
                Snacks.picker.help()
            end,
            desc = "Help Pages",
        },
    },
}
