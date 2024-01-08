
local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local opts = {
  sources = {
    null_ls.builtins.formatting.gofmt,
    null_ls.builtins.formatting.goimports,
    null_ls.builtins.diagnostics.pylint.with({
     extra_args = {"--rcfile", os.getenv("PYLINTRC")},
     diagnostics_postprocess = function(diagnostic)
     diagnostic.code = diagnostic.message_id
     end,
    }),
    null_ls.builtins.diagnostics.mypy.with({
    extra_args = function()
    local virtual = "/usr"
    return { "--python-executable", virtual .. "/bin/python3", "--config-file", os.getenv("MYPY_CFG") }
    end,
    }),
    null_ls.builtins.diagnostics.ruff,
  },
  on_attach = function (client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function ()
          vim.lsp.buf.format({bufnr=bufnr})
        end
      })
    end
  end
}
return opts
