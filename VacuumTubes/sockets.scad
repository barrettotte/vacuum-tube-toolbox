
// TODO: socket_mount  (screw holes)

module tube_socket(
    pins=8,                    //
    socket_diameter=27.75,     //
    pin_diameter=4.15,         //
    center_diameter=8.65,      //
    socket_height=15,          // 
    notch_length=2,            // length of center notch
    pin_offset=8.5             // pin offset from center
) {
    // TODO: optional notch
    // TODO: optional override individual pin diameters (array)
    // TODO: optional mount

    socket_radius = socket_diameter/2; // radius of socket
    center_radius = center_diameter/2; // radius of center hole
    pin_radius = pin_diameter/2;       // radius of each pin
    notch_rotation = 90 + (180/pins);  // notch rotation position
    notch_offset = center_radius;      // notch offset from center

    difference() {

        // socket base
        cylinder(socket_height, socket_radius, socket_radius);
        
        // pin holes
        for (i = [0:pins-1]) {
            translate([sin(360*i/pins) * pin_offset, cos(360*i/pins) * pin_offset, 0])
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
