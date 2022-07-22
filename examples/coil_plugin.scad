include <../VacuumTubes/coils.scad>

$fs = 0.1;
$fn = 60;

tolerance = 0.1;

plugin_coil(height=60, wall_thickness=2.5, bottom_thickness=3.5, pin_count=4, 
    core_diameter=31.75, pin_diameter=2.05+tolerance, wire_hole_diameter=1.75+tolerance);
