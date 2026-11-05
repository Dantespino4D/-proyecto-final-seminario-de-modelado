$fn = 48;

long_tibia = 100;
grosor_tibia = 15;
conicidad_tibia = 2;

module tibia() {
	translate([0, 0, -long_tibia])
		cylinder(h = long_tibia, d1 = (grosor_tibia - conicidad_tibia/2), d2 = (grosor_tibia + conicidad_tibia/2));

	rotate([90, 0, 0])
        cylinder(h = grosor_tibia + 4, d = grosor_tibia, center = true);
}

tibia();
