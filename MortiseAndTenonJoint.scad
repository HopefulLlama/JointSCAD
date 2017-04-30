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