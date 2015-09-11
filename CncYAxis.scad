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
}

//cnc_y_axis();
