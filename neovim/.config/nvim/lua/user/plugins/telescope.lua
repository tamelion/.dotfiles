-- Automagically included by Lazy
return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      "nvim-lua/plenary.nvim",
      build = "make"
    },
  },
  keys = {
    {
      "<CR>",
      function()
        require("telescope.builtin").builtin()
      end,
      desc = "Show all telescope commands in telescope",
    },
    {
      "<leader>o",
      function()
        require("telescope.builtin").git_files()
      end,
      desc = "[O]pen file from git repo",
    },
    {
      "<leader><space>",
      function()
        require("telescope.builtin").buffers()
      end,
      desc = "Show open buffers",
    },
  },
  config = function(plugin)
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    telescope.setup {
      defaults = {
      },
    }
    telescope.load_extension("fzf")
  end,
}
