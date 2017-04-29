module createFingerJoints(dimensions, fingerCount, startingIndex, endingIndex) {
    x = dimensions[0];
    y = dimensions[1]/ (fingerCount*2);
    z = dimensions[2];
    
    for(i=[startingIndex: 2: endingIndex]) {
        echo(y/fingerCount * 2);
        translate([0, i * y, 0]) {
            cube([x, y, z]);
        }
    }
}

module fingerJointMale(dimensions, fingerCount) {
    createFingerJoints(dimensions, fingerCount, 0, (fingerCount - 1) * 2);
}

module fingerJointFemale(dimensions, fingerCount) {
    createFingerJoints(dimensions, fingerCount, 1, (fingerCount) * 2);
}