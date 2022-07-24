include <../VacuumTubes/sockets.scad>

// openscad -o temp/socket_8.stl examples/socket_8.scad

$fs = 0.1;
$fn = 60;

tolerance = 0.1;

socket_8(pin_diameter=4.15 + tolerance, pin_offset=8.5, socket_diameter=27.75, 
    socket_height=15, center_diameter=8.65 + tolerance, notch_length=2);
