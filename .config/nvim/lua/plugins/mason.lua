return {
  {
    'williamboman/mason.nvim',
    lazy = false,
    dependencies = { 'williamboman/mason-lspconfig' },
    config = function()
      require('mason').setup()
      require('mason-lspconfig').setup {
        ensure_installed = {
          'gopls',
          'pyright',
        },
      }
    end,
  },
}
