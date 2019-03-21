/* vim: set expandtab smartindent  fdm=indent shiftwidth=4 ss=4 tabstop=4 : */
$fn=20;

module bltouch () {
    head_thick = 5.5;
    leg_thick = 3.42;
    angle = 27;
    
    module head(thick, angle) {
        hole = 1.6;
        outer_circle = 3.8;
        dist=(21.192 - (hole*2));
        cube_width = 8;
        cube_depth = 11.52;
    
        translate([-10,0,0]) rotate([0,0,angle]) cube([11.50,leg_thick,head_thick]);
        
        hull(){
            translate([-9.9,0.1,0]) cylinder(r=0.1, h=thick);
            translate([0,5.4,0]) cylinder(r=0.1, h=thick);
            translate([-0.2,3.4,0]) cylinder(r=0.1, h=thick);
        }
        hull(){
            translate([-9.9,0.1,0]) cylinder(r=0.1, h=thick);
            translate([-3,0.1,0]) cylinder(r=0.1, h=thick);
            translate([0,5.4,0]) cylinder(r=0.1, h=thick);
        }
    
        difference(){
            hull (){
                cylinder (h=thick, r=outer_circle, center = false);
                translate([dist,0,0]) cylinder (h=thick, r=outer_circle, center = false);
                translate([(dist/2) - (8/2),-(cube_depth/2),0]) cube([cube_width, cube_depth, thick]);
            }
            cylinder (h=thick, r=hole, center = false, $fn=40);
            translate([dist/2,0,0]) cylinder (h=thick, r=hole, center = false, $fn=40);
            translate([dist,0,0]) cylinder (h=thick, r=hole, center = false, $fn=40);

            h = hole +0.5;
            t = 0.5;
            cylinder (h=t, r=h, center = false, $fn=40);
            translate([dist/2,0,0]) cylinder (h=t, r=h, center = false, $fn=40);
            translate([dist,0,0]) cylinder (h=t, r=h, center = false, $fn=40);
    
        }
    
    }
    
    module leg(t, w, d) {
        difference() {
            cube([w,d,t]);
            hull(){
                translate([w/2, d/7, 0]) cylinder(r=1.5, h=t);
                translate([w/2, d-(d/7), 0]) cylinder(r=1.5, h=t);
            }
        }
    }
    
    translate([10,0,0]) head(head_thick, angle);
    translate([0,0,head_thick+24.59]) rotate([-90,0,angle]) leg(leg_thick, 11.50, 24.59);
}

bltouch();


