
include <CncBed.scad>
include <CncXAxis.scad>
include <CncYAxis.scad>
include <CncZAxis.scad>

translate([0,linear_bearing_mount_to_center_of_rail-linear_rod_base_width/2,0]) cnc_bed();

translate([two_by_four_width,0,cnc_base_height*2+cnc_base_support_width+linear_rod_height-(linear_bearing_height-linear_bearing_center)]) cnc_x_axis();

translate([half_inch_plywood+linear_bearing_height+two_by_four_width+x_axis_side_width+linear_rod_height-linear_bearing_height+linear_bearing_center,(y_axis_support_length-linear_rod_y_length+half_inch_plywood*2)/2,cnc_base_height*2+cnc_base_support_width+linear_rod_height+linear_bearing_center+two_by_four_height+linear_rod_base_width/2-linear_bearing_width/2]) rotate([0,270,0]) cnc_y_axis();

translate([half_inch_plywood*2+linear_bearing_height*2+two_by_four_width+x_axis_side_width+linear_rod_height-linear_bearing_height+linear_bearing_center+linear_rod_height-linear_bearing_height+linear_bearing_center,(y_axis_support_length-linear_rod_y_length+half_inch_plywood*2)/2+z_axis_width-(z_axis_width-z_support_width)/2,cnc_base_height*2+cnc_base_support_width+linear_rod_height+linear_bearing_center+two_by_four_height+linear_rod_base_width/2-linear_bearing_width/2]) rotate([90,0,270]) cnc_z_axis();
