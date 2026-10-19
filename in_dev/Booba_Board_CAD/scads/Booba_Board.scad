// Booba recognition board. Units: mm. OpenSCAD F6 then export STL.
// Print models are oriented for printing: tiles sticker-face DOWN, pockets UP.
part = "board"; // [board,tiles,tile,days,day,parking,fit_test,assembly]
magnet_d = 4;
magnet_t = 2;
hole_clearance = 0.25; // diametral glue-fit allowance; test before full print
pocket_extra = 0.10;
tile_w = 38;
tile_h = 26;
tile_t = 3.4;
seat_clearance = 0.6; // total width / height clearance
seat_depth = 0.8;
board_w = 180;
board_h = 240;
board_t = 5;
pitch_x = 42;
pitch_y = 34;
magnet_spacing = 18;
day_w = 100;
day_h = 22;
$fn=64;
eps=0.02;
assert(tile_w+seat_clearance < pitch_x && tile_h+seat_clearance < pitch_y,"Tiles exceed station pitch");
assert(board_w<=246 && board_h<=246,"Keep clearance inside 256 mm bed");
module rr(w,h,r=4) { offset(r=r) square([w-2*r,h-2*r],center=true); }
module slab(w,h,t,r=4) { linear_extrude(t) rr(w,h,r); }
module holes(z,spacing=magnet_spacing,d=magnet_d+hole_clearance) {
 for(x=[-spacing/2,spacing/2]) translate([x,0,z]) cylinder(d=d,h=magnet_t+pocket_extra+eps);
}
module station(w=tile_w,h=tile_h,spacing=magnet_spacing) {
 translate([0,0,board_t-seat_depth]) slab(w+seat_clearance,h+seat_clearance,seat_depth+eps);
 holes(board_t-seat_depth-magnet_t-pocket_extra,spacing);
}
module board() {
 difference() {
  union() {
   translate([board_w/2,board_h/2,0]) slab(board_w,board_h,board_t,7);
   translate([board_w/2,224,board_t-eps]) linear_extrude(.62) text("BOOBA BOARD",size=9,halign="center",valign="center",font="DejaVu Sans:style=Bold");
  }
  for(c=[0:3],r=[0:4]) translate([27+c*pitch_x,29+r*pitch_y,0]) station();
  translate([board_w/2,199,0]) station(day_w,day_h,70);
  // Optional screw-hanging holes; do not use as an assumed refrigerator mount.
  for(x=[10,board_w-10]) translate([x,229,-eps]) cylinder(d=4.5,h=board_t+1);
 }
}
module tile(w=tile_w,h=tile_h,spacing=magnet_spacing,label="") {
 difference() {
  slab(w,h,tile_t);
  holes(tile_t-magnet_t-pocket_extra,spacing);
  // Mirrored underside text becomes readable when the tile is turned over.
  if(label!="") translate([0,0,-eps]) mirror([0,1,0]) linear_extrude(.42) text(label,size=7,halign="center",valign="center",font="DejaVu Sans:style=Bold");
 }
}
module parking() {
 // Desktop comb: four lanes, each holds four tiles standing vertically.
 // Total 164 x 40 x 12. 4.2 mm slot for 3.4 mm tile; 3 mm bottom.
 difference() {
  translate([82,20,0]) slab(164,40,12,3);
  for(c=[0:3],r=[0:3]) translate([2+c*40.5,3+r*9,3]) cube([39.5,4.2,10]);
 }
}
module fit_test() {
 difference() {
  translate([0,0,0]) slab(44,32,board_t,4);
  station();
 }
 translate([50,0,0]) tile();
}
if(part=="board") board();
if(part=="tile") tile();
if(part=="tiles") for(c=[0:3],r=[0:3]) translate([tile_w/2+c*(tile_w+5),tile_h/2+r*(tile_h+5),0]) tile();
if(part=="day") tile(day_w,day_h,70,"MONDAY");
if(part=="days") for(i=[0:6]) translate([day_w/2,day_h/2+i*(day_h+5),0]) tile(day_w,day_h,70,["MONDAY","TUESDAY","WEDNESDAY","THURSDAY","FRIDAY","SATURDAY","SUNDAY"][i]);
if(part=="parking") parking();
if(part=="fit_test") fit_test();
if(part=="assembly") {
 color("#28565c") board();
 for(c=[0:3],r=[0:3]) color([0.94,0.72+0.04*c,0.35+0.08*r]) translate([27+c*pitch_x,29+r*pitch_y,board_t-seat_depth+tile_t]) rotate([180,0,0]) tile();
 color("Ivory") translate([board_w/2,199,board_t-seat_depth+tile_t]) rotate([180,0,0]) tile(day_w,day_h,70,"FRIDAY");
 color("#28565c") translate([195,0,0]) parking();
}
