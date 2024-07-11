/// @description Insert description here
// You can write your code in this editor
if (!shopOpen) exit;

//Draw back rectangles
draw_set_color(c_black);
	draw_set_alpha(0.8);
		draw_rectangle(0, 0, guiWidth, guiHeight, 0);
	draw_set_alpha(0.5);
		draw_rectangle(menuMargin, 0, menuMargin+menuWidth, guiHeight, 0);
	draw_set_alpha(1);
draw_set_color(c_white);

//Draw menu items
for(var i=0; i<itemCount; i++){
	//Get item
	var item = items[| i];
	var name = item.name;
	
	//Draw position
	var _x = menuMargin + menuWidth/2;
	var _y = (guiHeight/2) + (i-selectedAnim)*32;
	
	//Draw scale
	var s = 1;
	if (i==selected) s = 1.4;
	
	//Selected item name
	if (i==selected) name = "> " + name + " <";
	
	//Draw
	draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
			draw_text_transformed(_x, _y, name, s, s, 0);
		draw_set_valign(fa_left);
	draw_set_halign(fa_left);
}

//Get selected item's data
var item = items[| selected];
var name = item.name
var price = item.price;
var desc = item.description;
var spr = item.sprite;

//Draw position
var _x = (menuMargin + menuWidth) + previewWidth/2;
var _y = (guiHeight/2);

//Draw sprite

if (sprite_exists(spr)) {
	//Draw scale
	var s = 2;
		
	//Draw
	draw_sprite_ext(spr, 0, _x, _y - 24, s, s, 0, -1, 1);
}

//Draw description
draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
		draw_text(_x, _y + 80, desc);
	draw_set_valign(fa_left);
draw_set_halign(fa_left);

//Draw player's money

draw_text(8, 8, "Press Q to exit shop");

//Draw price
draw_set_valign(fa_bottom);
	draw_text(menuMargin + menuWidth + 4, guiHeight-4, "Price: " + string(price));
	
	draw_set_halign(fa_right);
		draw_text(guiWidth-4, guiHeight-4, "Hit ENTER to buy");
	draw_set_halign(fa_left);
draw_set_valign(fa_top);