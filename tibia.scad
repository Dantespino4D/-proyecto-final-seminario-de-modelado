include <params.scad>

module tibia() {
    union() {
        rotate([90, 0, 0])
            cylinder(h = knee_fork_gap_mm, d = 2 * tibia_hub_radius_mm, center = true);

        rotate([90, 0, 0])
            cylinder(h = knee_pin_length_mm, d = knee_pin_dia_mm, center = true);

        translate([0, 0, -(tibia_length_mm - tibia_dist_offset_mm)])
            cylinder(
                h = tibia_length_mm - tibia_prox_offset_mm - tibia_dist_offset_mm,
                d1 = tibia_shaft_prox_dia_mm,
                d2 = tibia_shaft_dist_dia_mm
            );

        translate([0, 0, -tibia_length_mm])
            rotate([90, 0, 0])
                cylinder(h = ankle_hub_width_mm, d = 2 * ankle_hub_radius_mm, center = true);

        translate([0, 0, -tibia_length_mm])
            rotate([90, 0, 0])
                cylinder(h = ankle_pin_length_mm, d = ankle_pin_dia_mm, center = true);
    }
}

tibia();
