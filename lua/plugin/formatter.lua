local status, formatter = pcall(require, "formatter")

if (not status) then
  return
end

formatter.setup(
  {
    filetype = {
      lua = {
        --luafmt
        function()
          return {
            exe = "luafmt",
            args = {"--indent-count", 2, "--stdin"},
            stdin = true
          }
        end
      },
      python = {
        function()
          return {
            exe = "python3 -m autopep8",
            args = {
              "--in-place --aggressive --aggressive",
              vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))
            },
            stdin = false
          }
        end
      },
      cpp = {
        -- clang-format
        function()
          return {
            exe = "clang-format",
            args = {"--assume-filename", vim.api.nvim_buf_get_name(0)},
            stdin = true,
            cwd = vim.fn.expand("%:p:h") -- Run clang-format in cwd of the file.
          }
        end
      },
      c = {
        -- clang-format
        function()
          return {
            exe = "clang-format",
            args = {"--assume-filename", vim.api.nvim_buf_get_name(0)},
            stdin = true,
            cwd = vim.fn.expand("%:p:h") -- Run clang-format in cwd of the file.
          }
        end
      },
      rust = {
        -- Rustfmt
        function()
          return {
            exe = "rustfmt",
            args = {"--emit=stdout"},
            stdin = true
          }
        end
      },
      javascript = {
        -- prettier
        function()
          return {
            exe = "js-beautify",
            args = {"--file", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
            stdin = true
          }
        end
      },
      markdown = {
        -- markdown-format
        function()
          return {
            exe = "markdown-format",
            args = {"--file", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
            stdin = true
          }
        end
      },
      go = {
        function()
          return {
            exe = "gofmt",
            args = {"-w", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
            stdin = false
          }
        end
      }
    }
  }
)

-- 保存文件时，自动格式化
vim.api.nvim_exec(
  [[
      augroup FormatAutogroup
      	autocmd!
				autocmd BufWritePost *.rs,*.lua,*.py,*.cpp,*.c,*.js,*.md,*.go FormatWrite
      augroup END
  ]],
  true
)
