
xspd = 0;
yspd = 0;

move_spd = 1;


sprite[RIGHT] = spr_player_right;
sprite[UP] = spr_player_up;
sprite[LEFT] = spr_player_left;
sprite[DOWN] = spr_player_down;

face = DOWN;



isMoving = false;
isPaused = false;
sound_position = 0;
targetVolume = 1; // Max volume
currentVolume = 0; // Start with volume at 0
fadeSpeed = 0.05;

movement_sound = snd_move;
music_high_value = 0.2;
music_low_value = 0.4;
music_fade_time_ms = 1200;
music_sound = audio_play_sound(Dragon_Theme_2, 1, true, music_high_value, 0, 1); 


// Create Event of an object
global.hasBeenToCave = false;

global.inVillage = true;