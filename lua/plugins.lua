-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require("packer").startup(
  function()
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    use "glepnir/dashboard-nvim"

    use {
      "nvim-telescope/telescope.nvim",
      requires = {{"nvim-lua/plenary.nvim"}}
    }

    use {
      "kyazdani42/nvim-tree.lua",
      requires = {
        "kyazdani42/nvim-web-devicons" -- optional, for file icon
      },
      config = function()
        require "nvim-tree".setup {}
      end
    }

    use {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}

    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate"
    }

    use "neovim/nvim-lspconfig" -- Collection of configurations for built-in LSP client
    use "hrsh7th/nvim-cmp" -- Autocompletion plugin
    use "hrsh7th/cmp-nvim-lsp" -- LSP source for nvim-cmp
    use "saadparwaiz1/cmp_luasnip" -- Snippets source for nvim-cmp
    use "L3MON4D3/LuaSnip" -- Snippets plugin

    use "christianchiarulli/nvcode-color-schemes.vim"

    -- buffer
    use {"akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons"}

    -- statusline
    use {
      "glepnir/galaxyline.nvim",
      branch = "main",
      -- your statusline
      -- config = function() require'my_statusline' end,
      -- some optional icons
      requires = {"kyazdani42/nvim-web-devicons", opt = true}
    }

    -- comment
    use {"preservim/nerdcommenter"}

    -- Underlines the word under the cursor
    use "itchyny/vim-cursorword"

    -- A high-performance color highlighter for Neovim
    use "norcalli/nvim-colorizer.lua"

    use "Yggdroot/indentLine"

    use "mhartington/formatter.nvim"
  end
)
