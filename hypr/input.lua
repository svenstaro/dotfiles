hl.config({
	input = {
		kb_layout = "eu,ru",
		kb_options = "caps:swapescape,grp:alt_space_toggle",

		follow_mouse = 0,

		-- -1.0 to 1.0, 0 means no modification
		sensitivity = -0.3,

		touchpad = {
			natural_scroll = false,
		},

		numlock_by_default = true,
	},
})

-- 3-finger workspace swiping
hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

-- This touchpad feels wrong with the default pointer acceleration
hl.device({
	name = "pixa3854:00-093a:0274-touchpad",
	sensitivity = 0.0,
})
