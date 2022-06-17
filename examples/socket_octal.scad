include <../VacuumTubes/sockets.scad>

// openscad -o temp/socket_octal.stl examples/socket_octal.scad

$fs = 0.1;
$fn = 60;

pin_tolerance = 0.1;
center_tolerance = 0.1;

tube_socket(pin_count=8, socket_diameter=27.75, pin_diameter=4.15 + pin_tolerance, 
    center_diameter=8.65 + center_tolerance, socket_height=15, notch_length=2, pin_offset=8.5);
