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
	name = "firefox-fix-save-file",
	match = { class = "firefox" },

	suppress_event = "maximize",
})
