local wezterm = require 'wezterm';

return {
    window_padding = {
      left = '0',
      right = '0',
      top = '0',
      bottom = '0',
    },
    adjust_window_size_when_changing_font_size = false,
    hide_tab_bar_if_only_one_tab = true,
    cell_width = 0.9,
    underline_position = "-1pt",
    font = wezterm.font("Input Mono"),
    font_size = {{ wezterm_font_size }},
    freetype_load_target = 'Light',
    freetype_render_target = 'HorizontalLcd',
    colors = {
        foreground = "#f1ebeb",
        background = "#0f0f0f",
        cursor_bg = "#52ad70",
        cursor_fg = "#f1ebeb",
        cursor_border = "#52ad70",
        selection_fg = "#0f0f0f",
        selection_bg = "#f1ebeb",

        -- The color of the scrollbar "thumb"; the portion that represents the current viewport
        scrollbar_thumb = "#222222",

        -- The color of the split lines between panes
        split = "#444444",

        ansi = {"#48483e", "#dc2566", "#8fc029", "#d4c96e", "#258cce", "#9358fe", "#56b7a5", "#acada1"},
        brights = {"#76715e", "#fa2772", "#a7e22e", "#e7db75", "#36c9ee", "#ae82ff", "#66efd5", "#cfd0c2"},
    }
}
