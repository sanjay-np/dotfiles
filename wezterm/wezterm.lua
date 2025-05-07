-- Pull in the wezterm API
local wezterm = require("wezterm")
local action = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.adjust_window_size_when_changing_font_size = false
config.max_fps = 120

-- Color scheme
config.color_scheme = "Tokyo Night (Gogh)"

-- 0x96f theme Color scheme
-- local theme = require("colorscheme.0x96f")
-- config.colors = theme

-- -- Font settings
config.font = wezterm.font({
	family = "GeistMono Nerd Font",
	weight = "Bold",
	stretch = "Normal",
})
config.font_size = 15.5
config.line_height = 1.2

config.term = "xterm-256color"

-- Appearance settings

config.window_decorations = "RESIZE"
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.window_background_opacity = 0.95
config.macos_window_background_blur = 30

-- Keybindings --
-- Leader key
config.leader = { key = "w", mods = "ALT", timeout_milliseconds = 2000 }

--- Keybindings
config.keys = {
	{
		key = "f",
		mods = "LEADER",
		action = action.ToggleFullScreen,
	},
}

config.mouse_bindings = {
	{
		event = {
			Up = {
				streak = 1,
				button = "Left",
			},
		},
		mods = "CTRL",
		action = wezterm.action.OpenLinkAtMouseCursor,
	},
}

-- tab bar
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = false
config.use_fancy_tab_bar = false
config.tab_and_split_indices_are_zero_based = false
--
-- tmux status
wezterm.on("update-right-status", function(window, pane)
	local SOLID_LEFT_ARROW = ""
	local ARROW_FOREGROUND = { Foreground = { Color = "#c6a0f6" } }
	local prefix = ""

	if window:leader_is_active() then
		prefix = " " .. utf8.char(0x1f30a) -- ocean wave
		SOLID_LEFT_ARROW = utf8.char(0xe0b2)
	end

	if window:active_tab():tab_id() ~= 0 then
		ARROW_FOREGROUND = { Foreground = { Color = "#1e2030" } }
	end -- arrow color based on if tab is first pane

	window:set_left_status(wezterm.format({
		{ Background = { Color = "#b7bdf8" } },
		{ Text = prefix },
		ARROW_FOREGROUND,
		{ Text = SOLID_LEFT_ARROW },
	}))

	local date = wezterm.run_child_process({ "date" })
	date = wezterm.strftime("%Y/%m/%d %I:%M %p ")

	window:set_right_status(wezterm.format({
		{ Attribute = { Italic = false } },
		{ Text = " " .. date },
	}))
end)
-- and finally, return the configuration to wezterm
return config
