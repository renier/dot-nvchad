---@type MappingsTable
local M = {}

M.disabled = {
  n = {
    ["<leader>ch"] = "",
    ["<leader>ca"] = "",
    ["<leader>cm"] = "",
    ["<leader>cc"] = "",
    ["<leader>wK"] = "",
    ["<leader>wk"] = "",
    ["<leader>wa"] = "",
    ["<leader>wl"] = "",
    ["<leader>wr"] = "",
  },
}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>h"] = { ":noh <CR>", "Clear highlights" },
    ["<leader>w"] = { "<cmd> w <CR>", "Save file" },
  },
}

-- more keybinds!

M.tabufline = {
  plugin = true,

  n = {
    -- cycle through buffers
    ["<S-l>"] = {
      function()
        require("nvchad.tabufline").tabuflineNext()
      end,
      "Goto next buffer",
    },

    ["<S-h>"] = {
      function()
        require("nvchad.tabufline").tabuflinePrev()
      end,
      "Goto prev buffer",
    },

    -- close buffer + hide terminal buffer
    ["<leader>c"] = {
      function()
        require("nvchad.tabufline").close_buffer()
      end,
      "Close buffer",
    },
  },
}

M.comment = {
  plugin = true,

  -- toggle comment in both modes
  n = {
    ["<leader>gc"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "Toggle comment",
    },
  },

  v = {
    ["<leader>gc"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "Toggle comment",
    },
  },
}

M.lspconfig = {
  plugin = true,

  -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions

  n = {

    ["<leader>lk"] = {
      function()
        vim.diagnostic.goto_prev { float = { border = "rounded" } }
      end,
      "Goto prev",
    },

    ["<leader>lj"] = {
      function()
        vim.diagnostic.goto_next { float = { border = "rounded" } }
      end,
      "Goto next",
    },

    ["<leader>la"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "LSP code action",
    },

    ["gr"] = {
      function()
        require("telescope.builtin").lsp_references()
      end,
      "LSP references",
    },
  },
}

M.nvimtree = {
  plugin = true,

  n = {
    -- toggle
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
  },
}

M.telescope = {
  plugin = true,

  n = {
    -- find
    ["<leader>f"] = { "<cmd> Telescope find_files <CR>", "Find files" },
    ["<leader>F"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
    ["<leader>b"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },
    ["<leader>z"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },

    -- git
    ["<leader>gm"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
    ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "Git status" },

    -- pick a hidden term
    ["<leader>pt"] = { "<cmd> Telescope terms <CR>", "Pick hidden term" },

    -- theme switcher
    ["<leader>th"] = { "<cmd> Telescope themes <CR>", "Nvchad themes" },

    ["<leader>ma"] = { "<cmd> Telescope marks <CR>", "telescope bookmarks" },

    ["<leader>o"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "LSP formatting",
    },
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>", "Add breakpoint" },
  },
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dt"] = {
      function()
        require("dap-go").debug_test()
      end,
      "Debug go test",
    },
    ["<leader>du"] = {
      function()
        require("dapui").toggle()
      end,
      "Open debug UI",
    },
  },
}

M.whichkey = {
  plugin = true,

  n = {
    ["<leader>WK"] = {
      function()
        vim.cmd "WhichKey"
      end,
      "Which-key all keymaps",
    },
    ["<leader>Wk"] = {
      function()
        local input = vim.fn.input "WhichKey: "
        vim.cmd("WhichKey " .. input)
      end,
      "Which-key query lookup",
    },
  },
}

return M
