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

    -- lsp and completion
    use "hrsh7th/cmp-nvim-lsp" -- LSP source for nvim-cmp
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/nvim-cmp"
    use "onsails/lspkind-nvim" -- icon
    use(
      {
        "SirVer/ultisnips",
        config = function()
          vim.g.UltiSnipsExpandTrigger = "<Plug>(ultisnips_expand)"
          vim.g.UltiSnipsJumpForwardTrigger = "<Plug>(ultisnips_jump_forward)"
          vim.g.UltiSnipsJumpBackwardTrigger = "<Plug>(ultisnips_jump_backward)"
          vim.g.UltiSnipsListSnippets = "<c-x><c-s>"
          vim.g.UltiSnipsRemoveSelectModeMapping = 0
        end
      }
    )
    use "honza/vim-snippets"
    use "quangnguyen30192/cmp-nvim-ultisnips"
    use "christianchiarulli/nvcode-color-schemes.vim"
    use "neovim/nvim-lspconfig" -- Collection of configurations for built-in LSP client

    -- buffer
    use {"akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons"}

    -- statusline
    use {
      "glepnir/galaxyline.nvim",
      branch = "main",
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

    use "windwp/nvim-autopairs"

    use "nvim-treesitter/nvim-treesitter-refactor"

    use "romgrk/nvim-treesitter-context"

    use "mg979/vim-visual-multi"

    use "iamcco/markdown-preview.nvim"
  end
)
