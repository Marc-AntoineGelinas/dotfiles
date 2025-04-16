local lsp_path = vim.fn.stdpath("config") .. "/lua/lsp/"

vim.diagnostic.config({
  underline = {
    severity = { min = vim.diagnostic.severity.ERROR }
  },
  virtual_text = {
    current_line = true,
    severity = { min = vim.diagnostic.severity.ERROR}
  },
  virtual_lines = false,
})

vim.keymap.set("n", "<leader>gf", vim.lsp.buf.hover, {desc = "[G]et [B]uffer"})
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {desc = "[G]et [D]efinitions"})
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {desc = "[G]et [R]eferences"})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {desc = "[C]ode [A]ctions"})

vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = "single"
  }
)

-- Auto formating on save
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

    if not client:supports_method('textDocument/willSaveWaitUntil')
      and client:supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('my.lsp', {clear=false}),
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
        end,
      })
    end
  end,
})

for _, file in ipairs(vim.fn.readdir(lsp_path)) do
  if file:match("%.lua$") and file ~= "init.lua" then
    local module_name = "lsp." .. file:gsub("%.lua$", "")
    require(module_name)
  end
end

