function getCorners(sides, radius, length) = [
    for(z = [0: length: length], i=[0: sides-1]) 
    [
        radius * sin(i/sides*360),
        radius * cos(i/sides*360),
        z
    ]
];

function getBases(sides) = [
    for(i = [0: 1]) 
    [
        for(j = [0: sides-1])
            j + (i * sides)
    ]
];

function getSides(sides) = [
    for(k=[0:sides-1])
        [k, (k + 1) % sides, ((k + 1) % sides) + sides, k + sides]   
];

function getFaces(sides) = concat(getBases(sides), getSides(sides));

module dowelJoint(sides, radius, length) {
    corners = getCorners(sides, radius, length);
    faces = getFaces(sides);
    polyhedron(corners, faces);
}