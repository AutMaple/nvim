vim.g.nvcode_termcolors = 256

-- vim.o.termguicolors = true

vim.cmd [[
try
  " colorscheme darkplus
  colorscheme onedark
catch /^Vim\%((\a\+)\)\=:E185/
  " colorscheme default
  colorscheme onedark
  set background=dark
endtry
]]
