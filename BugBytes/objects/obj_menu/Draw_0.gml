// Draw event

var option_x = 100;  // X position for menu options
var option_y = 100;  // Y starting position for menu options
var option_gap = 30; // Gap between menu options

// Draw the menu options
for (var i = 0; i < array_length(menu_options); i++) {
    if (i == global.MENU_INDEX) {
        // Draw the selected option with a different color
        draw_set_color(c_yellow);
    } else {
        // Draw the unselected options with default color
        draw_set_color(c_white);
    }
    draw_text(option_x, option_y + i * option_gap, menu_options[i]);
}

// Reset color to default
draw_set_color(c_white);
