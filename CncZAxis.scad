include <Variables.scad>

module cnc_z_axis()
{
    cube([z_axis_width, z_support_width, half_inch_plywood]);
    translate([0,0,half_inch_plywood+linear_bearing_height]) rotate([180,0,90]) bearing_block();
    translate([0,z_support_width-linear_bearing_length,half_inch_plywood+linear_bearing_height]) rotate([180,0,90]) bearing_block();
    translate([z_support_width-linear_rod_base_width,0,half_inch_plywood+linear_bearing_height]) rotate([180,0,90]) bearing_block();
    translate([z_support_width-linear_rod_base_width,z_support_width-linear_bearing_length,half_inch_plywood+linear_bearing_height]) rotate([180,0,90]) bearing_block();
}

//cnc_z_axis();