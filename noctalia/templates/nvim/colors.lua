local ok, base16 = pcall(require, 'base16-colorscheme')
if not ok then return end

base16.setup {
  base00 = "{{colors.background.default.hex}}", -- BG (Fundo principal)
  base01 = "{{colors.surface_container_low.default.hex}}", -- BG Light (Linha atual/Highlight)
  base02 = "{{colors.surface_container_highest.default.hex | darken: 5}}", -- BG Selection (Destaque visual)
  base03 = "{{colors.surface_bright.default.hex}}", -- Comments (Cinza médio, muito mais legível)
  base04 = "{{colors.outline.default.hex}}", -- FG Dark (Status Bars, Números)
  base05 = "{{colors.on_surface_variant.default.hex}}", -- FG (Texto principal, Operadores)
  base06 = "{{colors.on_surface.default.hex}}", -- FG Light (Destaque de texto)
  base07 = "{{colors.on_background.default.hex | lighten: 5}}", -- FG Lighter (Quase branco/rosa muito claro)

  base08 = "{{colors.primary.default.hex | lighten: 8}}", -- WHITE Variables
  base09 = "{{colors.primary.default.hex | blend: '#f09898', 0.8}}", -- RED
  base0A = "{{colors.primary.default.hex | blend: '#f3e198', 0.8}}", -- YELLOW
  base0B = "{{colors.primary.default.hex | blend: '#a6e3a1', 0.8}}", -- GREEN (Menta/Sálvia pastel)
  base0C = "{{colors.primary.default.hex | blend: '#74c7ec', 0.8}}", -- CYAN (Azul turquesa pastel)
  base0D = "{{colors.primary.default.hex | blend: '#5140fa', 0.8}}", -- BLUE
  base0E = "{{colors.primary.default.hex | blend: '#f5c2e7', 0.8}}", -- MAGENTA
  base0F = "{{colors.outline.default.hex}}", -- GRAY Deprecated, Symbols , . :
}
