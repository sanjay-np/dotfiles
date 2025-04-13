-- Pull in the wezterm API
local wezterm = require("wezterm")
local action = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.adjust_window_size_when_changing_font_size = false
config.max_fps = 120

-- Color scheme
config.color_scheme = "Catppuccin Mocha"

-- 0x96f theme Color scheme
-- local theme = require("colorscheme.0x96f")
-- config.colors = theme

-- -- Font settings
config.font = wezterm.font({
	family = "GeistMono Nerd Font",
	weight = "Bold",
	stretch = "Normal",
})
config.font_size = 16.0
config.line_height = 1.2

config.term = "xterm-256color"

-- Appearance settings

config.window_decorations = "RESIZE"
config.window_padding = {
	left = 5,
	right = 5,
	top = 5,
	bottom = 5,
}
config.window_background_opacity = 0.90
config.macos_window_background_blur = 50

-- Keybindings --
-- Leader key
config.leader = { key = "q", mods = "ALT", timeout_milliseconds = 2000 }

--- Keybindings
config.keys = {
	{
		mods = "LEADER",
		key = "c",
		action = action.SpawnTab("CurrentPaneDomain"),
	},
	{
		mods = "LEADER",
		key = "x",
		action = action.CloseCurrentPane({ confirm = true }),
	},
	{
		mods = "LEADER",
		key = "b",
		action = action.ActivateTabRelative(-1),
	},
	{
		mods = "LEADER",
		key = "|",
		action = action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "-",
		action = action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "h",
		action = action.ActivatePaneDirection("Left"),
	},
	{
		mods = "LEADER",
		key = "j",
		action = action.ActivatePaneDirection("Down"),
	},
	{
		mods = "LEADER",
		key = "k",
		action = action.ActivatePaneDirection("Up"),
	},
	{
		mods = "LEADER",
		key = "l",
		action = action.ActivatePaneDirection("Right"),
	},
	{
		mods = "LEADER",
		key = "LeftArrow",
		action = action.AdjustPaneSize({ "Left", 5 }),
	},
	{
		mods = "LEADER",
		key = "RightArrow",
		action = action.AdjustPaneSize({ "Right", 5 }),
	},
	{
		mods = "LEADER",
		key = "DownArrow",
		action = action.AdjustPaneSize({ "Down", 5 }),
	},
	{
		mods = "LEADER",
		key = "UpArrow",
		action = action.AdjustPaneSize({ "Up", 5 }),
	},
	{
		key = "LeftArrow",
		mods = "OPT",
		action = action.SendKey({ key = "b", mods = "ALT" }),
	},
	{
		key = "RightArrow",
		mods = "OPT",
		action = action.SendKey({ key = "f", mods = "ALT" }),
	},
	{
		-- Maximizing one window over the others
		mods = "LEADER",
		key = "m",
		action = action.TogglePaneZoomState,
	},
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

for i = 0, 9 do
	-- leader + number to activate that tab
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = wezterm.action.ActivateTab(i),
	})
end

-- tab bar
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.tab_and_split_indices_are_zero_based = true

-- tmux status
wezterm.on("update-right-status", function(window, _)
	local SOLID_LEFT_ARROW = ""
	local ARROW_FOREGROUND = { Foreground = { Color = "#000000" } }
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
end)


-- and finally, return the configuration to wezterm
return config
