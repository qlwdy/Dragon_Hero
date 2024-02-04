/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 1A1A5246
/// @DnDArgument : "code" "right_key = keyboard_check(vk_right);$(13_10)left_key = keyboard_check(vk_left);$(13_10)up_key = keyboard_check(vk_up);$(13_10)down_key = keyboard_check(vk_down);$(13_10)$(13_10)$(13_10)//get xspd and yspd$(13_10)xspd = (right_key - left_key) * move_spd;$(13_10)yspd = (down_key - up_key) * move_spd;$(13_10)$(13_10)$(13_10)//set sprite$(13_10)mask_index = sprite[DOWN];$(13_10)if yspd == 0$(13_10)	{$(13_10)	if xspd > 0 {face = RIGHT};$(13_10)	if xspd < 0 {face = LEFT};$(13_10)	}$(13_10)if xspd > 0 && face == LEFT {face = RIGHT};$(13_10)if xspd < 0 && face == RIGHT {face = LEFT};$(13_10)if xspd == 0$(13_10)	{$(13_10)	if yspd > 0 {face = DOWN};$(13_10)	if yspd < 0 {face = UP};$(13_10)	}$(13_10)if yspd > 0 && face == UP {face = DOWN};$(13_10)if yspd < 0 && face == DOWN {face = UP};$(13_10)sprite_index = sprite[face];$(13_10)$(13_10)$(13_10)//collisions$(13_10)if place_meeting(x + xspd, y, obj_wall)$(13_10)	{$(13_10)	xspd = 0;$(13_10)	}$(13_10)if place_meeting(x, y + yspd, obj_wall)$(13_10)	{$(13_10)	yspd = 0;$(13_10)	}$(13_10)$(13_10)// Move the player$(13_10)x += xspd;$(13_10)y += yspd;$(13_10)$(13_10)// Play sound when moving$(13_10)if (xspd != 0 || yspd != 0) {$(13_10)    if (!audio_is_playing(snd_move)) {$(13_10)        sound_move = audio_play_sound(snd_move, 1, true);$(13_10)    }$(13_10)} else {$(13_10)    audio_stop_sound(snd_move);$(13_10)}$(13_10)$(13_10)// Animate$(13_10)if (xspd == 0 && yspd == 0) {$(13_10)    image_index = 0;$(13_10)}$(13_10)$(13_10)$(13_10)//depth$(13_10)depth = -bbox_bottom;$(13_10)"
right_key = keyboard_check(vk_right);
left_key = keyboard_check(vk_left);
up_key = keyboard_check(vk_up);
down_key = keyboard_check(vk_down);


//get xspd and yspd
xspd = (right_key - left_key) * move_spd;
yspd = (down_key - up_key) * move_spd;


//set sprite
mask_index = sprite[DOWN];
if yspd == 0
	{
	if xspd > 0 {face = RIGHT};
	if xspd < 0 {face = LEFT};
	}
if xspd > 0 && face == LEFT {face = RIGHT};
if xspd < 0 && face == RIGHT {face = LEFT};
if xspd == 0
	{
	if yspd > 0 {face = DOWN};
	if yspd < 0 {face = UP};
	}
if yspd > 0 && face == UP {face = DOWN};
if yspd < 0 && face == DOWN {face = UP};
sprite_index = sprite[face];


//collisions
if place_meeting(x + xspd, y, obj_wall)
	{
	xspd = 0;
	}
if place_meeting(x, y + yspd, obj_wall)
	{
	yspd = 0;
	}

// Move the player
x += xspd;
y += yspd;

// Play sound when moving
if (xspd != 0 || yspd != 0) {
    if (!audio_is_playing(snd_move)) {
        sound_move = audio_play_sound(snd_move, 1, true);
    }
} else {
    audio_stop_sound(snd_move);
}

// Animate
if (xspd == 0 && yspd == 0) {
    image_index = 0;
}


//depth
depth = -bbox_bottom;