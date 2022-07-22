// Organization for displaying vacuum tubes.

// Base tube holder
module tube_holder(
    rows,            // rows of holder
    cols,            // columns of holder
    socket_diameter, // diameter of socket cutout
    socket_padding,  // padding around socket
    socket_depth,    // how far down the socket should cut into the holder
    height,          // height of holder
    edge_padding,    // extra padding from edge of holder to last socket slot
    fillet           // fillet around holder
) {
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
                    cylinder(d=socket_diameter, h=socket_depth);
            }
        }
    }
}

// Square tube holder
module holder_square(length, socket_diameter, socket_padding, socket_depth, height, edge_padding, fillet) {
    tube_holder(length, length, socket_diameter, socket_padding, socket_depth, height, edge_padding, fillet);
}

// Single tube holder
module holder_single(socket_diameter, socket_padding, socket_depth, height, edge_padding, fillet) {
    holder_square(1, socket_diameter, socket_padding, socket_depth, height, edge_padding, fillet);
}
