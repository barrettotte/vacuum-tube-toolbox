include <../VacuumTubes/sockets.scad>

// openscad -o temp/demo_sockets.stl examples/demo_sockets.scad

$fs = 0.1;
$fn = 60;

tolerance = 0.1;

octal_socket(pin_diameter=4.15 + tolerance, pin_offset=8.5, socket_diameter=27.75, 
    socket_height=15, center_diameter=8.65 + tolerance, notch_length=2);

translate([0, 35, 0])
    tetral_socket(pin_diameter=3+tolerance, pin_offset=5, socket_diameter=20, socket_height=15);
