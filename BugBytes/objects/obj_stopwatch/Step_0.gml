timer += 1;

// Update seconds and minutes
if (timer >= room_speed) {
    timer = 0;
    seconds += 1;
    if (seconds >= 60) {
        seconds = 0;
        minutes += 1;
    }
}