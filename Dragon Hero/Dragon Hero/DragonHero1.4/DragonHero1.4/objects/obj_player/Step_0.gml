/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 1A1A5246
/// @DnDArgument : "code" "$(13_10)right_key = keyboard_check(vk_right);$(13_10)left_key = keyboard_check(vk_left);$(13_10)up_key = keyboard_check(vk_up);$(13_10)down_key = keyboard_check(vk_down);$(13_10)$(13_10)//get xspd and yspd$(13_10)xspd = (right_key - left_key) * move_spd;$(13_10)yspd = (down_key - up_key) * move_spd;$(13_10)$(13_10)$(13_10)if instance_exists(obj_pauser)$(13_10)	$(13_10)$(13_10)$(13_10)//set sprite$(13_10)mask_index = sprite[DOWN];$(13_10)if yspd == 0$(13_10)	{$(13_10)	if xspd > 0 {face = RIGHT};$(13_10)	if xspd < 0 {face = LEFT};$(13_10)	}$(13_10)if xspd > 0 && face == LEFT {face = RIGHT};$(13_10)if xspd < 0 && face == RIGHT {face = LEFT};$(13_10)if xspd == 0$(13_10)	{$(13_10)	if yspd > 0 {face = DOWN};$(13_10)	if yspd < 0 {face = UP};$(13_10)	}$(13_10)if yspd > 0 && face == UP {face = DOWN};$(13_10)if yspd < 0 && face == DOWN {face = UP};$(13_10)sprite_index = sprite[face];$(13_10)$(13_10)$(13_10)//collisions$(13_10)if place_meeting(x + xspd, y, obj_wall)$(13_10)	{$(13_10)	xspd = 0;$(13_10)	}$(13_10)if place_meeting(x, y + yspd, obj_wall)$(13_10)	{$(13_10)	yspd = 0;$(13_10)	}$(13_10)$(13_10)// Move the player$(13_10)x += xspd;$(13_10)y += yspd;$(13_10)$(13_10)$(13_10)// Animate$(13_10)if (xspd == 0 && yspd == 0) {$(13_10)    image_index = 0;$(13_10)}$(13_10)$(13_10)//TO DO communicate which music is being played for each location$(13_10)$(13_10)var moving = (xspd != 0 || yspd != 0);$(13_10)$(13_10)if (moving != isMoving) {$(13_10)    isMoving = moving;$(13_10)    if (isMoving) {$(13_10)        // If so, start the audio (note that the audio may already be playing in a fade-out, so we must check for this, rather than just play it.$(13_10)        if (!audio_is_playing(movement_sound)) {$(13_10)            $(13_10)			if (isPaused) {$(13_10)				movement_sound = audio_play_sound(snd_move, 1, true, 1, sound_position);$(13_10)				isPaused = false;$(13_10)				$(13_10)			} else { $(13_10)				movement_sound = audio_play_sound(snd_move, 1, true);$(13_10)			} $(13_10)			audio_sound_gain(music_sound, music_low_value, music_fade_time_ms)$(13_10)			$(13_10)        }$(13_10)        targetVolume = 1;$(13_10)    } else {$(13_10)        // Else, fade out the audio... note that we do not "stop" the sound: it'll stop on its own once done.$(13_10)        targetVolume = 0;$(13_10)    }$(13_10)}$(13_10)$(13_10)// Do the sound volume tween manually:$(13_10)if (currentVolume < targetVolume) {$(13_10)    currentVolume = min(currentVolume + fadeSpeed, targetVolume);$(13_10)    audio_sound_gain( movement_sound, currentVolume, 0);$(13_10)} else if (currentVolume > targetVolume) {$(13_10)    currentVolume = max(currentVolume - fadeSpeed, targetVolume);$(13_10)    audio_sound_gain( movement_sound, currentVolume, 0);$(13_10)    $(13_10)    // Here's where we delete the sound if it's done:$(13_10)    if (currentVolume <= 0) {$(13_10)		sound_position = audio_sound_get_track_position (movement_sound);$(13_10)        audio_stop_sound(movement_sound);$(13_10)		isPaused = true; $(13_10)		audio_sound_gain(music_sound, music_high_value, music_fade_time_ms)$(13_10)    }$(13_10)}$(13_10)$(13_10)$(13_10)$(13_10)// Collision event with the game object$(13_10)if (keyboard_check_pressed(vk_space) && $(13_10)	(collision_rectangle(x - 2, y - 2, x + 2, y + 2, obj_minigame, false, true))){$(13_10)	$(13_10)    // Collision logic (e.g., start a new window or level)$(13_10)    show_message("Collision!");$(13_10)}$(13_10)$(13_10)$(13_10)$(13_10)$(13_10)$(13_10)// Step Event in obj_player$(13_10)if (keyboard_check_pressed(vk_space) && collision_rectangle(x - 2, y - 2, x + 2, y + 2, obj_minigame, false, true)) {$(13_10)    if (obj_minigame.pressed_within_time) {$(13_10)        show_message("Success! You pressed the button in time.");$(13_10)        // Add your success logic here$(13_10)    } else {$(13_10)        show_message("Failed! You didn't press the button in time.");$(13_10)        // Add your failure logic here$(13_10)    }$(13_10)}$(13_10)$(13_10)$(13_10)$(13_10)$(13_10)$(13_10)//player spawn. If player has not already been in cave room$(13_10)$(13_10)$(13_10)// Room Start Event of room_cave if (!global.hasBeenToCave){$(13_10)    // Spawn the player at x = 780, y = 780$(13_10)   //x = 780;$(13_10)	// x = 780; // Replace obj_player with your player object's name$(13_10)  //global.hasBeenToCave = true;$(13_10)//global.inVillage = false;$(13_10)$(13_10)$(13_10)$(13_10)$(13_10)//depth$(13_10)depth = -bbox_bottom;$(13_10)"

right_key = keyboard_check(vk_right);
left_key = keyboard_check(vk_left);
up_key = keyboard_check(vk_up);
down_key = keyboard_check(vk_down);

//get xspd and yspd
xspd = (right_key - left_key) * move_spd;
yspd = (down_key - up_key) * move_spd;


if instance_exists(obj_pauser)
	


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


// Animate
if (xspd == 0 && yspd == 0) {
    image_index = 0;
}

//TO DO communicate which music is being played for each location

var moving = (xspd != 0 || yspd != 0);

if (moving != isMoving) {
    isMoving = moving;
    if (isMoving) {
        // If so, start the audio (note that the audio may already be playing in a fade-out, so we must check for this, rather than just play it.
        if (!audio_is_playing(movement_sound)) {
            
			if (isPaused) {
				movement_sound = audio_play_sound(snd_move, 1, true, 1, sound_position);
				isPaused = false;
				
			} else { 
				movement_sound = audio_play_sound(snd_move, 1, true);
			} 
			audio_sound_gain(music_sound, music_low_value, music_fade_time_ms)
			
        }
        targetVolume = 1;
    } else {
        // Else, fade out the audio... note that we do not "stop" the sound: it'll stop on its own once done.
        targetVolume = 0;
    }
}

// Do the sound volume tween manually:
if (currentVolume < targetVolume) {
    currentVolume = min(currentVolume + fadeSpeed, targetVolume);
    audio_sound_gain( movement_sound, currentVolume, 0);
} else if (currentVolume > targetVolume) {
    currentVolume = max(currentVolume - fadeSpeed, targetVolume);
    audio_sound_gain( movement_sound, currentVolume, 0);
    
    // Here's where we delete the sound if it's done:
    if (currentVolume <= 0) {
		sound_position = audio_sound_get_track_position (movement_sound);
        audio_stop_sound(movement_sound);
		isPaused = true; 
		audio_sound_gain(music_sound, music_high_value, music_fade_time_ms)
    }
}



// Collision event with the game object
if (keyboard_check_pressed(vk_space) && 
	(collision_rectangle(x - 2, y - 2, x + 2, y + 2, obj_minigame, false, true))){
	
    // Collision logic (e.g., start a new window or level)
    show_message("Collision!");
}





// Step Event in obj_player
if (keyboard_check_pressed(vk_space) && collision_rectangle(x - 2, y - 2, x + 2, y + 2, obj_minigame, false, true)) {
    if (obj_minigame.pressed_within_time) {
        show_message("Success! You pressed the button in time.");
        // Add your success logic here
    } else {
        show_message("Failed! You didn't press the button in time.");
        // Add your failure logic here
    }
}





//player spawn. If player has not already been in cave room


// Room Start Event of room_cave if (!global.hasBeenToCave){
    // Spawn the player at x = 780, y = 780
   //x = 780;
	// x = 780; // Replace obj_player with your player object's name
  //global.hasBeenToCave = true;
//global.inVillage = false;




//depth
depth = -bbox_bottom;