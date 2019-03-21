$fn=0;

head_thick = 5.5;
leg_thick = 3.42;

module head(thick) {
	hole = 1.6;
	outer_circle = 3.8;
	dist=(21.192 - (hole*2));
	cube_width = 8;
	cube_depth = 11.52;

	translate([-10,0,0])
    rotate([0,0,27])
    cube([11.50,leg_thick,head_thick]);
	
	hull(){
	translate([-9.9,0.1,0])
	cylinder(r=0.1, h=thick);
	translate([-3,-2,0])
	cylinder(r=0.1, h=thick);
	translate([0,5.4,0])
	cylinder(r=0.1, h=thick);
	translate([-0.1,3.4,0])
	#cylinder(r=0.1, h=thick);
	}

	difference(){
		hull (){
			cylinder (h=thick, r=outer_circle, center = false);
			translate([dist,0,0])
			cylinder (h=thick, r=outer_circle, center = false);
			translate([(dist/2) - (8/2),-(cube_depth/2),0])
			cube([cube_width, cube_depth, thick]);
		}
		cylinder (h=thick, r=hole, center = false, $fn=40);
		translate([dist,0,0])
		cylinder (h=thick, r=hole, center = false, $fn=40);

	}

}

module leg(t) {
	w=11.50;
	d=24.59;
	difference() {

		cube([w,d,t]);
		hull(){
			translate([w/2, d/7, 0])
			cylinder(r=1.5, h=t);
			translate([w/2, d-(d/7), 0])
			cylinder(r=1.5, h=t);
		}
	}
}

translate([10,0,0])
head(head_thick);

translate([0,0,head_thick+24.59])
rotate([-90,0,27])
	leg(leg_thick);


