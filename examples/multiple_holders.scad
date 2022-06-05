include <../VacuumTubes/holders.scad>

$fs = 0.1;
$fn = 60;

socket_diameter = 27.75;
socket_tolerance = 0.1;
socket_padding = 5;
socket_depth = 7;
height = 10;
edge_padding = 2.5;

tube_holder(rows=1, cols=1, socket_diameter=socket_diameter, socket_tolerance=socket_tolerance, 
    socket_padding=socket_padding, socket_depth=socket_depth, height=height, edge_padding=edge_padding);

translate([0, 100, 0])
    tube_holder(rows=2, cols=4, socket_diameter=socket_diameter, socket_tolerance=socket_tolerance, 
        socket_padding=socket_padding, socket_depth=socket_depth, height=height, edge_padding=edge_padding);

translate([150, 0, 0])
    tube_holder(rows=1, cols=8, socket_diameter=socket_diameter, socket_tolerance=socket_tolerance, 
        socket_padding=socket_padding, socket_depth=socket_depth, height=height, edge_padding=edge_padding);
