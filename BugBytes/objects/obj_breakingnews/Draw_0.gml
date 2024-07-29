// Draw event
draw_self();

// Set the alpha for the text to match the object's alpha
draw_set_alpha(image_alpha);

// Draw the custom text at the specified offset
prev_font = draw_get_font();
draw_set_font(fnt_breaking);

draw_set_halign(fa_center);
draw_set_color(c_white);
draw_set_alpha(image_alpha);
draw_set_halign(fa_center);
draw_text_transformed(x + 890, y + 300, display_text, 1, 1, 24);

draw_set_font(prev_font);
// Reset the alpha to full opacity
draw_set_alpha(1);
