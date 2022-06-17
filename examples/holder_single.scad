include <../VacuumTubes/holders.scad>

// openscad -o temp/holder_single.stl examples/holder_single.scad

$fs = 0.1;
$fn = 60;

socket_tolerance = 0.3;

tube_holder(rows=1, cols=1, socket_diameter=27.75 + socket_tolerance, 
    socket_padding=5, socket_depth=7, height=10, edge_padding=2.5);
