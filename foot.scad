include <params.scad>

module foot() {
    difference() {
        union() {
            for (s = [-1, 1])
                translate([0, s * (ankle_hub_width_mm + foot_plate_mm) / 2, 0])
                    rotate([90, 0, 0])
                        cylinder(h = foot_plate_mm, d = 2 * foot_fork_radius_mm, center = true);

            translate([0, 0, (foot_column_top_mm + foot_column_bottom_mm) / 2])
                cube([
                    foot_column_width_x_mm,
                    ankle_hub_width_mm,
                    foot_column_top_mm - foot_column_bottom_mm
                ], center = true);

            translate([
                foot_sole_center_x_mm,
                0,
                foot_sole_top_mm - foot_sole_thickness_mm / 2
            ])
                cube([
                    foot_sole_length_mm,
                    foot_sole_width_mm,
                    foot_sole_thickness_mm
                ], center = true);
        }

        rotate([90, 0, 0])
            cylinder(
                h = ankle_hub_width_mm + 2 * foot_plate_mm + 2,
                d = ankle_pin_dia_mm,
                center = true
            );
    }
}

foot();
