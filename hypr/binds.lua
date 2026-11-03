hl.bind("SUPER + Return", hl.dsp.exec_cmd("kitty"))
hl.bind("SUPER + E", hl.dsp.exec_cmd("thunar"))
hl.bind("SUPER + space", hl.dsp.exec_cmd("rofi -show combi -switchers combi -combi-modi window,run"))
hl.bind("SUPER + C", hl.dsp.exec_cmd("rofi -show calc -modi calc -no-show-match -no-sort"))

hl.bind("CTRL + SHIFT + SUPER + S", hl.dsp.exec_cmd("systemctl suspend"))
hl.bind("CTRL + SHIFT + SUPER + L", hl.dsp.exec_cmd("loginctl lock-session"))

-- Display/monitor/screen layout management
hl.bind("SUPER + p", hl.dsp.exec_cmd("nwg-displays"))

-- Screen brightness
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s +5%"), { repeating = true, locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 5%-"), { repeating = true, locked = true })

-- Volume
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ repeating = true, locked = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-"),
	{ repeating = true, locked = true }
)
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true })

-- Player controls
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Super convenient screenshotting with annotations
hl.bind(
	"Print",
	hl.dsp.exec_cmd(
		[[grim -g "$(slurp -o -r -c '##ff0000ff')" -t ppm - | satty --early-exit --initial-tool rectangle --copy-command wl-copy --annotation-size-factor 2 --fullscreen --output-filename /tmp/screenshot-%Y-%m-%d_%H:%M:%S.png --filename -]]
	)
)

hl.bind("SUPER + SHIFT + Q", hl.dsp.window.close())
hl.bind("SUPER + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + O", hl.dsp.layout("togglesplit")) -- dwindle
hl.bind("SUPER + F", hl.dsp.window.fullscreen())

-- Resize mode: the following binds resize the active window
hl.bind("SUPER + R", hl.dsp.submap("resize"))

hl.define_submap("resize", function()
	-- Repeatable binds for resizing the active window
	hl.bind("l", hl.dsp.window.resize({ x = 100, y = 0, relative = true }), { repeating = true })
	hl.bind("h", hl.dsp.window.resize({ x = -100, y = 0, relative = true }), { repeating = true })
	hl.bind("k", hl.dsp.window.resize({ x = 0, y = -100, relative = true }), { repeating = true })
	hl.bind("j", hl.dsp.window.resize({ x = 0, y = 100, relative = true }), { repeating = true })

	-- Use reset to go back to the global submap
	hl.bind("Escape", hl.dsp.submap("reset"))
end)

-- Move focus with Super + vim controls
hl.bind("SUPER + H", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + L", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + K", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + J", hl.dsp.focus({ direction = "down" }))

-- Move focus with Super + arrow keys
hl.bind("SUPER + Left", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + Right", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + Up", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + Down", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with Super + [0-9]
-- Move active window to a workspace with Super + Shift + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Move windows around with Super + vim controls
hl.bind("SUPER + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind("SUPER + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind("SUPER + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind("SUPER + SHIFT + J", hl.dsp.window.move({ direction = "down" }))

-- Move windows around with Super + arrow keys
hl.bind("SUPER + SHIFT + Left", hl.dsp.window.move({ direction = "left" }))
hl.bind("SUPER + SHIFT + Right", hl.dsp.window.move({ direction = "right" }))
hl.bind("SUPER + SHIFT + Up", hl.dsp.window.move({ direction = "up" }))
hl.bind("SUPER + SHIFT + Down", hl.dsp.window.move({ direction = "down" }))

-- Scroll through existing workspaces with Super + scroll
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "m-1" }))
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "m+1" }))

-- Scroll through existing workspaces with Super + []
hl.bind("SUPER + bracketright", hl.dsp.focus({ workspace = "m+1" }))
hl.bind("SUPER + bracketleft", hl.dsp.focus({ workspace = "m-1" }))

-- Move/resize windows with Super + LMB/RMB and dragging
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })
