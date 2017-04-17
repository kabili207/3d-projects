
//import("C:\\Users\\anagle\\Downloads\\case.stl");

module rounded_rect(size, radius)
{
    x = size[0];
    y = size[1];
    z = size[2];
    $fn=15;

    linear_extrude(height=z)
    hull()
    {

        // place 4 circles in the corners, with the given radius
        translate([(-x/2)+radius, (-y/2)+radius, 0])
        circle(r=radius);

        translate([(x/2)-radius, (-y/2)+radius, 0])
        circle(r=radius);

        translate([(-x/2)+radius, (y/2)-radius, 0])
        circle(r=radius);

        translate([(x/2)-radius, (y/2)-radius, 0])
        circle(r=radius);

        
    }
}



difference() {
    cube([142,37,4]);

    translate([41.5 + 15, 13.75 + 4.8])

    rounded_rect([83,27.5,4], 1.5);
    
    led_radius = 1.5;
    
    linear_extrude(height=4) {
        translate([3.5, 10.5])
        circle(r=led_radius, $fn=15);
        translate([3.5, 16.1])
        circle(r=led_radius, $fn=15);
        translate([3.5, 21.7])
        circle(r=led_radius, $fn=15);
        translate([3.5, 27.3])
        circle(r=led_radius, $fn=15);
    }
    
    // Total width/height = 33.41
    // Need to verify the 3.5 measurement
    translate([142 - 33.41 + 3.5,37 - 33.41 + 3.5])
    union() {
        

        translate([0, 0, 2])
        hull(){
            cube([2.96, 9.4, 4], true);
            rotate([0,0,45])
            cube([2.96, 9.4, 4], true);
            rotate([0,0,90])
            cube([2.96, 9.4, 4], true);
            rotate([0,0,135])
            cube([2.96, 9.4, 4], true);
        }
        
        // Center button
        translate([12.005,12.005])
        rotate([0,0,45])
        linear_extrude(height=4) {
            $fn=15;
            offset(r=1.13)
            square([6.28, 6.28], true);
        }
        
    }
    
}

//(6.28+1.13+1.13)* sqrt(2)
btn_w = 12.077; //overall width/height of the area
btn_wh = btn_w / 2;
btn_c_r = 1.13; //radius of the rounded corners 
lwr_os = 7.495; // from the bottom up
translate([-20, -20, 0]){
    $fn=20;
    difference() {
        translate([-btn_w/2, -btn_w/2]){
            cube([btn_w, btn_w, 2.5]);
        }
        union() {
            translate([-btn_wh + btn_c_r, 0 , 0]) 
                cylinder(r=1.13, h=5, fn=20, center=true);
            translate([btn_wh - btn_c_r, 0, 0]) 
                cylinder(r=1.13, h=5, fn=20, center=true);
            translate([-btn_wh + btn_c_r, -btn_wh + btn_c_r , 0]) 
                cylinder(r=1.13, h=5, fn=20, center=true);
            translate([btn_wh - btn_c_r, -btn_wh + btn_c_r, 0]) 
                cylinder(r=1.13, h=5, fn=20, center=true);
            translate([0, btn_wh - btn_c_r, 0]) 
                cylinder(r=1.13, h=5, fn=20, center=true);

        }
        
        translate([0, btn_wh - lwr_os - btn_c_r, 0]) 
            cylinder(r=1.13, h=5, fn=20, center=true);
        
    }
}