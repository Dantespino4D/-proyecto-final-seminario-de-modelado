include <params.scad>

module hip_base() {
    difference() {
        union() {
            for (s = [-1, 1])
                translate([0, s * (hip_base_gap_mm + hip_base_plate_mm) / 2, 0])
                    rotate([90, 0, 0])
                        cylinder(h = hip_base_plate_mm, d = 2 * hip_base_radius_mm, center = true);

            translate([0, 0, (hip_hub_radius_mm + hip_base_tower_top_mm) / 2])
                cube([
                    hip_base_tower_width_x_mm,
                    hip_base_gap_mm,
                    hip_base_tower_top_mm - hip_hub_radius_mm
                ], center = true);

            translate([0, 0, hip_base_tower_top_mm + hip_base_mount_thickness_mm / 2])
                cube([
                    hip_base_mount_size_x_mm,
                    hip_base_mount_size_y_mm,
                    hip_base_mount_thickness_mm
                ], center = true);
        }

        rotate([90, 0, 0])
            cylinder(
                h = hip_base_gap_mm + 2 * hip_base_plate_mm + 2,
                d = hip_pin_dia_mm,
                center = true
            );

        for (x = [-1, 1], y = [-1, 1])
            translate([
                x * (hip_base_mount_size_x_mm / 2 - 12),
                y * (hip_base_mount_size_y_mm / 2 - 12),
                hip_base_tower_top_mm + hip_base_mount_thickness_mm / 2
            ])
                cylinder(
                    h = hip_base_mount_thickness_mm + 2,
                    d = hip_base_bolt_dia_mm,
                    center = true
                );
    }
}

hip_base();
