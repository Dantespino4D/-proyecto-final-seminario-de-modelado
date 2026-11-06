include <params.scad>
use <hip_base.scad>
use <femur.scad>
use <tibia.scad>
use <foot.scad>

if (part == "hip_base") hip_base();
else if (part == "femur") femur();
else if (part == "tibia") tibia();
else if (part == "foot") foot();
else femur();
