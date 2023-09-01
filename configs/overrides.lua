local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "vimdoc",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "json",
    "go",
    "git_config",
    "toml",
    "gitignore",
    "gitcommit",
    "gomod",
    "gosum",
    "gowork",
    "hcl",
    "markdown",
    "python",
    "ruby",
    "terraform",
    "csv",
    "xml",
    "yaml",
    "graphql",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
  highlight = {
    enable = true,
    use_languagetree = true,
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    -- "css-lsp",
    -- "html-lsp",
    "typescript-language-server",
    -- "deno",
    "prettier",

    -- c/cpp stuff
    -- "clangd",
    -- "clang-format",

    "gopls",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.telescope = {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
      "--glob",
      "!**/.git/*",
    },
  },
  pickers = {
    find_files = {
      find_command = {
        "rg",
        "--files",
        "--hidden",
        "--glob",
        "!**/.git/*",
      },
    },
  },
}

M.gitsigns = {
  signs = {
    add = { text = "│" },
    change = { text = "│" },
    delete = { text = "―" },
    topdelete = { text = "‾" },
    changedelete = { text = "~" },
    untracked = { text = "│" },
  },
}

return M
