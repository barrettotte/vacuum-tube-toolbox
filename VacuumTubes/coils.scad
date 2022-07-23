// Plugin coils for building old radio coil tubes

// Base plugin coil
module plugin_coil(
    height,            // height of tube coil
    wall_thickness,    // thickness of tube
    bottom_thickness,  // thickness between bottom and inside of tube
    pin_count,         // number of pins
    core_diameter,     // diameter of tube
    pin_diameter,      // diameter of each pin
    wire_hole_diameter // diameter of wire to pass through tube
) {
    core_radius = core_diameter/2;

    difference() {
        // core
        cylinder(d=core_diameter, h=height-wall_thickness);

        // cut out center
        translate([0,0,bottom_thickness])
            cylinder(d=core_diameter-wall_thickness, h=height);
        
        // cut out pin holes
        for (i = [0:pin_count-1]) {
            pin_x = sin(360 * i / pin_count) * (pin_diameter * 2);
            pin_y = cos(360 * i / pin_count) * (pin_diameter * 2);
            translate([pin_x, pin_y, 0])
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
            pin_x = sin(360 * i / pin_count) * (wire_hole_diameter * 5.5);
            pin_y = cos(360 * i / pin_count) * (wire_hole_diameter * 5.5);
            translate([pin_x, pin_y, 0])
                cylinder(d=wire_hole_diameter, h=bottom_thickness);
        }
    }
}

// plugin coil with screw mounts
module plugin_coil_mounted(
    height,              //
    wall_thickness,      //
    bottom_thickness,    //
    pin_count,           //
    core_diameter,       //
    pin_diameter,        //
    wire_hole_diameter,  //
    mount_hole_diameter, // diameter of mounting holes 
    mount_width          // width of mounting base on each side
) {
    union() {
        // base tube
        plugin_coil(height, wall_thickness, bottom_thickness, pin_count, core_diameter, pin_diameter, wire_hole_diameter);

        // mount
        difference() {
            linear_extrude(height=bottom_thickness)
                resize([core_diameter+5, (2 * mount_width) + core_diameter])
                    circle(d=1);
            cylinder(d=core_diameter, h=bottom_thickness);

            // holes
            hole_x = (core_diameter/2) + mount_width - (2 * mount_hole_diameter);

            translate([0, hole_x, 0])
                cylinder(d=mount_hole_diameter, h=bottom_thickness);
            translate([0, -hole_x, 0])
                cylinder(d=mount_hole_diameter, h=bottom_thickness);
        }
    }
}
