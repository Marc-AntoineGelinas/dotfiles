return {
  {
    'ray-x/go.nvim',
    dependencies = { -- optional packages
      'neovim/nvim-lspconfig',
      'nvim-treesitter/nvim-treesitter',
    },
    enabled = true,
    config = function()
      local format_sync_grp = vim.api.nvim_create_augroup('GoFormat', {})
      vim.api.nvim_create_autocmd('BufWritePre', {
        pattern = '*.go',
        callback = function()
          require('go.format').goimports()
        end,
        group = format_sync_grp,
      })
      require('go').setup {
        disable_defaults = true,
        preludes = {
          default = function()
            return {}
          end,
          GoRun = function()
            return {}
          end,
        },
        go = 'go',
        gofmt = 'gofumpt',
        goimports = 'gopls',
      }
    end,
    event = { 'CmdlineEnter' },
    ft = { 'go', 'gomod' },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
}
