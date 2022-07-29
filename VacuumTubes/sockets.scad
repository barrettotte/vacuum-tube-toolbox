// Sockets for various vacuum tubes

// Base tube socket
module tube_socket(
    pins,              // number of pins
    pin_diameter,      // diameter of each pin
    pin_offset,        // pin offset from center
    socket_diameter,   // diameter of socket base
    socket_height,     // height of socket base

    center_diameter=0, // diameter of center hole in socket base
    notch_length=0     // length of center notch
) {
    socket_radius = socket_diameter / 2; // radius of socket base
    pin_radius = pin_diameter / 2;       // radius of each pin

    difference() {
        // socket base
        cylinder(socket_height, socket_radius, socket_radius);

        // pin holes
        for (i = [0:pins-1]) {
            translate([sin(360*i/pins) * pin_offset, cos(360*i/pins) * pin_offset, 0])
                cylinder(socket_height*2, pin_radius, pin_radius);
        }

        // center hole
        if (center_diameter > 0) {
            center_radius = center_diameter / 2; // radius of center hole
            notch_rotation = 90 + (180 / pins);  // notch rotation position

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

// socket with screw mounts
module socket_mounted(
    pins, pin_diameter, pin_offset, socket_diameter, socket_height,

    center_diameter=0, notch_length=0,
    mount_pin_diameter,   // diameter of pin at bottom (mount)
    mount_hole_diameter,  // diameter of mounting holes 
    mount_width,          // width of mounting base on each side
    mount_height          // height of base mount
) {
    difference() {
        union() {
            // base socket
            tube_socket(pins, pin_diameter, pin_offset, socket_diameter,
                socket_height, center_diameter, notch_length);

            // mount
            difference() {
                linear_extrude(height=2)
                    resize([socket_diameter+5, (2 * mount_width) + socket_diameter])
                        circle(d=1);

                // holes
                hole_y = (socket_diameter/2) + mount_width - (2 * mount_hole_diameter);

                translate([0, hole_y, 0])
                    cylinder(d=mount_hole_diameter, h=mount_height);
                translate([0, -hole_y, 0])
                    cylinder(d=mount_hole_diameter, h=mount_height);
            }
        }
        // bottom pin holes - leave room to melt through
        for (i = [0:pins-1]) {
            translate([sin(360*i/pins) * pin_offset, cos(360*i/pins) * pin_offset, 0])
                cylinder(d=mount_pin_diameter, h=mount_height);
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
