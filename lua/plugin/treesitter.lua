vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2

require "nvim-treesitter.configs".setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  -- syntax highlight
  highlight = {
    enable = true, -- false will disable the whole extension
    additional_vim_regex_highlighting = false
  },
  -- auto selection
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",
      node_incremental = "<CR>",
      scope_incremental = "<TAB>", -- 全选 == <CR>+<TAB>
      node_decremental = "<BS>"
    }
  },
  refactor = {
    highlight_definitions = {enable = true},
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "grr"
      }
    },
    navigation = {
      enable = true,
      keymaps = {
        goto_definition = "gnd",
        list_definitions = "gnD",
        list_definitions_toc = "gO",
        goto_next_usage = "<a-*>",
        goto_previous_usage = "<a-#>"
      }
    }
  }
}

require "treesitter-context".setup {
  enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
  throttle = true, -- Throttles plugin updates (may improve performance)
  max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
  patterns = {
    -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
    -- For all filetypes
    -- Note that setting an entry here replaces all other patterns for this entry.
    -- By setting the 'default' entry below, you can control which nodes you want to
    -- appear in the context window.
    default = {
      "class",
      "function",
      "method"
      -- 'for', -- These won't appear in the context
      -- 'while',
      -- 'if',
      -- 'switch',
      -- 'case',
    }
    -- Example for a specific filetype.
    -- If a pattern is missing, *open a PR* so everyone can benefit.
    --   rust = {
    --       'impl_item',
    --   },
  }
}
