if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))) {
    global.MENU_INDEX -= 1;
}

// Move down the menu
if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))) {
    global.MENU_INDEX += 1;
}

// Clamp the MENU_INDEX value
global.MENU_INDEX = clamp(global.MENU_INDEX, 0, array_length(menu_options) - 1);