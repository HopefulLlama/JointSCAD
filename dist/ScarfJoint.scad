use <Shoulder.scad>;

module scarfJointA(dimensions) {
    translate([dimensions[0], 0, dimensions[2]]) {
        rotate([0, 180, 0]) {
            shoulder(dimensions);
        }
    }
}

module scarfJointB(dimensions) {
    shoulder(dimensions);
}