-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors
local M = {}

-- These are based on
M.override = {
  St_gitIcons = {
    bold = false,
  },
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },
}

return M
