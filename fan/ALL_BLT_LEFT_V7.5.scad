$fn=0;

head_thick = 5.5;
leg_thick = 3.42;

module head(thick) {
	hole = 1.6;
	outer_circle = 3.8;
	dist=(21.192 - (hole*2));
	cube_width = 8;
	cube_depth = 11.52;


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

translate([0,5,head_thick])
rotate([90,0,25]){
	leg(leg_thick);
}


leg(leg_thick);
cylinder(h=head_thick, r=20);