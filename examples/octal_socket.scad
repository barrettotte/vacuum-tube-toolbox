include <../VacuumTubes/sockets.scad>

// openscad -o temp/octal_socket.stl examples/octal_socket.scad

$fs = 0.1;
$fn = 60;

tolerance = 0.1;

octal_socket(socket_diameter=27.75, pin_diameter=4.15 + tolerance, 
    center_diameter=8.65 + tolerance, socket_height=15, notch_length=2, pin_offset=8.5);
