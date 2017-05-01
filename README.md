# JointSCAD
Joints made easy, with JointSCAD

## What is JointSCAD?
Often times 3D prints must be printed in parts. This might be due to unavoidable overhangs, or size limitations of the printer itself. Sometimes it is easier to paint individual parts which can be put together, and other times it is required in as part of an object in motion.

JointSCAD aims to be a single stop OpenSCAD library for simple, parametric joint creation.

# Contents
- [Setup](#setup)
- [Contributing](#contributing)
- [License](#license)
- [API](#api)

# Setup
The [dist](../../tree/master/dist) directory contains all `.scad` files used by JointSCAD. 

The simplest way to get JointSCAD working, is to have all JointSCAD files in the same directory and include it into your SCAD project: 
`include <path/to/JointSCAD.scad;`

# Contributing
See the [Contributing](../master/CONTRIBUTING.md) document for more information on contributing.

# License
See the [License](../master/LICENSE) document for more information on licensing.

# API
## API Contents
- [Bridle Joint](#bridle-joint)
- [Dovetail Joint](#dovetail-joint)
- [Dowel Joint](#dowel-joint)
- [Finger Joint](#finger-joint)
- [Mortise And Tenon Joint](#mortise-and-tenon-joint)
- [Scarf Joint](#scarf-joint)

## Bridle Joint

#### `bridleJointA(dimensions);`
![Bridle Joint A](https://raw.githubusercontent.com/HopefulLlama/JointSCAD/master/docs/bridleJoint/a.png)

Creates the centre part, which rests in between the gap created by the two 'fingers' of its counterpart. 

| Parameter	| Data Type | Description |
|---|---|---|
| `dimensions` | Number[3] | An array/vector of three numbers, which describes the `[x, y, z]` dimensions of the joint respectively. This should be the same when used with its counterpart to ensure correct sizing. |

#### `bridleJointB(dimensions);`
![Bridle Joint B](https://raw.githubusercontent.com/HopefulLlama/JointSCAD/master/docs/bridleJoint/b.png)

Creates the two 'fingers', which is intended to receive its counterpart.

| Parameter	| Data Type | Description |
|---|---|---|
| `dimensions` | Number[3] | An array/vector of three numbers, which describes the `[x, y, z]` dimensions of the joint respectively. This should be the same when used with its counterpart to ensure correct sizing. |

## Dovetail Joint
#### `dovetailJointA(dimensions, numberOfDovetails);`
![Dovetail Joint A](https://raw.githubusercontent.com/HopefulLlama/JointSCAD/master/docs/dovetailJoint/a.png)

Creates the "dovetails", which rests in between the gaps created by its counterpart.

| Parameter	| Data Type | Description |
|---|---|---|
| `dimensions` | Number[3] | An array/vector of three numbers, which describes the `[x, y, z]` dimensions of the joint respectively. This should be the same when used with its counterpart to ensure correct sizing. |
| `numberOfDovetails` | Number | A number which specifies the number of dovetails to use in the joint. This should be the same when used with its counterpart to ensure correct sizing. |

#### `dovetailJointB(dimensions, numberOfDovetails);`
![Dovetail Joint B](https://raw.githubusercontent.com/HopefulLlama/JointSCAD/master/docs/dovetailJoint/b.png)

Creates a block with gaps designed to allow the specified number of dovetails to rest in.

| Parameter	| Data Type | Description |
|---|---|---|
| `dimensions` | Number[3] | An array/vector of three numbers, which describes the `[x, y, z]` dimensions of the joint respectively. This should be the same when used with its counterpart to ensure correct sizing. |
| `numberOfDovetails` | Number | A number which specifies the number of dovetails to use in the joint. This should be the same when used with its counterpart to ensure correct sizing. |

## Dowel Joint
#### `dowel(sides, radius, length);`
![Dowel](https://raw.githubusercontent.com/HopefulLlama/JointSCAD/master/docs/dowelJoint/dowel.png)

Creates a dowel using a prism, instead of a cylinder. This is because:
- cylinders are readily available from OpenSCAD
- some 3D printers struggle to print round things exactly
- sometimes a prism is preferable

| Parameter | Data Type | Description |
|---|---|---|
| `sides` | Number | Specifies the number of sides the polygon should have. This polygon is extruded to create the prism. |
| `radius` | Number | The distance from the centre point to place each corner of the polygon. | 
| `length` | Number | The length of the extruded prism | 

*Note:* Dowel does not have a counterpart. If the counterpart hole is required, use [difference()](https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/The_OpenSCAD_Language#difference). 

## Finger Joint
#### `fingerJointA(dimensions, fingerCount);`
![Finger Joint A](https://raw.githubusercontent.com/HopefulLlama/JointSCAD/master/docs/fingerJoint/a.png)

Creates one set of "fingers", which are designed to rest in between another set of "fingers".

| Parameter	| Data Type | Description |
|---|---|---|
| `dimensions` | Number[3] | An array/vector of three numbers, which describes the `[x, y, z]` dimensions of the joint respectively. This should be the same when used with its counterpart to ensure correct sizing. |
| `fingerCount` | Number | A number which specifies the number of fingers to use in the joint. This should be the same when used with its counterpart to ensure correct sizing. |

#### `fingerJointB(dimensions, fingerCount);`
![Finger Joint B](https://raw.githubusercontent.com/HopefulLlama/JointSCAD/master/docs/fingerJoint/b.png)

Creates the other set of "fingers", which are designed to rest in between the initial set of "fingers".

| Parameter	| Data Type | Description |
|---|---|---|
| `dimensions` | Number[3] | An array/vector of three numbers, which describes the `[x, y, z]` dimensions of the joint respectively. This should be the same when used with its counterpart to ensure correct sizing. |
| `fingerCount` | Number | A number which specifies the number of fingers to use in the joint. This should be the same when used with its counterpart to ensure correct sizing. |

## Mortise And Tenon Joint
### Standard Mortise and Tenon Joint
#### `mortise(dimensions, proportionsOfTenon);`
![Mortise](https://raw.githubusercontent.com/HopefulLlama/JointSCAD/master/docs/mortiseAndTenonJoint/mortise.png)

Creates a mortise, allowing space for a counterpart tenon to be inserted.

| Parameter	| Data Type | Description |
|---|---|---|
| `dimensions` | Number[3] | An array/vector of three numbers, which describes the `[x, y, z]` dimensions of the joint respectively. This should be the same when used with its counterpart to ensure correct sizing. |
| `proportionsOfTenon` | Number[3] | An array/vector of three numbers, which describes *proportions* of the `[x, y, z]` dimensions of the *tenon slot* respectively. This should be the same when used with its counterpart to ensure correct sizing. |

#### `tenon(dimensions, proportionsOfTenon);`
![Tenon](https://raw.githubusercontent.com/HopefulLlama/JointSCAD/master/docs/mortiseAndTenonJoint/tenon.png)

Creates a tenon, designed to be inserted into a matching mortise.

| Parameter	| Data Type | Description |
|---|---|---|
| `dimensions` | Number[3] | An array/vector of three numbers, which describes the `[x, y, z]` dimensions of the joint respectively. This should be the same when used with its counterpart to ensure correct sizing. |
| `proportionsOfTenon` | Number[3] | An array/vector of three numbers, which describes *proportions* of the `[x, y, z]` dimensions of the *tenon* respectively. This should be the same when used with its counterpart to ensure correct sizing. |

### Pinned Mortise and Tenon Joint
#### `pinnedMortise(dimensions, proportionsOfTenon, numberOfDowels, dowelSides, dowelRadius);`
![Pinned Mortise](https://raw.githubusercontent.com/HopefulLlama/JointSCAD/master/docs/mortiseAndTenonJoint/pinnedMortise.png)

Creates a mortise, allowing space for a counterpart tenon to be inserted. In addition, this adds a respective amount of slots for pins to be inserted.

| Parameter	| Data Type | Description |
|---|---|---|
| `dimensions` | Number[3] | An array/vector of three numbers, which describes the `[x, y, z]` dimensions of the joint respectively. This should be the same when used with its counterpart to ensure correct sizing. |
| `proportionsOfTenon` | Number[3] | An array/vector of three numbers, which describes *proportions* of the `[x, y, z]` dimensions of the *tenon slot* respectively. This should be the same when used with its counterpart to ensure correct sizing. |
| `numberOfDowels` | Number | The number of pins/dowels to be used in joint creation. These pins are evenly spread, vertically, along the centre of the joint. |
| `dowelSides` | Number | The number of sides the polygon to be extruded should have, which is used to create the slot for each pin/dowel. |
| `dowelRadius` | Number | The distance of each corner in the polygon, from its centre. |

#### `pinnedTenon(dimensions, proportionsOfTenon, numberOfDowels, dowelSides, dowelRadius);`
![Pinned Tenon](https://raw.githubusercontent.com/HopefulLlama/JointSCAD/master/docs/mortiseAndTenonJoint/pinnedTenon.png)

Creates a tenon, designed to be inserted into a matching mortise. In addition, this adds a respective amount of slots for pins to be inserted.

| Parameter	| Data Type | Description |
|---|---|---|
| `dimensions` | Number[3] | An array/vector of three numbers, which describes the `[x, y, z]` dimensions of the joint respectively. This should be the same when used with its counterpart to ensure correct sizing. |
| `proportionsOfTenon` | Number[3] | An array/vector of three numbers, which describes *proportions* of the `[x, y, z]` dimensions of the *tenon* respectively. This should be the same when used with its counterpart to ensure correct sizing. |
| `numberOfDowels` | Number | The number of pins/dowels to be used in joint creation. These pins are evenly spread, vertically, along the centre of the joint. |
| `dowelSides` | Number | The number of sides the polygon to be extruded should have, which is used to create the slot for each pin/dowel. |
| `dowelRadius` | Number | The distance of each corner in the polygon, from its centre. |

### Shouldered Mortise and Tenon Joint
#### `shoulderedMortise(dimensions, proportionsOfTenon, proportionOfShoulder);`
![Shouldered Mortise](https://raw.githubusercontent.com/HopefulLlama/JointSCAD/master/docs/mortiseAndTenonJoint/shoulderedMortise.png)

Creates a mortise, allowing space for a counterpart tenon to be inserted. 
In addition, adds two supporting shoulders for the tenon.

| Parameter	| Data Type | Description |
|---|---|---|
| `dimensions` | Number[3] | An array/vector of three numbers, which describes the `[x, y, z]` dimensions of the joint respectively. This should be the same when used with its counterpart to ensure correct sizing. |
| `proportionsOfTenon` | Number[3] | An array/vector of three numbers, which describes *proportions* of the `[x, y, z]` dimensions of the *tenon slot* respectively. This should be the same when used with its counterpart to ensure correct sizing. |
| `proportionOfShoulder` | Number | The width of the shoulder, *in relation to the tenon,* rather than the entire joint. |

#### `shoulderedTenon(dimensions, proportionsOfTenon, proportionOfShoulder);`
![Shouldered Tenon](https://raw.githubusercontent.com/HopefulLlama/JointSCAD/master/docs/mortiseAndTenonJoint/shoulderedTenon.png)

Creates a tenon, designed to be inserted into a matching mortise. 
In addition, adds two supporting shoulders for the tenon.

| Parameter	| Data Type | Description |
|---|---|---|
| `dimensions` | Number[3] | An array/vector of three numbers, which describes the `[x, y, z]` dimensions of the joint respectively. This should be the same when used with its counterpart to ensure correct sizing. |
| `proportionsOfTenon` | Number[3] | An array/vector of three numbers, which describes *proportions* of the `[x, y, z]` dimensions of the *tenon* respectively. This should be the same when used with its counterpart to ensure correct sizing. |
| `proportionOfShoulder` | Number | The width of the shoulder, *in relation to the tenon,* rather than the entire joint. |

## Scarf Joint
#### `scarfJointA(dimensions);`
![Scarf Joint A](https://raw.githubusercontent.com/HopefulLlama/JointSCAD/master/docs/scarfJoint/a.png)

Creates one half of a scarf joint. This half is the upper/left half of a scarf joint.

| Parameter	| Data Type | Description |
|---|---|---|
| `dimensions` | Number[3] | An array/vector of three numbers, which describes the `[x, y, z]` dimensions of the joint respectively. This should be the same when used with its counterpart to ensure correct sizing. |

#### `scarfJointB(dimensions);`
![Scarf Joint B](https://raw.githubusercontent.com/HopefulLlama/JointSCAD/master/docs/scarfJoint/b.png)

Creates the other half of a scarf joint. This half is the lower/right half of a scarf joint.

| Parameter	| Data Type | Description |
|---|---|---|
| `dimensions` | Number[3] | An array/vector of three numbers, which describes the `[x, y, z]` dimensions of the joint respectively. This should be the same when used with its counterpart to ensure correct sizing. |