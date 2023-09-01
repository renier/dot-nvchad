---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

local modes = {
  ["n"] = { "NORMAL", "St_NormalMode" },
  ["no"] = { "NORMAL (no)", "St_NormalMode" },
  ["nov"] = { "NORMAL (nov)", "St_NormalMode" },
  ["noV"] = { "NORMAL (noV)", "St_NormalMode" },
  ["noCTRL-V"] = { "NORMAL", "St_NormalMode" },
  ["niI"] = { "NORMAL i", "St_NormalMode" },
  ["niR"] = { "NORMAL r", "St_NormalMode" },
  ["niV"] = { "NORMAL v", "St_NormalMode" },
  ["nt"] = { "NTERMINAL", "St_NTerminalMode" },
  ["ntT"] = { "NTERMINAL (ntT)", "St_NTerminalMode" },

  ["v"] = { "VISUAL", "St_VisualMode" },
  ["vs"] = { "V-CHAR (Ctrl O)", "St_VisualMode" },
  ["V"] = { "V-LINE", "St_VisualMode" },
  ["Vs"] = { "V-LINE", "St_VisualMode" },
  [""] = { "V-BLOCK", "St_VisualMode" },

  ["i"] = { "INSERT", "St_InsertMode" },
  ["ic"] = { "INSERT (completion)", "St_InsertMode" },
  ["ix"] = { "INSERT completion", "St_InsertMode" },

  ["t"] = { "TERMINAL", "St_TerminalMode" },

  ["R"] = { "REPLACE", "St_ReplaceMode" },
  ["Rc"] = { "REPLACE (Rc)", "St_ReplaceMode" },
  ["Rx"] = { "REPLACEa (Rx)", "St_ReplaceMode" },
  ["Rv"] = { "V-REPLACE", "St_ReplaceMode" },
  ["Rvc"] = { "V-REPLACE (Rvc)", "St_ReplaceMode" },
  ["Rvx"] = { "V-REPLACE (Rvx)", "St_ReplaceMode" },

  ["s"] = { "SELECT", "St_SelectMode" },
  ["S"] = { "S-LINE", "St_SelectMode" },
  [""] = { "S-BLOCK", "St_SelectMode" },
  ["c"] = { "COMMAND", "St_CommandMode" },
  ["cv"] = { "COMMAND", "St_CommandMode" },
  ["ce"] = { "COMMAND", "St_CommandMode" },
  ["r"] = { "PROMPT", "St_ConfirmMode" },
  ["rm"] = { "MORE", "St_ConfirmMode" },
  ["r?"] = { "CONFIRM", "St_ConfirmMode" },
  ["x"] = { "CONFIRM", "St_ConfirmMode" },
  ["!"] = { "SHELL", "St_TerminalMode" },
}

M.ui = {
  theme = "terafoxish",
  theme_toggle = { "terafoxish", "monekai" },

  hl_override = highlights.override,
  hl_add = highlights.add,

  statusline = {
    separator_style = {
      right = "",
      left = "",
    },

    overriden_modules = function(modules)
      modules[1] = (function()
        local sep_r = M.ui.statusline.separator_style.right
        local m = vim.api.nvim_get_mode().mode
        local current_mode = "%#" .. modes[m][2] .. "#" .. "  " .. modes[m][1]
        local mode_sep1 = "%#" .. modes[m][2] .. "Sep" .. "#" .. sep_r

        return current_mode .. " " .. mode_sep1
      end)()

      modules[2] = (function()
        local sep_r = M.ui.statusline.separator_style.right
        if not vim.b.gitsigns_head or vim.b.gitsigns_git_status then
          return ""
        end

        local git_status = vim.b.gitsigns_status_dict

        local added = (git_status.added and git_status.added ~= 0) and (" +" .. git_status.added) or ""
        local changed = (git_status.changed and git_status.changed ~= 0) and (" ±" .. git_status.changed) or ""
        local removed = (git_status.removed and git_status.removed ~= 0) and (" -" .. git_status.removed) or ""
        local branch_name = "  " .. git_status.head

        return "%#St_file_info#" .. branch_name .. added .. changed .. removed .. " " .. "%#St_file_sep#" .. sep_r
      end)()

      modules[3] = (function()
        -- local icon = " 󰈚 "
        -- local filename = (vim.fn.expand "%" == "" and "Empty ") or vim.fn.fnamemodify(vim.fn.expand "%", ":~:.")
        local filename = (vim.fn.expand "%" == "" and " Empty ") or " %f "

        -- if filename ~= "Empty " then
        --   local devicons_present, devicons = pcall(require, "nvim-web-devicons")
        --
        --   if devicons_present then
        --     local ft_icon = devicons.get_icon(filename)
        --     icon = (ft_icon ~= nil and " " .. ft_icon) or ""
        --   end
        --
        --   filename = " " .. filename .. " "
        -- end

        -- return "%#St_gitIcons#" .. icon .. filename .. "%#St_file_sep#"
        return "%#St_gitIcons#" .. filename .. "%#St_file_sep#"
      end)()

      modules[9] = (function()
        return ""
      end)()
    end,
  },

  tabufline = {
    overriden_modules = function(modules)
      modules[4] = (function()
        return ""
      end)()
    end,
  },

  nvdash = {
    buttons = {
      { "  Find File", "Spc f", "Telescope find_files" },
      -- { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
      { "󰈭  Find Word", "Spc F", "Telescope live_grep" },
      { "  Bookmarks", "Spc m a", "Telescope marks" },
      { "  Themes", "Spc t h", "Telescope themes" },
      { "  Mappings", "Spc c h", "NvCheatsheet" },
    },
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
