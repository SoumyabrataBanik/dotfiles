local wezterm = require("wezterm")
local config = wezterm.config_builder()
local action = wezterm.action

-- Default program
config.default_prog = { "zsh" }

-- Window
config.window_background_opacity = 0.7

-- Tab Bar
config.enable_tab_bar = false

-- Font
config.font = wezterm.font("BerkeleyMono NerdFont Mono")
config.freetype_load_target = "HorizontalLcd"
config.font_size = 13

-- Color Schemes
config.color_scheme = "Cyberpunk_theme_1"
config.color_scheme_dirs = { "~/dotfiles/.config/wezterm/themes" }

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
