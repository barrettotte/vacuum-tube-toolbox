module tube_holder(
    rows=1,                //
    cols=1,                //
    socket_diameter=27.75, // 
    socket_tolerance=0.1,  // tolerance for socket diameter
    socket_padding=5,      // padding around socket
    socket_depth=7,        // how far down the socket should cut into the holder
    height=10,             // height of holder
    edge_padding=2.5,      // extra padding from edge of holder to last socket slot
    fillet = 4             // fillet around holder
) {
    socket_radius = (socket_diameter + socket_tolerance) / 2;
    socket_slot = socket_diameter + (socket_padding * 2);
    slot_offset = edge_padding + (socket_slot / 2);

    difference() {
        // create base
        hull() {
            base_x = (rows * socket_slot) + (2 * edge_padding);
            base_y = (cols * socket_slot) + (2 * edge_padding);

            translate([0, 0, 0]) cylinder(r=fillet, h=height);
            translate([base_x, 0, 0]) cylinder(r=fillet, h=height);
            translate([0, base_y, 0]) cylinder(r=fillet, h=height);
            translate([base_x, base_y, 0]) cylinder(r=fillet, h=height);
        }

        // socket holes
        for (i = [0:rows-1]) {
            for (j = [0:cols-1]) {
                socket_x = slot_offset + (i * socket_slot);
                socket_y = slot_offset + (j * socket_slot);

                translate([socket_x, socket_y, height-socket_depth])
                    cylinder(r=socket_radius, h=socket_depth);
            }
        }
    }
}
