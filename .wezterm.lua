-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

local nord = wezterm.get_builtin_color_schemes()["nord"]
local tokyo = wezterm.get_builtin_color_schemes()["tokyonight"]

--
--  	pl_left_hard_divider
--  	pl_left_soft_divider
--  	pl_line_number
--  	pl_right_hard_divider
--  	pl_right_soft_divider
--  	ple_backslash_separator
--  	ple_backslash_separator_redundant
--  	ple_column_number
--  	ple_flame_thick
--  	ple_flame_thick_mirrored
--  	ple_flame_thin
--  	ple_flame_thin_mirrored
--  	ple_forwardslash_separator
--  	ple_forwardslash_separator_redundant
--  	ple_honeycomb
--  	ple_honeycomb_outline
--  	ple_ice_waveform
--  	ple_ice_waveform_mirrored
--  	ple_left_half_circle_thick
--  	ple_left_half_circle_thin
--  	ple_lego_block_facing
--  	ple_lego_block_sideways
--  	ple_lego_separator
--  	ple_lego_separator_thin
--  	ple_lower_left_triangle
--  	ple_lower_right_triangle
--  	ple_pixelated_squares_big
--  	ple_pixelated_squares_big_mirrored
--  	ple_pixelated_squares_small
--  	ple_pixelated_squares_small_mirrored
--  	ple_right_half_circle_thick
--  	ple_right_half_circle_thin
--  	ple_trapezoid_top_bottom
--  	ple_trapezoid_top_bottom_mirrored
--  	ple_upper_left_triangle
--  	ple_upper_right_triangle
--

-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = wezterm.nerdfonts.ple_upper_right_triangle
-- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_upper_left_triangle

local function tab_title(tab_info)
	local title = tab_info.tab_title
	-- if the tab title is explicitly set, take that
	if title and #title > 0 then
		return title
	end
	-- Otherwise, use the title from the active pane
	-- in that tab
	return tab_info.active_pane.title
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local edge_background = tokyo.ansi[1]
	local background = "#121212"
	local foreground = "#FCE8C3"

	if tab.is_active then
		background = "rgba(0, 0, 0, 0)"
		foreground = "#FCE8C3"
	elseif hover then
		background = tokyo.ansi[1]
		foreground = "#FCE8C3"
	end

	local edge_foreground = background

	local title = tab_title(tab)

	-- ensure that the titles fit in the available space,
	-- and that we have room for the edges.
	title = wezterm.truncate_right(title, max_width - 2)

	return {
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_LEFT_ARROW },
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = title },
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_RIGHT_ARROW },
	}
end)

-- This is where you actually apply your config choices
-- For example, changing the color scheme:
config = {
	-- default program to open wez with
	default_prog = { "/usr/bin/tmux", "-l" },

	-- behaviour settings
	window_close_confirmation = "AlwaysPrompt",
	use_ime = true,
	ime_preedit_rendering = "Builtin",

	-- keybindings
	leader = { key = "Space", mods = "CTRL|SHIFT" },
	keys = {
		{
			key = "w",
			mods = "CMD",
			action = wezterm.action.CloseCurrentTab({ confirm = true }),
		},
	},

	-- color and transparency settings
	color_scheme = "Aura (Gogh)",
	colors = {
		--  background = 'rgba(0%, 0%, 0%, 80%)',
		tab_bar = {
			background = tokyo.background,
			new_tab = {
				bg_color = "#2e3440",
				fg_color = tokyo.ansi[8],
				intensity = "Bold",
			},
			new_tab_hover = {
				bg_color = tokyo.ansi[1],
				fg_color = tokyo.brights[8],
				intensity = "Bold",
			},
			-- format-tab-title
			-- active_tab = {
			--   italic = true,
			-- },
			-- inactive_tab = {
			--   italic = false,
			-- },
			-- inactive_tab_hover = {
			--   italic = true,
			-- },
		},
	},
	window_background_opacity = 0.95,
	text_background_opacity = 1,

	-- window settings
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	window_decorations = "RESIZE",
	adjust_window_size_when_changing_font_size = false,
	selection_word_boundary = " \t\n{}[]()\"'`,;:│=&!%",

	-- font settings
	-- font = wezterm.font { family = 'Iosevka' },
	font = wezterm.font("IosevkaNerdFont"),
	font_size = 9,
	default_cursor_style = "BlinkingBar",

	-- tab settings
	tab_bar_at_bottom = true,
	hide_tab_bar_if_only_one_tab = true,
	use_fancy_tab_bar = true,
}

-- and finally, return the configuration to wezterm
return config
