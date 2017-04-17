
module led_mount(){
    $fn = 30;
    difference() {
        union() {
            translate([-2.5, 0, 0])
            difference() {
                cube([5, 5, 3]);
                
                translate([0, 4.2, -2.5])
                rotate([50, 0, 0])
                cube([5, 7, 3]);
            }
            cylinder(h=3, r1=2.5, r2=2.5);
        }
        cylinder(h=3, r1=1.5, r2=1.5);
    }
}

union() {
    import("Spriya_-_Anet_A8_Fan_Duct.stl", convexity=5);

    roll = 90;
    yaw = 30;
    pitch = -17;
    x_offset = 13.5;
    y_offset = -22.75;
    z_offset = 5.7;

    translate([x_offset, y_offset, z_offset])
    rotate([0, 0, yaw]) rotate([0, pitch, 0]) rotate([0, roll, 0])
    led_mount();
    
    translate([-x_offset, y_offset, z_offset])
    rotate([0, 0, -yaw]) rotate([0, -pitch, 0]) rotate([0, -roll, 0])
    led_mount();
}