include <params.scad>

module femur() {
    difference() {
        union() {
            rotate([90, 0, 0])
                cylinder(h = hip_hub_width_mm, d = 2 * hip_hub_radius_mm, center = true);

            rotate([90, 0, 0])
                cylinder(h = hip_pin_length_mm, d = hip_pin_dia_mm, center = true);

            translate([0, 0, -(femur_length_mm - femur_dist_offset_mm)])
                cylinder(
                    h = femur_length_mm - femur_prox_offset_mm - femur_dist_offset_mm,
                    d1 = femur_shaft_prox_dia_mm,
                    d2 = femur_shaft_dist_dia_mm
                );

            translate([0, 0, -(femur_length_mm - femur_dist_offset_mm) + femur_bridge_height_mm / 2])
                cube([
                    femur_shaft_dist_dia_mm,
                    knee_fork_gap_mm + 2 * knee_fork_plate_mm,
                    femur_bridge_height_mm
                ], center = true);

            for (s = [-1, 1])
                translate([0, s * (knee_fork_gap_mm + knee_fork_plate_mm) / 2, -femur_length_mm])
                    rotate([90, 0, 0])
                        cylinder(h = knee_fork_plate_mm, d = 2 * knee_hub_radius_mm, center = true);
        }

        translate([0, 0, -femur_length_mm])
            rotate([90, 0, 0])
                cylinder(
                    h = knee_fork_gap_mm + 2 * knee_fork_plate_mm + 2,
                    d = knee_pin_dia_mm,
                    center = true
                );
    }
}

femur();
