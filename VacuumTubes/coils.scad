module plugin_coil(
    height=50,
    wall_thickness=2.5,
    pin_count=4,
    core_diameter=31.75,
    pin_diameter=2.25,
    wire_hole_diameter=1.5
) {
    core_radius = core_diameter/2;
    pin_distance = pin_diameter*1.5;
    pin_radius = pin_diameter/2;           // radius of each pin
    wire_hole_radius = wire_hole_diameter/2;

    difference() {
        // core
        cylinder(d=core_diameter, h=height-wall_thickness);

        // cut out center
        translate([0,0,wall_thickness])
            cylinder(d=core_diameter-wall_thickness, h=height);
        
        // cut out pin holes
        for (i = [0:pin_count-1]) {
            translate([sin(360*i/pin_count) * (pin_diameter * 2), cos(360*i/pin_count) * (pin_diameter * 2), 0])
                cylinder(wall_thickness, pin_radius, pin_radius);
        }

        // cut out side wire holes
        hole_height_max = height - wall_thickness - (wire_hole_diameter * 2);
        for (z = [(wall_thickness + wire_hole_diameter) : (wire_hole_diameter * 2) : hole_height_max]) {
            translate([(core_radius - wall_thickness), 0, z])
                rotate([0,90,0])
                    cylinder(d=wire_hole_diameter, h=wall_thickness);
        }   

        // cut out bottom wire holes
        for (i = [0:pin_count-1]) {
            translate([sin(360*i/pin_count) * (wire_hole_diameter * 5), cos(360*i/pin_count) * (wire_hole_diameter * 5), 0])
                cylinder(wall_thickness, wire_hole_radius, wire_hole_radius);
        }
    }
}
