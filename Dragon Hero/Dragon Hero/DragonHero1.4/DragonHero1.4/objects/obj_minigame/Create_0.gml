// Create Event in obj_minigame
pressed_within_time = false;
quick_time_alarm = room_speed * 10; // 10 seconds

// Load your image
minigame_image = sprite_index = spr_cave_tiles;
if (minigame_image == -1) {
    show_message("Failed to load the sprite!");
}
// Collision Event with Player
if (keyboard_check_pressed(vk_space)) {
    pressed_within_time = true;
    alarm[0] = quick_time_alarm;
}

// Alarm[0] Event in obj_minigame
pressed_within_time = false;


