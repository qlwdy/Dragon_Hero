// Draw GUI Event in obj_minigame
if (pressed_within_time) {
    draw_text(room_width / 2, room_height / 2 - 20, "Quick-Time Event!");
    draw_text(room_width / 2, room_height / 2 + 20, "Press Space within 10 seconds");

    // Draw your image
    if (minigame_image != -1) {
        draw_sprite(minigame_image, 0, 100, 100);  // Adjust position as needed
    }

    // Check for quick-time event
    if (keyboard_check_pressed(vk_space)) {
        show_message("Success! You pressed the button in time.");
        // Add your success logic here
        global.minigame_active = false; // Close the GUI window
    }
}
