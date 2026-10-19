BOOBA RECOGNITION BOARD — PRINT & ASSEMBLY
All dimensions are millimetres. Designed from the supplied concept, not measured stickers.

FILES / QUANTITIES
Board_180x240.stl: print 1. 180 x 240 x 5.6 including raised heading.
Sticker_Tiles_16.stl: print 1 batch = 16 tiles, each 38 x 26 x 3.4.
Sticker_Tile_Single.stl: spare / test / optional four additional tiles.
Day_Tiles_7.stl: print 1 batch, 7 weekday labels, each 100 x 22 x 3.4.
Parking_Rack_16.stl: print 1. Desktop slotted organizer, 164 x 40 x 12.
Fit_Test.stl: one sample board seat plus one tile. Print FIRST.
Booba_Board.scad: editable source, part selector and dimensions at top.
Design_Preview.png: assembled CAD visualization; colors illustrative.
Mesh_Checks.json: exported STL geometry validation, not physical fit testing.

DESIGN
20 seats arranged 4 columns x 5 rows. 16 sticker tiles supplied; 4 spare seats.
Seat pitch 42 horizontal x 34 vertical. Day tile sits above the grid.
Seats have 0.6 total lateral clearance and are 0.8 deep.
Tiles protrude 2.6 above the board, allowing fingers to lift them.
Rounded tile corners: radius 4. Sticker envelope should stay inside the rounded
38 x 26 outline; a centered 34 x 22 rectangular sticker fits with margin.
Sticker dimensions were not provided. Verify your stickers BEFORE full printing.
The SCAD allows changes but larger tiles require matching pitch / board changes.
Do NOT scale finished STLs in the slicer: this changes magnet hole dimensions.
Parking rack holds all 16 tiles upright in four lanes of four; no magnets needed.
It is a separate desktop accessory, not an integrated wall-mounted storage area.
Weekday tiles can be stored separately. The rack does not fit the 100 mm day tiles.

MAGNETS
Use the photographed 4 mm diameter x 2 mm thick discs.
Board: 40 (2 per seat) + 2 at weekday location = 42.
Sticker tiles: 32. Seven weekday tiles: 14. TOTAL = 88.
Four extra sticker tiles, if desired, add 8 = 96 total.
Fit-test board seat consumes 2 extra magnets; test tile can join the working set.
The larger 1/2 x 1/4 inch discs would be 12.7 diameter x 6.35 thick;
they are not used in this design.

Pockets are 4.25 diameter x 2.10 deep for glue fit, not force fit.
At nominal 2 mm magnet thickness the face sits 0.10 below its mating surface;
a pair has approximately 0.20 separation. Actual magnetic strength is unknown.
Verify fit AND holding force with the coupon and your chosen filament first.
If pockets are too tight/loose, edit hole_clearance and re-export affected parts.
If nominal magnets are not 4 x 2, measure and update magnet_d / magnet_t.

PRINT
Suggested starting point: PLA, 0.20 mm layer height, 3 walls, 5 top/bottom layers,
15–20% infill. No supports required for board, blank tiles, rack or fit test.
Use the exported orientations: board front up; tiles sticker face DOWN,
magnet pockets UP. Weekday lettering is engraved 0.4 into the bed-facing side;
small text cavities bridge at 0.4 mm. Inspect first layers in slicer; no supports.
A smooth plate gives smoother sticker faces. Weekday letters can be paint-filled.
Board max long axis 240 leaves 16 mm total inside a 256 bed.
A 5 mm brim makes the footprint 250; ensure slicer exclusion zones allow it.
All supplied batches individually fit a 256 x 256 bed. Do not combine all parts
onto one plate. Orient and center the fit test if the slicer imports it off-center.
Keep the board flat during cooling to limit warping.

ASSEMBLY
1. Print the fit test. Check the tile slides into the shallow seat without force.
2. Dry-fit magnets. Do not hammer them in. Remove debris / elephant foot if needed.
3. Establish polarity before glue. Every board location must present the SAME
   pole outward; every removable tile must present the OPPOSITE pole outward.
   This includes the day slot. Test every pair before gluing.
4. Use a small quantity of plastic-compatible epoxy or CA, keeping magnet faces
   clean and at designed depth. Follow adhesive curing instructions.
5. Put stickers on the smooth face opposite the magnet pockets.
6. Fit tiles in any seat; the two magnets resist rotation and the shallow seats
   locate them. Park unused tiles vertically in the separate desktop rack.
7. Optional hanging: two 4.5 mm through holes, 160 mm apart near the top.
   Use appropriate screws / anchors for the support. No hardware supplied.
   Rear face also accepts suitable mounting tape. Refrigerator attachment is
   not included: the small magnets are allocated to tiles, not board mounting.

Small loose magnets must be securely bonded and kept away from children/pets.
This is a CAD-validated prototype, not a physically printed or pull-tested part.

EDIT / EXPORT
Open Booba_Board.scad in OpenSCAD. Set part to board, tiles, tile, days, day,
parking or fit_test; F6 Render then File > Export > STL.
part="assembly" shows assembled layout and is NOT a print/export plate.
Example CLI: openscad -o Board.stl -D 'part="board"' Booba_Board.scad
