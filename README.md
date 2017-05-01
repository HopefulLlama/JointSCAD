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
- [Bridle Joint](#Bridle Joint)
- [Dovetail Joint](#Dovetail Joint)
- [Dowel Joint](#Dowel Joint)
- [Finger Joint](#Finger Joint)
- [Mortise And Tenon Joint](#Mortise And Tenon Joint)
- [Scarf Joint](#Scarf Joint)

## Bridle Joint

###`bridleJointA(dimensions);`
| Description | Creates the centre part, which rests in between the gap created by the two 'fingers' of its counterpart. |
| Parameters 	| - `dimensions`: An array/vector of three integers, which describes the `[x, y, z]` dimensions of the joint respectively. This should be the same when used with its counterpart to ensure correct sizing. |

###`bridleJointA(dimensions);`
| Description | Creates the two 'fingers', which is intended to receive its counterpart. |
| Parameters 	| - `dimensions`: An array/vector of three integers, which describes the `[x, y, z]` dimensions of the joint respectively. This should be the same when used with its counterpart to ensure correct sizing. |

## Dovetail Joint
## Dowel Joint
## Finger Joint
## Mortise And Tenon Joint
## Scarf Joint