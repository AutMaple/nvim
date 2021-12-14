require("plugins")

-- options and maping
require("core.options")
require("core.mapping")

-- plugin settings
require("plugin.dashboard")
require("plugin.nvimtree")
require("plugin.treesitter")
require("plugin.telescope")
require("plugin.lspconfig")
require("plugin.theme")
require("plugin.bufferline")
require("plugin.galaxyline")
require("plugin.nerdcomment")
require("plugin.colorizer")
require("plugin.formatter")
require("plugin.autopairs")
require("plugin.markdownpreview")

--using lua inspect the content of Object
function _G.put(...)
  local objects = {}
  for i = 1, select("#", ...) do
    local v = select(i, ...)
    table.insert(objects, vim.inspect(v))
  end

  print(table.concat(objects, "\n"))
  return ...
end
