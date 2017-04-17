bolt_d = 4;
base_h = 4;
base_l = 30;
base_d1 = 14;
base_d2 = 12;

d1_distance = 16;

$fn = 100;

module torus(d_major, d_minor)
{
    r_minor = d_minor/2; 
    r_major = d_major/2 - d_minor/2;
    
    rotate_extrude(convexity = 10, $fn = 144)
    translate([r_major, 0, 0])
    circle(r = r_minor, $fn = 144);
}

union() {

    translate([15,0, 18])
    rotate([90, -30, 0])
    difference() {
        torus(20, 6);
        translate([0,7.5,0])
        cube([2.5, 8, 8], true);
    }

    translate([15,0, 8])
    cube([8, 5, 8], true);

    difference() {
        hull() {
            translate([d1_distance, 0, 0])
            cylinder(d = base_d1, h=base_h);
            
            cylinder(d = base_d2, h=base_h);
        }
        cylinder(d = bolt_d, h=base_h);
    }

}