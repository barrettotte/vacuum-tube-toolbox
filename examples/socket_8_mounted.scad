include <../VacuumTubes/sockets.scad>

// openscad -o examples/socket_8_mounted.stl examples/socket_8_mounted.scad

$fs = 0.1;
$fn = 60;

tolerance = 0.1;

// test with spade connectors - not very good
// socket_mounted(pins=8, pin_diameter=4.75 + tolerance, pin_offset=8.5, socket_diameter=27.75, 
//     socket_height=15.5, center_diameter=8.65 + tolerance, notch_length=2,
//     mount_hole_diameter=3.1 + tolerance, mount_width=9, mount_height=7.5, mount_pin_diameter=3.25);

// test with copper foil
socket_mounted(pins=8, pin_diameter=3 + tolerance, pin_offset=8.5, socket_diameter=27.75, 
    socket_height=19.75, center_diameter=8.65 + tolerance, notch_length=2,
    mount_hole_diameter=3.1 + tolerance, mount_width=9, mount_height=7.5, mount_pin_diameter=2+tolerance);
