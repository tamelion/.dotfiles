-- Automagically included by Lazy
return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function()
          require("telescope").load_extension("fzf")
        end,
      },
    },
    config = true,
    keys = {
      {
        "<CR>",
        function()
          require("telescope.builtin").builtin()
        end,
        desc = "Show all telescope commands in telescope",
      },
      {
        "<leader><space>",
        function()
          require("telescope.builtin").git_files()
        end,
        desc = "[O]pen file from git repo",
      },
      {
        "<leader>b",
        function()
          require("telescope.builtin").buffers()
        end,
        desc = "Show open buffers",
      },
    },
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim"
    },
    config = function()
      require("telescope").load_extension("file_browser")
    end,
    keys = {
      {
        "<leader>f",
        "<cmd>Telescope file_browser hidden=true auto_depth=true path=%:p:h<cr>",
        desc = "Browse [f]iles",
      },
    },
  },
  {
    "debugloop/telescope-undo.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim"
    },
    config = function()
      require("telescope").load_extension("undo")
    end,
    keys = {
      {
        "<leader>u",
        "<cmd>Telescope undo<cr>",
        desc = "[U]ndo tree inside telescope",
      },
    },
  },
}
