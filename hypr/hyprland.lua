require('custom.monitors')
require('custom.execs')
require('custom.envs')
require('custom.configs')
require('custom.plugins')
require('custom.animations')
require('custom.binds')
require('custom.rules')
require('custom.colors')


-- >>> HYPRLAND VISUAL EDITOR (HVE) <<<
pcall(function() dofile(os.getenv("HOME") .. "/.cache/noctalia/HVE/overlay.lua") end)
-- <<< HYPRLAND VISUAL EDITOR (HVE) <<<
