$fn = 48;

long_femur   = 110;
grosor_femur = 25;
conicidad    = 2;

module femur() {
    translate([0, 0, -long_femur])
        cylinder(h = long_femur, d1 = grosor_femur - conicidad/2, d2 = grosor_femur + conicidad/2);
}

femur();
