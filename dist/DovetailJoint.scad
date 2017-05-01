function getDovetailCorners(dimensions) = [
    [0, 0],
    [getDovetailLargeWidth(dimensions[0]), 0],
    [dimensions[0], dimensions[1]],
    [dimensions[0]/2, dimensions[1]]
];
function getDovetailTranslations(numberOfDovetails, largeWidth) = [
    for(i = [0: numberOfDovetails-1])
        [getXSpacing(largeWidth, i), 0, 0]
];
function getDovetailLargeWidth(width) = width * 1.25;
function getDovetailBaseWidth(width) = width * 0.8;
function getXSpacing(largeWidth, index) = largeWidth/2 + (index * largeWidth * 2);

module dovetail(dimensions) {
    corners = getDovetailCorners(dimensions);
    
    linear_extrude(height = dimensions[2]) {
        polygon(corners);
    }
}

module dovetailJointA(dimensions, numberOfDovetails) {
    width = dimensions[0];
    length = dimensions[1];
    height = dimensions[2];
    
    dovetailLargeWidth = width/(numberOfDovetails*2);
    dovetailBaseWidth = getDovetailBaseWidth(dovetailLargeWidth);
    
    for(t=getDovetailTranslations(numberOfDovetails, dovetailLargeWidth)) {
        translate(t) {
            dovetail([dovetailBaseWidth, length, height]);
        }
    }
}

module dovetailJointB(dimensions, numberOfDovetails) {
    difference() {
        cube(dimensions);
        dovetailJointA(dimensions, numberOfDovetails);
    }
}