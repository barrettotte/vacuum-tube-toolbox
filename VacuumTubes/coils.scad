module plugin_coil(
    height=50,
    wall_thickness=2.5,
    pins=4,
    core_diameter=31.75,
    pin_diameter=2.25,
    wire_hole_diameter=1.5
) {
    core_radius = core_diameter / 2;
    pin_distance = pin_diameter * 1.5;

    difference() {
        // core
        cylinder(d=core_diameter, h=height-wall_thickness);

        // cut out center
        translate([0,0,wall_thickness])
            cylinder(d=core_diameter-wall_thickness, h=height);

        // cut out pin holes
        rotate([0,0,45])
            union() {
                translate([pin_distance, 0, 0])
                    cylinder(d=pin_diameter, h=wall_thickness);
                translate([0, pin_distance, 0])
                    cylinder(d=pin_diameter, h=wall_thickness);
                translate([-pin_distance, 0, 0])
                    cylinder(d=pin_diameter, h=wall_thickness);
                translate([0, -pin_distance, 0])
                    cylinder(d=pin_diameter, h=wall_thickness);
            }

        // cut out holes for wires on bottom
        rotate([0,0,45])
            union() {
                translate([pin_distance + 5, 0, 0])
                    cylinder(d=wire_hole_diameter, h=wall_thickness);
                translate([0, pin_distance + 5, 0])
                    cylinder(d=wire_hole_diameter, h=wall_thickness);
                translate([-pin_distance - 5, 0, 0])
                    cylinder(d=wire_hole_diameter, h=wall_thickness);
                translate([0, -pin_distance - 5, 0])
                    cylinder(d=wire_hole_diameter, h=wall_thickness);
            }

        // cut out holes for wires on side
        hole_height_max = height - wall_thickness - (wire_hole_diameter * 2);
        for (z = [(wall_thickness + wire_hole_diameter) : (wire_hole_diameter * 2) : hole_height_max]) {
            translate([(core_radius - wall_thickness), 0, z])
                rotate([0,90,0])
                    cylinder(d=wire_hole_diameter, h=wall_thickness);
        }   
    }
}
