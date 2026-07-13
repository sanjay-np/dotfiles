# dotfiles

Multi-platform dotfiles for macOS (Aerospace, Ghostty, Wezterm), Linux (Hyprland, Waybar), and Windows (GlazeWM, Yasb).

## Structure

Each directory is a self-contained config for one tool. No deploy script — copy or symlink manually to the expected path.

| Platform | Config | Install target |
|----------|--------|----------------|
| macOS | [Aerospace](aerospace/aerospace.toml) tiling WM | `~/.aerospace.toml` |
| macOS / Linux | [Ghostty](ghostty/config) terminal | `~/.config/ghostty/config` |
| macOS / Linux | [WezTerm](wezterm/wezterm.lua) terminal | `~/.config/wezterm/wezterm.lua` |
| Linux | [Hyprland](hypr/hyprland.lua) WM | `~/.config/hypr/hyprland.lua` |
| Linux | [Kitty](kitty/kitty.conf) terminal | `~/.config/kitty/kitty.conf` |
| Linux | [Waybar](waybar/config.jsonc) status bar | `~/.config/waybar/` |
| Linux | [Rofi](rofi/config.rasi) launcher + applets + powermenu | `~/.config/rofi/` |
| Linux | [Swaync](swaync/config.json) notifications | `~/.config/swaync/` |
| Linux | [Wofi](wofi/config) app launcher | `~/.config/wofi/` |
| Windows | [GlazeWM](glzr/glazewm/config.yaml) tiling WM | `~/.glzr/glazewm/` |
| Windows | [Zebar](glzr/zebar/settings.json) desktop bar | `~/.glzr/zebar/` |
| Windows | [Yasb](yasb/config.yaml) status bar | `%UserProfile%/.yasb/` |
| All | [Tmux](tmux/tmux.conf) | `~/.config/tmux/tmux.conf` |
| All | [Neovim](nvim/) | `~/.config/nvim/` |
| All | [Starship](starship.toml) prompt | `~/.config/starship.toml` |

---

## Neovim (`nvim/`)

Uses [lazy.nvim](https://github.com/folke/lazy.nvim). Entrypoint: `init.lua` → `lua/config/{options,keymaps,lazy,autocmds}.lua`, plugins in `lua/plugins/`.

- **Leader:** Space
- **Keymaps:** `jk` → escape, `<leader>nh` → clear search
- **Tabs:** `<leader>to`/`tx`/`tn`/`tp`/`tf`
- **Window resize:** `Ctrl+Arrow` keys
- **File picker:** `Snacks.picker` — `<leader>ff` (files), `<leader>fb` (buffers), `<leader>fs` (grep), `<leader>fg` (git files)
- **Git:** `<leader>gg` → lazygit, `<leader>gb`/`gl`/`gs`/`gd` → snacks git pickers
- **LSP:** `<leader>ca` (code actions), `<leader>rn` (rename), `K` (hover), `gd`/`gvd` (definition)
- **Format:** Auto on save via conform.nvim (stylua, prettierd, pint, beautysh). Manual: `<leader>mp`
- **Lint:** Auto on BufEnter+Write via nvim-lint (oxlint for JS/TS, jsonlint)
- **Completion:** blink.cmp with enter to accept, auto-show docs
- **AI:** Supermaven inline completions
- **Colorscheme:** TokyoNight (night style, transparent, rounded borders)

### LSP servers enabled

`lua_ls`, `tailwindcss`, `ts_ls`, `cssls`, `intelephense`, `emmet_ls`, `phpactor`, `typos_lsp`

### Mason tools pre-configured

`css-lsp`, `emmet-ls`, `eslint_d`, `intelephense`, `jsonlint`, `lua-language-server`, `prettier`, `prettierd`, `stylua`, `tailwindcss-language-server`, `typescript-language-server`

---

## Tmux (`tmux/tmux.conf`)

- **Prefix:** Backtick (`` ` ``), not `Ctrl+B`
- **Plugins:** TPM — install with `prefix + I`. Plugins live in `tmux/plugins/` (gitignored).
- **i3 workspaces:** `tmux-tilish` with `prefix + number` to switch windows
- **Reload:** `prefix + r`
- **Status bar at top**, 1-indexed windows, mouse on, vi copy mode
- **256-color:** `tmux-256color` terminal with RGB override

### TPM plugins

`tmux-sensible`, `tmux-tilish` (main-vertical default, easymode on), `tmux-resurrect`

---

## macOS

### Aerospace (`aerospace/aerospace.toml`)

macOS-only tiling window manager.

- **Copy to:** `~/.aerospace.toml`
- **Workspaces:** Alt+1–5, Alt+Shift+1–5 to move windows
- **Layout:** Alt+Slash (cycle tiling), Alt+Comma (accordion), Alt+Cmd+Enter (fullscreen), Alt+Cmd+F (float/toggle)
- **Focus:** Alt+H/J/K/L, move with Alt+Shift+H/J/K/L
- **Resize:** Alt+Minus/Equals (±50)
- **Auto-rule:** WezTerm → workspace 1, Firefox → workspace 2, Finder/Discord → floating
- **Service mode:** Alt+Shift+Semicolon (r = reset layout, f = toggle float, esc = back)

## Terminals

### Ghostty (`ghostty/config`)

Cross-platform terminal (macOS alt-key notes below).

- **Install:** `~/.config/ghostty/config`
- **Theme:** TokyoNight, 90% opacity, 30px blur
- **macOS notes:** `macos-option-as-alt = true` (alt → meta for tmux). Alt+1–5 and Alt+arrows unbound (conflicts with tmux-tilish)

### WezTerm (`wezterm/wezterm.lua`)

Cross-platform terminal (macOS-specific blur below).

- **Install:** `~/.config/wezterm/wezterm.lua`
- **Theme:** Tokyo Night (Gogh), GeistMono Nerd Font 15.5
- **macOS notes:** 40px background blur.` config: 95% opacity
- Ctrl+Click opens links under cursor

---

## Linux

### Hyprland (`hypr/hyprland.lua`)

Lua-based config using the `hl.*` API ([hyparlang.com](https://hyparlang.com)). Not `.conf` format.

- **Noctalia shell** handles bar, launcher, notifications, session management
- **Terminal:** Ghostty, **File manager:** Nautilus, **Browser:** Firefox
- **Keybindings:** Super+Q (close), F (fullscreen), Shift+F (float toggle), HJKL (focus), Shift+HJKL (move)
- **Workspaces:** Super+1–10, Shift+1–10 to move windows, Super+S for scratchpad
- **Launcher:** Super+Space (Noctalia panel)
- **Gaming auto-detect:** Steam/gamescope windows → dedicated gaming workspace
- **Window rules:** Picture-in-picture, calculator (float), Dolphin (smart positioning), Android emulator, common dialogs
- **Opacity overrides:** Browsers 95%, terminals 100% (delegates to terminal config)

### Waybar (`waybar/config.jsonc`)

- **Custom modules:** Workspaces, CPU, memory, temperature, cava visualizer, clock, tray, network, pulseaudio, battery
- **Scripts:** `scripts/launch.sh` (kill + restart), `scripts/cava.sh` (audio visualizer)
- Waybar IPC enabled for external control

### Rofi (`rofi/config.rasi`)

- **Modes:** `drun,run,filebrowser,window` (invoke via `rofi -show <mode>`)
- **Styles:** 7 launcher types and 6 powermenu types under `launchers/` and `powermenu/`
- **Script launchers:** `rofi/scripts/launcher_t*` and `powermenu_t*` for each type
- **Applets:** Battery, brightness, volume, screenshot, MPD, quicklinks, apps

### Swaync (`swaync/config.json`)

- Control center: right-side, 380px wide, 860px tall
- **Widgets:** Label, buttons grid (audio/network/bluetooth/nwg-look), MPRIS, title, DND toggle
- **Notifications:** 4s timeout (2s low, 6s critical), 200ms transitions

### Kitty (`kitty/kitty.conf`)

- JetBrainsMono Nerd Font 14, 85% opacity, zsh shell integration

---

## Windows

### GlazeWM (`glzr/glazewm/config.yaml`)

- Alt+H/J/K/L (focus), Shift+H/J/K/L (move), Alt+V (tiling direction), Alt+R (resize mode)
- 10px inner gap, 5px outer top/right/bottom/left gaps, 96% opacity for all windows
- Startup: launches yasb.exe; shutdown: kills zebar
- **Window rules:** Ignores Zebar, PiP, PowerToys, Lively, Office non-main windows

### Yasb (`yasb/config.yaml`)

- Top bar, 32px height, 100% width, always on top
- **Left widgets:** GlazeWM workspaces, active window title
- **Center:** Clock with traffic monitor
- **Right:** Media, systray, CPU, memory, wallpaper switcher, bluetooth, wifi, volume, battery, notifications, power menu
- Styles in `styles.css`

---

## Starship (`starship.toml`)

Prompt format: `os → user@hostname directory git_branch character`. Battery, time, username, hostname, and language-specific indicators visible. Current directory read-only indicator enabled.
