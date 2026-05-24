local ok, base16 = pcall(require, 'base16-colorscheme')
if not ok then return end

base16.setup {
  base00 = "{{colors.background.default.hex}}", -- BG (Fundo principal)
  base01 = "{{colors.surface_container_low.default.hex}}", -- BG Light (Linha atual/Highlight)
  base02 = "{{colors.surface_container_highest.default.hex}}", -- BG Selection (Destaque visual)
  base03 = "{{colors.surface_bright.default.hex}}", -- Comments (Cinza médio, muito mais legível)
  base04 = "{{colors.outline.default.hex}}", -- FG Dark (Status Bars, Números)
  base05 = "{{colors.on_surface_variant.default.hex}}", -- FG (Texto principal, Operadores)
  base06 = "{{colors.on_surface.default.hex}}", -- FG Light (Destaque de texto)
  base07 = "{{colors.on_background.default.hex | lighten: 5}}", -- FG Lighter (Quase branco/rosa muito claro)

  base08 = "{{colors.terminal_normal_white.default.hex}}", -- WHITE Variables
  base09 = "{{colors.terminal_normal_red.default.hex}}", -- RED Constants, Int, Bool, Numbers
  base0A = "{{colors.terminal_normal_yellow.default.hex}}", -- YELLOW Classes, Object Primitives, Search BG
  base0B = "{{colors.terminal_normal_green.default.hex}}", -- GREEN Strings
  base0C = "{{colors.terminal_normal_cyan.default.hex}}", -- CYAN Support Chars, Regular Expressions, Escape Char
  base0D = "{{colors.terminal_normal_blue.default.hex}}", -- BLUE Dinamic Keywords, (Functions, MEthods)
  base0E = "{{colors.terminal_normal_magenta.default.hex}}", -- MAGENTA Static Keywords, ? : if else for
  base0F = "{{colors.terminal_normal_black.default.hex}}", -- GRAY Deprecated, Symbols , . :
}
