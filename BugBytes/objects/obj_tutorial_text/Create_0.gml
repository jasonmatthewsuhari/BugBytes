/// @description Insert description here
// You can write your code in this editor
dialogue = ["Welcome to the tutorial!",
"Move around with WASD, Arrow Keys, or Left Mouse Click.",
"Oh no! A bug has popped out of the game! Aim at it, quickly!",
"Great, use the coins dropped to buy something from the shop",
"Use the items by equiping it with num 1-5 and right mouse click",
"Looks like the bug did some damage to our 'Next' button at the bottom right of the map. \n Fix it with your Heal Gun! Press H to toggle health bar display",
"Nice. Now that you know how things work around here, go save the world! \n Sending you back to the menu..."]
current_line = 0;
move_on = false;
alarm[0] = 3 * game_get_speed(gamespeed_fps);