return {
  {
    'folke/tokyonight.nvim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      vim.cmd("colorscheme tokyonight")
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', 'folke/tokyonight.nvim' },
    config = {
      options = {
        theme = 'tokyonight',
        section_separators = '',
        component_separators = '|'
      }
    }
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    config = true
  },
  {
    'phaazon/hop.nvim',
    keys = {
      { 'f', "<cmd>HopChar2<cr>", desc = "Hop to any word" },
    },
    config = true
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = { 
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    keys = {
      { "<leader>t", "<cmd>Neotree reveal toggle<cr>", desc = "NeoTree" },
    },
    config = function()
      -- Unless you are still migrating, remove the deprecated commands from v1.x
      vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
      require("neo-tree").setup()
    end,
  },

  --"folke/which-key.nvim",

}

-- TODO install more!
-- "folke/which-key.nvim"
-- "akinsho/toggleterm.nvim"
--
-- Close brackets!
-- Editor config
-- Linter / prettier
-- Language highlighting
-- Completion
--
