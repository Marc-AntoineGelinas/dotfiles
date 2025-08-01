vim.lsp.config.clangd = {
    cmd = { "clangd", "--clang-tidy", "--log=verbose" },
    filetypes = { "c", "cpp", "h", "hpp" },
    root_markers = {
        ".clangd",
        ".clang-tidy",
        ".clang-format",
        "compile_commands.json",
        "compile_flags.txt",
        "configure.ac", -- AutoTools
        ".git",
    },
}

vim.lsp.enable("clangd")
