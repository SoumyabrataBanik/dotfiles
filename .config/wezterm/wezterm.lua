local wezterm = require("wezterm")
local config = wezterm.config_builder()
local action = wezterm.action

-- Default program
config.default_prog = { "zsh" }

-- Disable wayland
config.enable_wayland = false

-- Window
config.window_background_opacity = 0.7

-- Tab Bar
config.enable_tab_bar = true

-- Font
config.font = wezterm.font("BerkeleyMono NerdFont Mono")
config.freetype_load_target = "HorizontalLcd"
config.font_size = 11.8

-- Color Schemes
config.color_scheme_dirs = { "~/dotfiles/.config/wezterm/themes" }
config.color_scheme = "Atom"

--window Padding
config.window_padding = {
	left = 2,
	right = 2,
	top = 0,
	bottom = 0,
}

-- Keymaps
config.keys = {
	{ key = "]", mods = "ALT", action = action.ActivateTabRelative(1) },
	{ key = "[", mods = "ALT", action = action.ActivateTabRelative(-1) },
}
for i = 1, 8 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "CTRL",
		action = action.ActivateTab(i - 1),
	})
end

return config
