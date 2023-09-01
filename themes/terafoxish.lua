local M = {}

M.base_30 = {
  white = "#e6eaea",
  black = "#152528",
  darker_black = "#0f1c1e",
  black2 = "#0f1c1e",
  one_bg = "#2f3f42",
  one_bg2 = "#3e4e51",
  one_bg3 = "#4e5e61",
  grey = "#23393e",
  grey_fg = "#60707b",
  grey_fg2 = "#30464b",
  light_grey = "#60707b",
  red = "#e85c51",
  baby_pink = "#d38d97",
  pink = "#ad6771",
  line = "#254147",
  green = "#7aa4a1",
  vibrant_green = "#8eb2af",
  blue = "#5a93aa",
  nord_blue = "#5a93aa",
  yellow = "#fda47f",
  sun = "#fdb292",
  purple = "#b97490",
  dark_purple = "#ad5c7c",
  teal = "#89aeb8",
  orange = "#ff8349",
  cyan = "#a1cdd8",
  statusline_bg = "#0f1c1e",
  lightbg = "#2d4f56",
  pmenu_bg = "#5a93aa",
  folder_bg = "#5a93aa",
}

M.base_16 = {
  base00 = "#152528",
  base01 = "#254147",
  base02 = "#293e40",
  base03 = "#60707b",
  base04 = "#cbd9d8",
  base05 = "#e6eaea",
  base06 = "#eaeeee",
  base07 = "#000000",
  base08 = "#e6eaea",
  base09 = "#e97246",
  base0A = "#fda47f",
  base0B = "#678d8a",
  base0C = "#afd4de",
  base0D = "#5a8a9d",
  base0E = "#ad5c7c",
  base0F = "#e6eaea",
}

M.polish_hl = {
  -- Syntax
  Comment = {
    fg = M.base_16.base03,
  },
  Delimiter = {
    fg = M.base_16.base05,
  },
  Include = {
    fg = M.base_30.baby_pink,
  },
  Keyword = {
    fg = M.base_30.dark_purple,
  },
  Conditional = {
    fg = M.base_30.purple,
  },
  Repeat = {
    fg = M.base_30.purple,
  },
  ["@constant"] = {
    fg = M.base_16.base09,
  },
  ["@keyword.return"] = {
    fg = M.base_30.red,
  },
  ["@keyword.function"] = {
    fg = M.base_30.dark_purple,
  },
  ["@type.builtin"] = {
    fg = M.base_16.base0C,
  },
  ["@namespace"] = {
    fg = M.base_16.base0C,
  },
  ["@property"] = {
    fg = M.base_16.base0D,
  },
  ["@method.call"] = {
    fg = M.base_30.pmenu_bg,
  },

  -- General
  LineNr = {
    fg = "#4d6c6c",
  },
  LineNrAbove = {
    fg = "#4d6c6c",
  },
  LineNrBelow = {
    fg = "#4d6c6c",
  },
  CursorLineNr = {
    bg = M.base_30.grey,
  },
  CursorLine = {
    bg = M.base_30.grey,
  },
  CursorLineSign = {
    bg = M.base_30.grey,
  },
  TelescopeSelection = {
    bg = M.base_30.grey,
  },
  TelescopeSelectionCaret = {
    bg = M.base_30.grey,
  },
  St_NormalModeSep = {
    bg = M.base_30.lightbg,
  },
  St_InsertModeSep = {
    bg = M.base_30.lightbg,
  },
  St_CommandModeSep = {
    bg = M.base_30.lightbg,
  },
  St_VisualModeSep = {
    bg = M.base_30.lightbg,
  },
  St_gitIcons = {
    fg = M.base_30.white,
  },
  St_pos_sep = {
    bg = M.base_30.darker_black,
  },
  WinSeparator = {
    fg = M.base_30.darker_black,
  },
}

M.type = "dark"

M = require("base46").override_theme(M, "terafoxish")

return M
