local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options
  {
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope,
  },

  {
    "lewis6991/gitsigns.nvim",
    opts = overrides.gitsigns,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "mortepau/codicons.nvim",
  },

  {
    "mfussenegger/nvim-dap",
    init = function()
      require("core.utils").load_mappings "dap"
      local codicons = require "codicons"
      vim.fn.sign_define(
        "DapBreakpoint",
        { text = codicons.get "debug", texthl = "DiagnosticWarn", linehl = "", numhl = "" }
      )
      vim.fn.sign_define(
        "DapStopped",
        { text = codicons.get "debug-pause", texthl = "DiagnosticWarn", linehl = "", numhl = "" }
      )
    end,
    dependencies = "mortepau/codicons.nvim",
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup(opts)
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
      require("core.utils").load_mappings "dap_go"
    end,
  },

  {
    "tpope/vim-fugitive",
    lazy = true,
    event = "BufEnter",
    cond = function()
      local f = io.open(".git", "r")
      if f ~= nil then
        io.close(f)
        return true
      else
        return false
      end
    end,
  },

  {
    "ruifm/gitlinker.nvim",
    lazy = true,
    event = "BufEnter",
    cond = function()
      local f = io.open(".git", "r")
      if f ~= nil then
        io.close(f)
        return true
      else
        return false
      end
    end,
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("gitlinker").setup {
        opts = {
          add_current_line_on_normal_mode = true,
          action_callback = require("gitlinker.actions").copy_to_clipboard,
          print_url = true,
        },
        callbacks = {
          ["github.com"] = require("gitlinker.hosts").get_github_type_url,
          ["github.ibm.com"] = require("gitlinker.hosts").get_github_type_url,
          ["gitlab.com"] = require("gitlinker.hosts").get_gitlab_type_url,
          ["code.8labs.io"] = require("gitlinker.hosts").get_gitlab_type_url,
        },
        mappings = "<leader>gy",
      }
      local opts = { noremap = true, silent = true }
      local keymap = vim.api.nvim_set_keymap
      keymap("v", "gy", '<cmd>lua require"gitlinker".get_buf_range_url("v")<CR>', opts)
    end,
  },

  {
    "olexsmir/gopher.nvim",
    lazy = true,
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
