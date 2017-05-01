use <DowelJoint.scad>;
use <Shoulder.scad>;

function getShoulderDimensions(dimensions, proportionsOfTenon, proportionOfShoulder) = [
    dimensions[0] * proportionsOfTenon[0] * proportionOfShoulder,
    dimensions[1] * ((1 - proportionsOfTenon[1])/2),
    dimensions[2] * proportionsOfTenon[2]
];

function getShoulderTranslations(dimensions, proportionsOfTenon, shoulderDimensions) = [
        [dimensions[0] - shoulderDimensions[0], 0, dimensions[2] * ((1-proportionsOfTenon[2])/2)],
        [dimensions[0] - shoulderDimensions[0], dimensions[1] - shoulderDimensions[1], dimensions[2] * ((1-proportionsOfTenon[2])/2)]
];

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
                dowel(dowelSides, dowelRadius, dimensions[1]);
            }
        }
    }
}

module shoulderedMortise(dimensions, proportionsOfTenon, proportionOfShoulder) {
    shoulderDimensions = getShoulderDimensions(dimensions, proportionsOfTenon, proportionOfShoulder);
    translations = getShoulderTranslations(dimensions, proportionsOfTenon, shoulderDimensions);
    
    difference() {
        mortise(dimensions, proportionsOfTenon);
        for(t=translations) {
            translate(t) {
                shoulder(shoulderDimensions);
            }
        }
    }
}

module shoulderedTenon(dimensions, proportionsOfTenon, proportionOfShoulder) {
    shoulderDimensions = getShoulderDimensions(dimensions, proportionsOfTenon, proportionOfShoulder);
    translations = getShoulderTranslations(dimensions, proportionsOfTenon, shoulderDimensions);
    
    union() {
        tenon(dimensions, proportionsOfTenon);
        for(t=translations) {
            translate(t) {
                shoulder(shoulderDimensions);
            }
        }
    }
}