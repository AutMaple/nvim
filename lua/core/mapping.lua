local key_map = vim.api.nvim_set_keymap

local noremap = {noremap = true}
local nore_silent = {noremap = true, silent = true}
local expr = {expr = true}

local function inject_map()
  local mapping = {
    -- 光标移动
    -- {"", "i", "k", noremap},
    -- {"", "k", "j", noremap},
    -- {"", "j", "h", noremap},
    -- {"", "m", "i", noremap},
    -- {"", "M", "I", noremap},
    -- {"", "K", "4j", noremap},
    -- {"", "I", "4k", noremap},
    {"", "gl", "$", noremap},
    {"", "gh", "^", noremap},
    -- 复制粘贴
    {"", "Y", '"+y', nore_silent},
    {"n", "yw", "yiw", nore_silent},
    {"n", 'y"', 'yi"', nore_silent},
    {"n", "y(", "yi(", nore_silent},
    {"n", "y{", "yi{", nore_silent},
    {"n", "yl", "yw", nore_silent},
    -- 删除相关的操作
    {"n", "dw", "diw", nore_silent},
    {"n", 'd"', 'di"', nore_silent},
    {"n", "d(", "di(", nore_silent},
    {"n", "d{", "di{", nore_silent},
    {"n", "dl", "dw", nore_silent},
    -- 删除并进入插入模式
    {"n", "cw", "ciw", nore_silent},
    {"n", 'c"', 'ci"', nore_silent},
    {"n", "c(", "ci(", nore_silent},
    {"n", "c{", "ci{", nore_silent},
    {"n", "cl", "cw", nore_silent},
    {"n", "vw", "viw", nore_silent},
    {"n", 'v"', 'vi"', nore_silent},
    {"n", "v(", "vi(", nore_silent},
    {"n", "v{", "vi{", nore_silent},
    {"n", "vl", "vw", nore_silent},
    -- 全选
    {"", "<C-a>", "ggVG", nore_silent},
    -- 取消高亮
    {"", "<leader><CR>", ":nohlsearch<CR>", nore_silent},
    -- 将光标所在行放在中间
    {"n", "ff", "zz", noremap},
    -- 在高亮字符串中移动并将光标移动到屏幕中间
    {"n", "=", "nzz", noremap},
    {"n", "-", "Nzz", noremap},
    {"", "\\", "=", noremap},
    {"", ";", ":", noremap},
    -- 分屏操作
    {"", "sl", ":set splitright<CR>:vsplit<CR>", nore_silent},
    {"", "sh", ":set nosplitright<CR>:vsplit<CR>", nore_silent},
    {"", "sk", ":set nosplitbelow<CR>:split<CR>", nore_silent},
    {"", "sj", ":set splitbelow<CR>:split<CR>", nore_silent},
    -- 水平分屏和垂直分屏的切换
    {"", "sv", "<C-w>t<C-w>H", nore_silent},
    {"", "sh", "<C-w>t<C-w>K", nore_silent},
    -- 分屏之间的切换
    {"", "<Leader>k", "<C-w>k", nore_silent},
    {"", "<Leader>j", "<C-w>j", nore_silent},
    {"", "<Leader>h", "<C-w>h", nore_silent},
    {"", "<Leader>l", "<C-w>l", nore_silent},
    -- 控制分屏的大小
    {"", "<up>", ":res +5<CR>", nore_silent},
    {"", "<down>", ":res -5<CR>", nore_silent},
    {"", "<left>", ":vertical resize -5<CR>", nore_silent},
    {"", "<right>", ":vertical resize +5<CR>", nore_silent},
    -- Plug nvimtree
    {"n", "tt", ":NvimTreeToggle<CR>", nore_silent},
    {"n", "tr", ":NvimTreeRefresh<CR>", nore_silent},
    -- Plug telescope
    {"n", "<leader>ff", "<cmd>Telescope find_files<CR>", nore_silent},
    {"n", "<leader>fg", "<cmd>Telescope live_grep<CR>", nore_silent},
    {"n", "<leader>fb", "<cmd>Telescope buffers<CR>", nore_silent},
    {"n", "<leader>fh", "<cmd>Telescope help_tags<CR>", nore_silent},
    -- Plug bufferline
    {"n", "cb", ":BufferLinePick<CR>", nore_silent},
    {"n", "<A-l>", ":BufferLineCycleNext<CR>", nore_silent},
    {"n", "<A-j>", ":BufferLineCyclePrev<CR>", nore_silent},
    {"n", "<C-l>", ":BufferLineMoveNext<CR>", nore_silent},
    {"n", "<C-j>", ":BufferLineMovePrev<CR>", nore_silent},
    {"n", "<leader>w", ":bd<CR>", nore_silent},
    -- Plug formatter
    {"n", "<A-F>", ":Format<CR>", nore_silent},
    -- Plug markdown-preview
    {"n", "tp", "<Plug>MarkdownPreviewToggle", {}}
  }
  for _, value in pairs(mapping) do
    key_map(value[1], value[2], value[3], value[4])
  end
end

inject_map()
