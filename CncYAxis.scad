include <Variables.scad>

module cnc_y_axis()
{
    cube([linear_rod_z_length, z_support_width, half_inch_plywood]);
    translate([0,0,half_inch_plywood+linear_bearing_height]) rotate([180,0,90]) bearing_block();
    translate([0,z_support_width-linear_bearing_length,half_inch_plywood+linear_bearing_height]) rotate([180,0,90]) bearing_block();
    translate([z_support_width-linear_rod_base_width,0,half_inch_plywood+linear_bearing_height]) rotate([180,0,90]) bearing_block();
    translate([z_support_width-linear_rod_base_width,z_support_width-linear_bearing_length,half_inch_plywood+linear_bearing_height]) rotate([180,0,90]) bearing_block();
    translate([0,linear_rod_base_width,0]) rotate([180,0,0]) linear_rod(linear_rod_z_length);
    translate([0,z_support_width,0]) rotate([180,0,0]) linear_rod(linear_rod_z_length);
    translate([nema_23_stepper_height+half_inch_plywood+linear_rod_z_length,z_support_width/2-nema_23_stepper_width/2,-nema_23_stepper_length]) rotate([0,270,0]) union()
    {
        nema_23_stepper();
        translate([-half_inch_plywood,-half_inch_plywood,nema_23_stepper_height]) difference()
        {
            cube([nema_23_stepper_length+half_inch_plywood*2,nema_23_stepper_width+half_inch_plywood*2,half_inch_plywood]);
            translate([(nema_23_stepper_length)/2-nema_23_stepper_length/2+half_inch_plywood,(nema_23_stepper_length+half_inch_plywood*2)/2-nema_23_stepper_length/2,0]) nema_23_stepper_hole_pattern();
        }
    }
}

//cnc_y_axis();
