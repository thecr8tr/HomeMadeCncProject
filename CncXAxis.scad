//NOTE MAYBE A 2X4 ACROSS THE BOTTOM INSTEAD OF PLYWOOD
//NOTE TRY WITH 2 NUTS FOR THE THREADED ROD SYSTEM

include <Variables.scad>

module bearing_block_mount()
{
    cube([x_axis_side_width, two_by_four_width, two_by_four_height]);
}

module bearing_blocks_on_mount()
{
    translate([0,half_inch_plywood,linear_bearing_height]) bearing_block_mount();
    translate([0,two_by_four_width/2-linear_bearing_width/2+half_inch_plywood,0]) bearing_block();
     translate([x_axis_side_width-linear_bearing_length,two_by_four_width/2-linear_bearing_width/2+half_inch_plywood,0]) bearing_block();
    translate([0,half_inch_plywood,y_support_width+two_by_four_height+linear_bearing_height-x_axis_side_length]) rotate([90,0,0]) cube([x_axis_side_width,x_axis_side_length,half_inch_plywood]);
}

module cnc_cross_support()
{
    cube([y_axis_support_length,y_support_width,half_inch_plywood]);
}

module cnc_x_axis()
{
    
    bearing_blocks_on_mount();
    translate([x_axis_side_width,cnc_base_from_rail_to_rail+2*linear_bearing_mount_to_center_of_rail,0]) rotate([0,0,180]) bearing_blocks_on_mount();
    translate([0,half_inch_plywood,linear_bearing_height+two_by_four_height]) rotate([90,0,90]) cnc_cross_support();
    translate([x_axis_side_width-half_inch_plywood,half_inch_plywood,linear_bearing_height+two_by_four_height]) rotate([90,0,90]) cnc_cross_support();
    translate([x_axis_side_width-2*half_inch_plywood,half_inch_plywood,linear_bearing_height+two_by_four_height]) rotate([90,0,90]) cnc_cross_support();
    translate([x_axis_side_width/2,half_inch_plywood,linear_bearing_height+two_by_four_height-x_axis_side_length+y_support_width]) rotate([90,0,90]) cnc_cross_support();
    translate([x_axis_side_width/2-half_inch_plywood,half_inch_plywood,linear_bearing_height+two_by_four_height-x_axis_side_length+y_support_width]) rotate([90,0,90]) cnc_cross_support();
    translate([x_axis_side_width,(y_axis_support_length+half_inch_plywood*2)/2-linear_rod_y_length/2,linear_bearing_height+two_by_four_height+y_support_width-linear_rod_base_width]) rotate([90,0,90]) linear_rod(linear_rod_y_length);
    translate([x_axis_side_width,(y_axis_support_length+half_inch_plywood*2)/2-linear_rod_y_length/2,linear_bearing_height+two_by_four_height]) rotate([90,0,90])     linear_rod(linear_rod_y_length);
   }

//cnc_x_axis();