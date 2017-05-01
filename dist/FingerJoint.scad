module createFingerJoints(dimensions, fingerCount, startingIndex, endingIndex) {
    x = dimensions[0] / (fingerCount*2);
    y = dimensions[1];
    z = dimensions[2];
    
    for(i=[startingIndex: 2: endingIndex]) {
        translate([i * x, 0, 0]) {
            cube([x, y, z]);
        }
    }
}

module fingerJointA(dimensions, fingerCount) {
    createFingerJoints(dimensions, fingerCount, 0, (fingerCount - 1) * 2);
}

module fingerJointB(dimensions, fingerCount) {
    createFingerJoints(dimensions, fingerCount, 1, (fingerCount - 1) * 2);
}