local function load_options()
  local global_local = {
    encoding = "utf-8",
    autowriteall = true, -- 在文件之间跳转时，自动保存文件
    mouse = "a", -- 允许使用鼠标
    ignorecase = true, -- 忽略大小写
    smartcase = true,
    background = "dark",
    termguicolors = true,
    scrolloff = 7
  }
  local window_local = {
    number = true,
    relativenumber = true,
    cursorline = true,
    wrap = false,
    foldmethod = "manual"
  }
  local buffer_local = {
    expandtab = true,
    tabstop = 2,
    shiftwidth = 2,
    softtabstop = 2,
    smartindent = true,
    syntax = "ON"
  }

  local global_var = {
    mapleader = " "
  }

  for name, value in pairs(global_var) do
    vim.g[name] = value
  end

  for name, value in pairs(global_local) do
    vim.o[name] = value
  end

  for name, value in pairs(window_local) do
    vim.wo[name] = value
  end

  for name, value in pairs(buffer_local) do
    vim.bo[name] = value
  end
end

load_options()
