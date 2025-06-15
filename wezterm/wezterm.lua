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
    weight = "DemiBold",
    stretch = "Expanded",
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
config.window_background_opacity = 0.85
config.macos_window_background_blur = 40

--- miscileneous keybindings
config.keys = {
    {
        key = "Enter",
        mods = "ALT",
        action = wezterm.action.DisableDefaultAssignment,
    },
    {
        key = "f",
        mods = "ALT",
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

-- and finally, return the configuration to wezterm
return config
