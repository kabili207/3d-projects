
use <threads.scad>;

//import("small_spool_M2.stl", convexity=5);

//$fn = 150;
male = true;

screw_h = 15;
screw_d = 51.5;

shaft_h = 18;
shaft_o_d = 60;
shaft_i_d = 40;

spool_t = 5;
spool_d = 140;

holes = 5;

module oval(w, l, height, center = false) {
    scale([1, l/w, 1]) cylinder(h=height, r=w, center=center);
}

//color([0,0,1])
//translate([50, 100, 0])

difference() {

    union() {
        
        if(male) {

            cylinder(d=shaft_o_d, h=shaft_h + spool_t);
            
            translate([0,0,shaft_h + spool_t])
            metric_thread(screw_d, 5, screw_h);
        } else {
            difference() {
                cylinder(d=shaft_o_d, h=shaft_h + spool_t);
                
                translate([0,0,shaft_h + spool_t + 0.01])
                rotate([-180,0,0])
                metric_thread(screw_d, 5, screw_h, internal=true);
            }
        }
        cylinder(d=spool_d, h=spool_t);
    }

    cylinder(d=shaft_i_d, h=spool_t + shaft_h + screw_h);
    
    for (a = [1:holes]) {
        rotate([0,0,(360/holes) * a])
        translate([0, 48, 0])
        oval(25, 13, 5);
    }
}