// Sockets for various vacuum tubes

// Base tube socket
module tube_socket(
    pin_count,           // number of pins
    pin_diameter,        // diameter of each pin
    pin_offset,          // pin offset from center
    socket_diameter,     // diameter of socket base
    socket_height,       // height of socket base

    center_diameter=0,   // diameter of center hole in socket base
    notch_length=0       // length of center notch
) {
    socket_radius = socket_diameter / 2;     // radius of socket base
    pin_radius = pin_diameter / 2;           // radius of each pin

    difference() {
        // socket base
        cylinder(socket_height, socket_radius, socket_radius);

        // pin holes
        for (i = [0:pin_count-1]) {
            translate([sin(360*i/pin_count) * pin_offset, cos(360*i/pin_count) * pin_offset, 0])
                cylinder(socket_height*2, pin_radius, pin_radius);
        }

        // center hole
        if (center_diameter > 0) {
            center_radius = center_diameter / 2;     // radius of center hole
            notch_rotation = 90 + (180 / pin_count); // notch rotation position

            union() {
                if (notch_length > 0) {
                    rotate([0, 0, notch_rotation])
                        translate([center_radius, 0, 0])
                            cube(size=[notch_length, notch_length, socket_height*2], center=true);
                }
                // hole
                cylinder(socket_height*2, center_radius, center_radius);
            }
        }
    }
}

// 8 pin socket
module socket_8(
    pin_diameter, pin_offset, socket_diameter, socket_height, 
    center_diameter=0, notch_length=0
) {
    tube_socket(8, pin_diameter, pin_offset, socket_diameter, socket_height, center_diameter, notch_length);
}

// 4 pin socket
module socket_4(
    pin_diameter, pin_offset, socket_diameter, socket_height, 
    center_diameter=0, notch_length=0
) {
    tube_socket(4, pin_diameter, pin_offset, socket_diameter, socket_height, center_diameter, notch_length);
}
