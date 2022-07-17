module plugin_coil(
    height=50,
    wall_thickness=2.5,
    bottom_thickness=3.5,
    pin_count=4,
    core_diameter=31.75,
    pin_diameter=2.45,
    wire_hole_diameter=1.75
) {
    core_radius = core_diameter/2;
    pin_distance = pin_diameter*1.5;

    difference() {
        // core
        cylinder(d=core_diameter, h=height-wall_thickness);

        // cut out center
        translate([0,0,bottom_thickness])
            cylinder(d=core_diameter-wall_thickness, h=height);
        
        // cut out pin holes
        for (i = [0:pin_count-1]) {
            translate([sin(360*i/pin_count) * (pin_diameter * 2), cos(360*i/pin_count) * (pin_diameter * 2), 0])
                cylinder(d=pin_diameter, h=bottom_thickness);
        }

        // cut out side wire holes
        hole_height_max = height - bottom_thickness - (wire_hole_diameter * 2);
        for (z = [(bottom_thickness + wire_hole_diameter) : (wire_hole_diameter * 2) : hole_height_max]) {
            translate([(core_radius - wall_thickness), 0, z])
                rotate([0,90,0])
                    cylinder(d=wire_hole_diameter, h=wall_thickness);
        }

        // cut out bottom wire holes
        for (i = [0:pin_count-1]) {
            translate([sin(360*i/pin_count) * (wire_hole_diameter * 5.5), cos(360*i/pin_count) * (wire_hole_diameter * 5.5), 0])
                cylinder(d=wire_hole_diameter, h=bottom_thickness);
        }
    }
}
