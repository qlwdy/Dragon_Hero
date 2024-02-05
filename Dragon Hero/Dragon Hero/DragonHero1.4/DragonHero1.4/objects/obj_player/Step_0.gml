
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
// Step Event in obj_player
if (keyboard_check_pressed(vk_space) && place_meeting(x,y,obj_minigame)) {
    // Open the GUI window for the mini-game
    global.minigame_active = true;
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