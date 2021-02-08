-- Colorscheme overrides
vim.cmd("hi link xmlEndTag xmlTag")
vim.cmd("hi htmlArg gui=italic")
vim.cmd("hi Comment gui=italic")
vim.cmd("hi Type gui=italic")
vim.cmd("hi htmlArg cterm=italic")
vim.cmd("hi Type cterm=italic")

local embark = {
  bg_dark = "#100E23",
  bg = "#1e1c31",
  space2 = "#2D2B40",
  space3 = "#3E3859",
  space4 = "#585273",
  fg_dark ="#8A889D",
  fg ="#cbe3e7",
  red = "#F48FB1",
  dark_red = "#F02E6E",
  green = "#A1EFD3",
  dark_green = "#62d196",
  yellow = "#ffe6b3",
  dark_yellow = "#F2B482",
  blue = "#91ddff",
  dark_blue = "#65b2ff",
  purple = "#d4bfff",
  dark_purple ="#a37acc",
  cyan = "#87DFEB",
  dark_cyan = "#63f2f1"
}

local themes = {
  embark = embark
}

local get_theme = function()
  theme = themes[os.getenv("THEME")] or embark
  return theme
end

return {
  get_theme = get_theme
}
