module getMiddlePart(dimensions) {
    x = dimensions[0];
    y = dimensions[1];
    z = dimensions[2];
    translate([0, y/3, 0]) {
        cube([x, y/3, z]);
    }
}
module bridleJointFemale(dimensions) {
    difference() {
        cube(dimensions);
        getMiddlePart(dimensions);
    }
}

module bridleJointMale(dimensions) {
    getMiddlePart(dimensions);
}