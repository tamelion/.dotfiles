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
  }
  --"folke/which-key.nvim",

}

-- TODO install more!
-- "folke/which-key.nvim"
-- "akinsho/toggleterm.nvim"
--
