require("full-border"):setup()
require("bunny"):setup({
	hops = {
    -- Common
		{ key = "/", path = "󰣇 Root" },
		{ key = "h", path = "~", desc = " Home" },
		{ key = "D", path = "~/Documentos", desc = "󱧶 Documentos" },
		{ key = "w", path = "~/Imagens/Wallpapers", desc = "󰋩 Wallpapers" },
		{ key = "a", path = "/usr/share/applications", desc = " Apps" },
		{ key = "d", path = "~/Downloads", desc = "󰉍 Downloads" },
    { key = "p", path = "~/Documentos/Projetos", desc = " Projetos" },
    { key = "l", path = "~/.local", desc = " Local" },

    -- Configs
		{ key = { "c", "c" }, path = "~/.config", desc = " Config" },
		{ key = { "c", "h" }, path = "~/.config/hypr", desc = " Hyprland" },
		{ key = { "c", "y" }, path = "~/.config/yazi", desc = " Yazi" },
		{ key = { "c", "n" }, path = "~/.config/nvim", desc = " NVim" },
		{ key = { "c", "q" }, path = "~/.config/quickshell/ii", desc = " QuickShell" },
		{ key = { "c", "f" }, path = "~/.config/fish", desc = " Fish" },
		{ key = { "c", "k" }, path = "~/.config/kitty", desc = " Kitty" },
		{ key = { "c", "m" }, path = "~/.config/noctalia/templates", desc = " Matugen" },
	},
	desc_strategy = "path",
	ephemeral = false,
	tabs = false,
	notify = false,
	fuzzy_cmd = "fzf",
})

th.git = th.git or {}
th.git.modified_sign = " "
th.git.added_sign = " "
th.git.untracked_sign = " "
th.git.ignored_sign = " "
th.git.deleted_sign = " "
th.git.updated_sign = " "
th.git.modified = ui.Style():fg("blue")
th.git.added = ui.Style():fg("green")
th.git.untracked = ui.Style():fg("darkgray")
th.git.ignored = ui.Style():fg("gray")
th.git.deleted = ui.Style():fg("red")
th.git.updated = ui.Style():fg("cyan")
require("git"):setup()

require("gvfs"):setup({
  which_keys = "1234567890qwertyuiopasdfghjklzxcvbnm-=[]\\;',./!@#$%^&*()_+{}|:\"<>?",
  save_path = os.getenv("HOME") .. "/.config/yazi/gvfs.private",
  save_path_automounts = os.getenv("HOME") .. "/.config/yazi/gvfs_automounts.private",
  input_position = { "center", y = 0, w = 60 },
  save_password_autoconfirm = true,
})
