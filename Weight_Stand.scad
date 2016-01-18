//2 1/8 inch inside diameter
//3 1/2 inch on center for bolts
//8 inch height

$fn = 60;

cylinder_height = 8;
inside_diameter = 2.125;
pipe_thickness = 0.125;
metal_thickness = .25;
bolt_hole_distance = 3.5;
bolt_hole_diameter = 5*0.125;

module pipe(){
    difference(){
        union(){
            cylinder(h=cylinder_height, d=(inside_diameter+2*pipe_thickness));
        };
        union(){
            translate([0,0,-.01]) cylinder(h=cylinder_height+.02, d=inside_diameter);
        };
    };
}

module base_plate(){
    difference(){
        union(){
            cube([bolt_hole_distance+2,bolt_hole_distance+2-metal_thickness,metal_thickness]);
        };
        union(){
        };
    };
}

module back_plate(){
    difference(){
        union(){
            cube([bolt_hole_distance+2,metal_thickness,bolt_hole_distance+2]);
        };
        union(){
            translate([1,metal_thickness*1.5,1]) rotate([90,0,0]) cylinder(d=bolt_hole_diameter, h=2*metal_thickness);
            translate([1+bolt_hole_distance,metal_thickness*1.5,1]) rotate([90,0,0]) cylinder(d=bolt_hole_diameter, h=2*metal_thickness);
        };
    };
}

module gusset(){
    difference(){
        union(){
            polyhedron(points=[[0,0,0], [bolt_hole_distance+2-metal_thickness,0,0], [0,bolt_hole_distance+2-metal_thickness,0],[0,0,metal_thickness], [bolt_hole_distance+2-metal_thickness,0,metal_thickness], [0,bolt_hole_distance+2-metal_thickness,metal_thickness]], faces=[[0,1,2], [3,4,5], [0,1,3], [1,3,4], [1,2,4], [2,4,5], [0,2,5], [0,3,5]]);
        };
        union(){
        };
    };
}

module completed_piece(){
    back_plate();
    translate([(bolt_hole_distance+2)/2,(pipe_thickness*2+inside_diameter)/2+metal_thickness,metal_thickness]) pipe();
    translate([0,metal_thickness,0]) base_plate();
    translate([(bolt_hole_distance+2)/2-(inside_diameter+2*pipe_thickness)/2,metal_thickness,metal_thickness]) rotate([0,-90,0]) gusset();
    translate([(bolt_hole_distance+2)/2+(inside_diameter+2*pipe_thickness)/2+metal_thickness, metal_thickness,metal_thickness]) rotate([0,-90,0]) gusset();
}

completed_piece();

