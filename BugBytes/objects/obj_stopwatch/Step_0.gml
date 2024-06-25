global.timer += 1;

// Update seconds and minutes
if (global.timer >= room_speed) {
    global.timer = 0;
    global.seconds += 1;
    if (global.seconds >= 60) {
        global.seconds = 0;
        global.minutes += 1;
    }
}