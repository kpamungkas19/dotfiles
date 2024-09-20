return {
  {
    "nvimdev/dashboard-nvim",
    enabled = false,
  },

  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup({
        default = true,
      })
    end,
  },

  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 5000,
      background_colour = "#000000",
      render = "wrapped-compact",
    },
  },
  -- LazyGit integration with Telescope
  {
    "kdheepak/lazygit.nvim",
    keys = {
      {
        ";c",
        ":LazyGit<Return>",
        silent = true,
        noremap = true,
      },
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,
    keys = {
      {

        "<leader>d",
        "<cmd>NvimTreeClose<cr><cmd>tabnew<cr><bar><bar><cmd>DBUI<cr>",
      },
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup({
        on_attach = function(bufnr)
          local api = require("nvim-tree.api")

          local function opts(desc)
            return {
              desc = "nvim-tree: " .. desc,
              buffer = bufnr,
              noremap = true,
              silent = true,
              nowait = true,
            }
          end

          -- default mappings
          api.config.mappings.default_on_attach(bufnr)

          -- custom mappings
          vim.keymap.set("n", "t", api.node.open.tab, opts("Tab"))
        end,
        actions = {
          open_file = {
            quit_on_open = true,
          },
        },
        sort = {
          sorter = "case_sensitive",
        },
        view = {
          width = 30,
          relativenumber = true,
        },
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = true,
          custom = {
            "node_modules/.*",
          },
        },
        log = {
          enable = true,
          truncate = true,
          types = {
            diagnostics = true,
            git = true,
            profile = true,
            watcher = true,
          },
        },
      })

      if vim.fn.argc(-1) == 0 then
        vim.cmd("NvimTreeFocus")
      end
    end,
  },
}
