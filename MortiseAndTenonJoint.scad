use <DowelJoint.scad>;

module mortise(dimensions, proportionsOfTenon) {
    difference() {
        cube(dimensions);
        tenon(dimensions, proportionsOfTenon);
    }    
}

module tenon(dimensions, proportionsOfTenon) {
    tenon = [
        for(i=[0: 2]) 
            dimensions[i] * proportionsOfTenon[i]
    ];
    translation = [
        dimensions[0] - tenon[0],
        (dimensions[1] - tenon[1]) / 2,
        (dimensions[2] - tenon[2]) / 2
    ];
    translate(translation) {
        cube(tenon);
    }
}


module pinnedMortise(dimensions, proportionsOfTenon, numberOfDowels, dowelSides, dowelRadius) {
    difference() {
        mortise(dimensions, proportionsOfTenon);
        pins(dimensions, numberOfDowels, dowelSides, dowelRadius);
    }
}

module pinnedTenon(dimensions, proportionsOfTenon, numberOfDowels, dowelSides, dowelRadius) {
    difference() {
        tenon(dimensions, proportionsOfTenon);
        pins(dimensions, numberOfDowels, dowelSides, dowelRadius);
    }
}

module pins(dimensions, numberOfDowels, dowelSides, dowelRadius) {
    translations = [
        for(i=[1: numberOfDowels])
            [
                dimensions[0]/2,
                dimensions[1],
                (dimensions[2]/(numberOfDowels+1) * i)
            ]
    ];
   
    for(t=translations) {
        translate(t) {
            rotate([90, 0, 0]) {
                dowelJoint(dowelSides, dowelRadius, dimensions[1]);
            }
        }
    }
}

// pins() doesn't work when you want more than one of them, why?