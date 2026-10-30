-- Always fullscreen satty
hl.window_rule({
	name = "always-fullscreen-satty",
	match = { class = "com.gabm.satty" },

	fullscreen = true,
})

hl.window_rule({
	name = "hueforge-dragndrop-fix",
	match = { initial_title = "HueForge" },

	no_initial_focus = true,
})

hl.window_rule({
	name = "prusaslicer-input-field-focus-fix",
	match = { initial_title = "prusa-slicer" },

	no_initial_focus = true,
})

hl.window_rule({
	-- Ignore maximize requests from all apps. Tends to be annoying.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})

hl.window_rule({
	-- Fix some dragging issues with XWayland
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
