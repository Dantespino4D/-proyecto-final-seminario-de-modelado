include <params.scad>
use <hip_base.scad>
use <femur.scad>
use <tibia.scad>
use <foot.scad>

module leg() {
    hip_base();

    rotate([0, hip_angle_deg, 0]) {
        femur();

        translate([0, 0, -femur_length_mm])
            rotate([0, knee_angle_deg, 0]) {
                tibia();

                translate([0, 0, -tibia_length_mm])
                    rotate([0, ankle_angle_deg, 0])
                        foot();
            }
    }
}

leg();
