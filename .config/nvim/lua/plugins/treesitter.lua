return {
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "OXY2DEV/markview.nvim",
        },
        build = ":TSUpdate",
        config = function()
            local config = require("nvim-treesitter.configs")
            config.setup({
                ensure_installed = { "c", "lua", "go", "python", "vimdoc", "python", "markdown", "markdown_inline" },
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
    },
}
