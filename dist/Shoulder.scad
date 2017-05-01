function getShoulderCorners(dimensions) = [
    [0, 0, 0],
    [dimensions[0], 0, 0],
    [dimensions[0], 0, dimensions[2]],
    [0, dimensions[1], 0],
    [dimensions[0], dimensions[1], 0],
    [dimensions[0], dimensions[1], dimensions[2]]
];

module shoulder(dimensions) {
    corners = getShoulderCorners(dimensions);
    faces = [
        [1, 0, 2],
        [5, 3, 4],
        [4, 0, 1],
        [4, 3, 0],
        [2, 0, 3],
        [5, 2, 3],
        [2, 5, 1],
        [5, 4, 1]
    ];
    polyhedron(corners, faces);
}