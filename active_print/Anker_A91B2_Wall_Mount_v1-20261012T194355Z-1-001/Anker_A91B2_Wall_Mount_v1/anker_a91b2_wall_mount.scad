// Anker Prime Charging Station A91B2 (8-in-1, 240W) wall mount
// Device nominal size from Anker: 78.0 x 137.9 x 18.0 mm (3.07 x 5.43 x 0.71 in)
// Orientation: long axis vertical, display/outlets facing out, USB-C short edge downward.
// Design intent: open-edge cradle so side USB-A and bottom USB-C ports remain accessible.
// Print flat with wall plate on bed. PETG preferred; PLA+ acceptable indoors.

$fn = 64;

// ---- USER-TUNABLE PARAMETERS ----
device_w = 78.0;
device_h = 137.9;
device_d = 18.0;
clearance = 0.8;          // total fit allowance around device width/depth
plate_t = 4.0;
plate_margin_x = 9.0;
plate_margin_y = 8.0;
rail_wall = 3.0;
front_lip = 3.2;          // amount clips overlap the front face
clip_h = 15.0;            // corner clip height along long axis
bottom_shelf_d = 6.0;     // shelf under bottom corners, leaves center USB-C area open
screw_d = 4.2;            // #8 / ~4 mm screw clearance
screw_head_d = 8.5;
screw_head_depth = 2.4;

inner_w = device_w + clearance;
inner_d = device_d + clearance;
plate_w = inner_w + 2*plate_margin_x;
plate_h = device_h + 2*plate_margin_y;

// centered X helper
module countersunk_hole(x,y){
    translate([x,y,-0.1]) cylinder(h=plate_t+0.2,d=screw_d);
    translate([x,y,plate_t-screw_head_depth]) cylinder(h=screw_head_depth+0.2,d1=screw_d,d2=screw_head_d);
}

module corner_clip(x_side=1, y0=0){
    // x_side = -1 left, +1 right
    x_inner = x_side*(inner_w/2);
    x_outer = x_side*(inner_w/2 + rail_wall);
    x0 = (x_side<0) ? x_outer : x_inner;
    // side wall
    translate([x0, y0, plate_t])
        cube([rail_wall, clip_h, inner_d + front_lip]);
    // front retaining lip only at corner, leaving the side largely open
    lip_x0 = (x_side<0) ? x_outer : (inner_w/2 - front_lip);
    translate([lip_x0, y0, plate_t + inner_d])
        cube([rail_wall + front_lip, clip_h, front_lip]);
}

module bottom_corner_shelf(x_side=1){
    // short ledge at lower corner only; center remains open for USB-C ports
    shelf_w = 16.0;
    x0 = (x_side<0) ? (-inner_w/2-rail_wall) : (inner_w/2 + rail_wall - shelf_w);
    translate([x0, plate_margin_y-0.01, plate_t])
        cube([shelf_w, bottom_shelf_d, inner_d + front_lip]);
}

module mount(){
    difference(){
        union(){
            // wall plate
            translate([-plate_w/2,0,0]) cube([plate_w,plate_h,plate_t]);

            // lower corner clips
            corner_clip(-1, plate_margin_y);
            corner_clip( 1, plate_margin_y);
            bottom_corner_shelf(-1);
            bottom_corner_shelf( 1);

            // upper corner clips
            corner_clip(-1, plate_margin_y + device_h - clip_h);
            corner_clip( 1, plate_margin_y + device_h - clip_h);
        }

        // screw holes, outside device footprint so device can stay installed
        countersunk_hole(0, plate_margin_y/2 + 3.0);
        countersunk_hole(0, plate_h - plate_margin_y/2 - 3.0);

        // large ventilation / weight-relief windows behind device
        translate([-inner_w/2+8, plate_margin_y+22, -0.1])
            cube([inner_w-16, 36, plate_t+0.2]);
        translate([-inner_w/2+8, plate_margin_y+80, -0.1])
            cube([inner_w-16, 36, plate_t+0.2]);
    }
}

mount();
