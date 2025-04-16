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

for _, file in ipairs(vim.fn.readdir(lsp_path)) do
  if file:match("%.lua$") and file ~= "init.lua" then
    local module_name = "lsp." .. file:gsub("%.lua$", "")
    require(module_name)
  end
end
