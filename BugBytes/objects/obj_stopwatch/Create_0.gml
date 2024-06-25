timer = 0;
minutes = 0;
seconds = 0;

function format_time(value) {
    if (value < 10) {
        return "0" + string(value);
    } else {
        return string(value);
    }
}