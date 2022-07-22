// Sockets for various vacuum tubes

// Base tube socket
module tube_socket(
    pin_count,       // number of pins
    socket_diameter, // diameter of socket base
    pin_diameter,    // diameter of each pin
    center_diameter, // diameter of center hole in socket base
    socket_height,   // height of socket base
    notch_length,    // length of center notch
    pin_offset       // pin offset from center
) {
    // TODO: optional notch
    // TODO: optional override individual pin diameters (array)
    // TODO: optional mount with screw holes

    socket_radius = socket_diameter / 2;     // radius of socket base
    center_radius = center_diameter / 2;     // radius of center hole
    pin_radius = pin_diameter / 2;           // radius of each pin
    notch_rotation = 90 + (180 / pin_count); // notch rotation position
    notch_offset = center_radius;            // notch offset from center

    difference() {
        // socket base
        cylinder(socket_height, socket_radius, socket_radius);

        // pin holes
        for (i = [0:pin_count-1]) {
            translate([sin(360*i/pin_count) * pin_offset, cos(360*i/pin_count) * pin_offset, 0])
                cylinder(socket_height*2, pin_radius, pin_radius);
        }

        // center hole
        rotate([0, 0, notch_rotation])
            union() {
                // notch
                translate([notch_offset, 0, 0])
                    cube(size=[notch_length, notch_length, socket_height*2], center=true);
                // hole
                cylinder(socket_height*2, center_radius, center_radius);
            }
    }
}

// 8 pin socket
module octal_socket(socket_diameter, pin_diameter, center_diameter, socket_height, notch_length, pin_offset) {
    tube_socket(8, socket_diameter, pin_diameter, center_diameter, socket_height, notch_length, pin_offset);
}
