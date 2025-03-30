return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
      inlay_hints = { enabled = true},
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    opts = {
      inlay_hints = {enabled = true}
    },
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
      lspconfig.gopls.setup({
        on_attach = function(bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
              require('go.format').goimports()
            end,
          })
        end,
        capabilities = capabilities,
        settings = {
          gofumpt = true,
        }
      })
      lspconfig.vimls.setup({
        capabilities = capabilities
      })
      lspconfig.cssls.setup({
        capabilities = capabilities
      })
      lspconfig.pyright.setup({
        capabilities = capabilities
      })

      vim.keymap.set("n", "<leader>gf", vim.lsp.buf.hover, {desc = "[G]et [B]uffer"})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {desc = "[G]et [D]efinitions"})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {desc = "[G]et [R]eferences"})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {desc = "[C]ode [A]ctions"})
    end,
  },
}
