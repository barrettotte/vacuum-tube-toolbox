module plugin_coil(
    height=50,
    wall_thickness=5,
    pins=4,
    core_diameter=31.75,
    pin_diameter=4,
    hole_diameter=2.5
) {
    core_radius = core_diameter/2;
    pin_distance = pin_diameter*1.5;

    difference() {
        // core
        rotate([0,0,30])
            union() {
                cylinder(d=core_diameter, h=height-wall_thickness, $fn=6);
                translate([0,0,height-wall_thickness])
                    cylinder(d=core_diameter+(wall_thickness/2), h=wall_thickness);
            }

        // cut out center
        translate([0,0,wall_thickness])
            cylinder(d=core_diameter-wall_thickness, h=height);

        // cut out pin slots
        translate([pin_distance,0,0])
            cylinder(d=pin_diameter, h=wall_thickness);
        translate([0,pin_distance,0])
            cylinder(d=pin_diameter, h=wall_thickness);
        translate([-pin_distance,0,0])
            cylinder(d=pin_diameter, h=wall_thickness);
        translate([0,-pin_distance,0])
            cylinder(d=pin_diameter, h=wall_thickness);
        
        // cut out holes for wires
        for (z = [(wall_thickness + hole_diameter) : (hole_diameter * 2) : (height-wall_thickness-hole_diameter)]) {
            translate([(core_radius-wall_thickness), 0, z])
                rotate([0,90,0])
                    cylinder(d=hole_diameter, h=wall_thickness);
        }   
    }
}
