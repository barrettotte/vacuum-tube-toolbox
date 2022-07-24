include <../VacuumTubes/sockets.scad>

// openscad -o examples/socket_8_mounted.stl examples/socket_8_mounted.scad

$fs = 0.1;
$fn = 60;

tolerance = 0.1;

socket_mounted(pins=8, pin_diameter=4.15 + tolerance, pin_offset=8.5, socket_diameter=27.75, 
    socket_height=15, center_diameter=8.65 + tolerance, notch_length=2,
    mount_hole_diameter=3, mount_width=9, mount_height=3.5);
