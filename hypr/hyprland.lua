-- CachyOS Hyprland Configuration
------------------
---- MONITORS ----
------------------
-- Montior wiki https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = "1",
})

---------------------
---- MY PROGRAMS ----
---------------------
-- Hyprland default apps

TERMINAL = "ghostty"
FILE_MANAGER = "nautilus"
BROWSER = "firefox"
-- EDITOR = "antigravity"
-- CALCULATOR = "gnome-calculator"

-------------------
---- AUTOSTART ----
-------------------
-- Auto-start config
-- if you dont use UWSM add your auto start programs here, otherwise use XDG autostart https://wiki.archlinux.org/title/XDG_Autostart

hl.on("hyprland.start", function()
	hl.exec_cmd("qs -c noctalia-shell")
	hl.exec_cmd("dbus-update-activation-environment --systemd --all")
	hl.exec_cmd("xhost +SI:localuser:root")
	hl.exec_cmd("hyprctl setcursor Adwaita 24")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- Environmental variables
-- if you don't use UWSM, define your variables here (e.g. hl.env("QT_QPA_PLATFORM", "wayland"))

hl.env("XCURSOR_THEME", "Adwaita")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- Cachy colors

CACHYLGREEN = "rgba(82dcccff)"
CACHYMGREEN = "rgba(00aa84ff)"
CACHYDGREEN = "rgba(007d6fff)"
CACHYLBLUE = "rgba(01ccffff)"
CACHYMBLUE = "rgba(182545ff)"
CACHYDBLUE = "rgba(111826ff)"
CACHYWHITE = "rgba(ffffffff)"
CACHYGREY = "rgba(ddddddff)"
CACHYGRAY = "rgba(798bb2ff)"

-----------------------
---- LOOK AND FEEL ----
-----------------------
-- Look and feel configuration
hl.config({
	general = {
		gaps_in = 2,
		gaps_out = 1,
		border_size = 1,
		extend_border_grab_area = 10,
		resize_on_border = true,
		col = {
			active_border = {
				colors = { CACHYLGREEN, CACHYDGREEN },
				angle = 45,
			},
			inactive_border = CACHYGRAY,
		},
	},
	group = {
		col = {
			border_active = CACHYLBLUE,
			border_inactive = CACHYGRAY,
			border_locked_active = CACHYDBLUE,
			border_locked_inactive = CACHYGRAY,
		},
		groupbar = {
			col = {
				active = CACHYLGREEN,
				inactive = CACHYGRAY,
				locked_active = CACHYDBLUE,
				locked_inactive = CACHYGRAY,
			},
		},
	},
	decoration = {
		rounding = 2,
		rounding_power = 2,

		dim_special = 0.3,

		active_opacity = 0.85,
		inactive_opacity = 0.85,
		fullscreen_opacity = 0.85,

		blur = {
			enabled = true,
			size = 5,
			passes = 3,
			ignore_opacity = true,

			noise = 0.08,
			contrast = 1.5,
			brightness = 0.8,
			special = true,

			xray = true,
			new_optimizations = true,
			popups = true,

			vibrancy = 0.1696,
		},
	},
	animations = {
		enabled = true,
	},
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
-- Default beziers
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })
hl.curve("overshoot", { type = "bezier", points = { { 0.5, 0.9 }, { 0.1, 1.1 } } })

-- Default springs
hl.curve("easy", { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })
hl.curve("rubber", { type = "spring", mass = 1, stiffness = 70, dampening = 10 })

-- Animations
hl.animation({ leaf = "global", enabled = true, speed = 3, bezier = "quick" })
hl.animation({ leaf = "windows", enabled = true, speed = 3, spring = "easy", style = "slide" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 5, bezier = "quick", style = "slide 20%" })
hl.animation({ leaf = "specialWorkspaceIn", enabled = true, speed = 2, bezier = "quick", style = "slide top" })
hl.animation({ leaf = "specialWorkspaceOut", enabled = true, speed = 2, bezier = "quick", style = "slide bottom" })

----------------
----  MISC  ----
----------------
hl.config({
	dwindle = {
		preserve_split = true,
	},
	misc = {
		col = {
			splash = CACHYLGREEN,
		},
		middle_click_paste = false,
		enable_swallow = true,
		swallow_regex = "(kitty|ghostty|[Kk]onsole|Alacritty|gnome-terminal|xfce[0-9]?-terminal)",
		vrr = 3,
		force_default_wallpaper = 0,
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
	},
	xwayland = {
		force_zero_scaling = true,
	},
	ecosystem = {
		no_update_news = true,
		no_donation_nag = true,
	},
})

---------------
---- INPUT ----
---------------
-- Input configuration
hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",

		repeat_delay = 250,
		repeat_rate = 50,

		follow_mouse = 1,
		sensitivity = 0.8, -- -1.0 - 1.0, 0 means no modification.
		accel_profile = "flat",

		touchpad = {
			natural_scroll = false,
		},
	},
})

hl.gesture({ fingers = 4, direction = "horizontal", action = "workspace" })
hl.gesture({ fingers = 3, direction = "down", action = "close" })
hl.gesture({ fingers = 3, direction = "up", action = "fullscreen" })
hl.gesture({ fingers = 3, direction = "left", action = "float" })

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"
local noctCall = "qs -c noctalia-shell ipc call "
-- local launchPrefix = "uwsm app -- " -- if you are not using UWSM, make this empty (e.g. "")
local launchPrefix = "" -- if you are not using UWSM, make this empty (e.g. "")

hl.bind(
	mainMod .. " + M",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)

---------------------------
---- WINDOW MANAGEMENT ----
---------------------------

hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.float({ action = "toggle" }))

hl.bind(mainMod .. " + M", hl.dsp.window.fullscreen({ mode = 1 }))
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))

hl.bind(mainMod .. " + L", hl.dsp.exec_cmd(noctCall .. " lockScreen lock"))
hl.bind(mainMod .. " + ALT + C", hl.dsp.exec_cmd(noctCall .. " sessionMenu toggle"))

-- Change focus
hl.bind(mainMod .. " + Left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + Right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + Up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + Down", hl.dsp.focus({ direction = "down" }))
hl.bind("ALT + Tab", hl.dsp.window.cycle_next())

-- Move active window around current workspace
hl.bind(mainMod .. " + SHIFT + Right", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + Left", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + Up", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + Down", hl.dsp.window.move({ direction = "d" }))
-- hl.bind(mainMod .. " + CONTROL + SHIFT + Right", hl.dsp.window.move({ workspace = "r+1" }))
-- hl.bind(mainMod .. " + CONTROL + SHIFT + Left", hl.dsp.window.move({ workspace = "r-1" }))

-- Move & Resize with mouse
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag())
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize())

------------------
---- LAUNCHER ----
------------------

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(launchPrefix .. TERMINAL))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(launchPrefix .. FILE_MANAGER))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(launchPrefix .. BROWSER))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(launchPrefix .. TERMINAL .. "-e antigravity-ide"))
-- hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(launchPrefix .. CALCULATOR))
-- hl.bind("CONTROL + SHIFT + Escape", hl.dsp.exec_cmd(launchPrefix .. TERMINAL .. " -e btop"))
-- hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd(noctCall .. "settings toggle"))
-- hl.bind(mainMod .. " + X", hl.dsp.exec_cmd(noctCall .. "controlCenter toggle"))
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd(noctCall .. "launcher toggle"))
hl.bind(mainMod .. " + period", hl.dsp.exec_cmd(noctCall .. "launcher emoji"))

---------------------------
---- HARDWARE CONTROLS ----
---------------------------

-- Audio
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(noctCall .. "volume increase"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(noctCall .. "volume decrease"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(noctCall .. "volume muteOutput"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd(noctCall .. "volume muteInput"), { locked = true, repeating = true })

-- Media
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd(noctCall .. "media playPause"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd(noctCall .. "media playPause"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd(noctCall .. "media next"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd(noctCall .. "media previous"), { locked = true })

-- Brightness
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(noctCall .. "brightness increase"), { repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(noctCall .. "brightness decrease"), { repeating = true })

-------------------
---- UTILITIES ----
-------------------

-- Screen Capture
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd(noctCall .. "plugin:screen-toolkit colorPicker"))
hl.bind("Print", hl.dsp.exec_cmd(noctCall .. "plugin:screen-toolkit annotate"))
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd(noctCall .. "plugin:screen-toolkit annotateWindow"))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(noctCall .. "plugin:screen-toolkit toggle"))

-- Theming and Wallpaper
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd(noctCall .. " wallpaper toggle"))

-- Clipboard
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(noctCall .. "launcher clipboard"))

--------------------
---- WORKSPACES ----
--------------------

for i = 1, 10 do
	local key = i % 10
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
	-- hl.bind(mainMod .. " + ALT + " .. key, hl.dsp.window.move({ workspace = i, follow = true }))
end

hl.bind(mainMod .. "+ Tab", hl.dsp.focus({ workspace = "previous" }))

-- hl.bind(mainMod .. " + CONTROL + Right", hl.dsp.focus({ workspace = "r+1" }))
-- hl.bind(mainMod .. " + CONTROL + Left", hl.dsp.focus({ workspace = "r-1" }))
-- hl.bind(mainMod .. " + CONTROL + Down", hl.dsp.focus({ workspace = "empty" }))
-- hl.bind(mainMod .. " + CONTROL + ALT + Right", hl.dsp.window.move({ workspace = "r+1" }))
-- hl.bind(mainMod .. " + CONTROL + ALT + Left", hl.dsp.window.move({ workspace = "r-1" }))

-- Scroll through existing workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Special workspace (scratchpad)
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special" }))
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special())

-----------------------
---- NOTIFICATIONS ----
-----------------------

hl.bind(mainMod .. " + A", hl.dsp.exec_cmd(noctCall .. "notifications toggleHistory"))

-- Picture-in-Picture
hl.window_rule({
	match = { title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$" },
	float = true,
	keep_aspect_ratio = true,
	move = "73% 72%",
	size = "25% 25%",
	pin = true,
})

-- Gaming
local gamingApps = "^(steam_app.*|gamescope)$"
local gamingWorkspace = "name:gaming"

hl.window_rule({ match = { content = "game" }, workspace = gamingWorkspace })
hl.window_rule({ match = { class = gamingApps }, workspace = gamingWorkspace })
hl.window_rule({ match = { class = "^(steam)$", title = "^(Friends List)$" }, float = true })
hl.window_rule({
	match = {
		class = "^(steam)$",
		title = "^(Launching\\.{3})$",
	},
	float = true,
	center = true,
	workspace = gamingWorkspace,
})
hl.window_rule({
	match = {
		class = gamingApps,
		title = "^(.+)$",
		initial_title = "negative:^(.*\\\\home\\\\.*)$",
	},
	size = "monitor_w monitor_h",
	fullscreen_state = 2,
	content = "game",
})
hl.window_rule({
	match = {
		class = "^(steam_app.*)$",
		initial_title = "^$",
	},
	float = true,
	center = true,
	fullscreen = false,
	fullscreen_state = 0,
})

-- Apps
local primaryWorkspace = 1

hl.window_rule({
	match = { class = "^(.*\\.exe)$", float = true },
	primaryWorkspace,
	center = true,
	fullscreen_state = 0,
})
hl.window_rule({
	match = { class = "^(vesktop|discord)$" },
	primaryWorkspace,
})
hl.window_rule({
	match = { class = "^(.*[Cc]alculator.*)$" },
	float = true,
	size = "380 616",
})
hl.window_rule({
	match = { class = "^(org.kde.keditfiletype)$" },
	float = true,
})
hl.window_rule({
	match = { class = "^(org.kde.ark)$" },
	size = "(monitor_w*0.40) (monitor_h*0.40)",
})
hl.window_rule({
	match = {
		class = "^(org.kde.dolphin)$",
		title = "negative:^(Moving.*|Create New.*|Extract.*|Compress.*|Copying.*|Progress.*|Configure.*|Properties.*|Choose\\sApplication.*)$",
	},
	float = true,
	move = {
		"max(0, min(cursor_x - 650, monitor_w - 1320))",
		"max(0, min(cursor_y - 50, monitor_h - 820))",
	},
	size = "1300 800",
})

-- Opacity Overrides
local terminals = "^(kitty|ghostty|[Kk]onsole|Alacritty|gnome-terminal|xfce[0-9]?-terminal)$"

hl.window_rule({
	match = { class = "^(firefox|zen)$" },
	opacity = "0.95 override",
})

hl.window_rule({
	match = { class = terminals },
	opacity = "1.0 override",
}) -- override opacity in favor of terminal settings for opacity

hl.window_rule({
	match = { class = "^(mpv|org.kde.haruna|.*plex.*|org\\.kde\\.gwenview|.*vlc.*)$" },
	opacity = "1.0 override",
})

-- Float Utility Windows
local floatApps = {
	{ class = "^(kvantummanager|qt[56]ct|nwg-look)$" },
	{ class = "^(org.pulseaudio.pavucontrol|blueman-manager|nm-applet|nm-connection-editor)$" },
	{ title = "^(Winetricks.*|Protontricks.*)$" },
}
for _, m in ipairs(floatApps) do
	hl.window_rule({ match = m, float = true })
end

hl.window_rule({ match = { float = true }, move = "50% 50%" })

-- Float Common Modals
local modalMatches = {
	{
		title = "^(Open|Authentication Required|Add Folder to Workspace|Choose Files|Save As|Confirm to replace files|File Operation Progress)$",
	},
	{ initial_title = "^(Open File)$" },
	{ class = "^([Xx]dg-desktop-portal-gtk)$" },
	{ title = "^(File Upload|Choose wallpaper|Library)(.*)$" },
	{ class = "^(.*dialog.*)$" },
	{ title = "^(.*dialog.*)$" },
	{ class = "^(hyprland-share-picker)$" },
}
for _, m in ipairs(modalMatches) do
	hl.window_rule({ match = m, float = true })
end

-- Ignore maximize requests from all apps. You'll probably like this.
local suppressMaximizeRule = hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})
suppressMaximizeRule:set_enabled(false)

-- Fix some dragging issues with XWayland
hl.window_rule({
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})
