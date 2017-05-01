function getCorners(sides, radius) = [
    for(i=[0: sides-1]) 
    [
        radius * sin(i/sides*360),
        radius * cos(i/sides*360)
    ]
];
module dowel(sides, radius, length) {
    linear_extrude(height = length) {
        polygon(getCorners(sides, radius));
    }
}