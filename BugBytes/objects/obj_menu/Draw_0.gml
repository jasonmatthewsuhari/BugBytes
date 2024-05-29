var option_x = 100;
var option_y = 100;
var option_gap = 30

for (var i = 0; i < array_length(menu_options); i++) {
    if (i == global.MENU_INDEX) {
        draw_set_color(c_yellow);
    } else {
        draw_set_color(c_white);
    }
    draw_text(option_x, option_y + i * option_gap, menu_options[i]);
}

draw_set_color(c_white);
