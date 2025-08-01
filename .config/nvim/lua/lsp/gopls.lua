vim.lsp.config.gopls = {
    cmd = { "gopls" },
    filetypes = { "go" },
    root_markers = {
        "go",
        "go.mod",
        "gowork",
        "gotmpl",
    },
}

vim.lsp.enable("gopls")
