//NOTES:  NEED TO ADJUST BED TO GET MAX WORK AREA FROM SLIDES.  MAKE MARGIN BIGGER

//Material Thicknesses
half_inch_plywood=12.7;
two_by_four_width=89;
two_by_four_height=38;

//T Nut
t_nut_length=22;
t_nut_width_base=13;
t_nut_width_top=5;
t_nut_height=9;
t_nut_angle=45;

//SBR16-500 linear rod
linear_rod_base_width=40; //W
linear_rod_base_height=5; //T
linear_rod_support_width=18.5; //J
linear_rod_support_height=11.7; //K
linear_rod_support2_width=8; //H1
linear_rod_support2_height=17.8; //F
linear_rod_diameter=16; //Shaft Diameter
linear_rod_height=25; //H to center of rod
linear_rod_x_length=500;
linear_rod_y_length=450;
linear_rod_z_length=200;

//SBR16UU bearing block
linear_bearing_length=45; //L
linear_bearing_width=45; //W
linear_bearing_height=33; //F
linear_bearing_center=20; //H from top
linear_bearing_relief_width=10; //H1
linear_bearing_relief_height=linear_bearing_height/2;
linear_bearing_mount_to_center_of_rail=half_inch_plywood+(two_by_four_width/2);

//X Axis Adjustments
x_axis_side_buffer=10;
x_axis_bottom_buffer=10;
    //######NEED A GOOD CALCULATION
x_axis_side_width=linear_bearing_length*3;
//x_axis_side_length=400; //OVERWRITTEN IN Y AXIS STUFF

//Desired Cutting Surface Area
cutting_lenth=458;
cutting_width=305;
cutting_margin_length=(x_axis_side_width+two_by_four_width+linear_rod_height+linear_rod_diameter/2+linear_bearing_height-linear_bearing_center)/2; //Divide total offset by 2
cutting_margin_width=linear_rod_base_width+20;

//Machine Base Measurements
cnc_base_length=cutting_lenth+cutting_margin_length*2;
cnc_base_width=cutting_width+cutting_margin_width*2;
cnc_base_height=half_inch_plywood;
cnc_base_number_of_supports_y=3;
cnc_base_support_height=two_by_four_height;
cnc_base_support_length=cnc_base_length;
cnc_base_support_width=two_by_four_width;
cnc_base_from_rail_to_rail=cnc_base_width-linear_rod_base_width;

//Y Axis Adjustments
y_support_width= 135;
y_axis_support_length=cnc_base_from_rail_to_rail+linear_bearing_mount_to_center_of_rail*2-half_inch_plywood*2;
//X Axis Adjustment that requires the Y Axis Stuff
//x_axis_side_length=cnc_base_height*2+cnc_base_support_width+linear_rod_height+linear_bearing_center+two_by_four_height;
x_axis_side_length=cnc_base_height*2+cnc_base_support_width+linear_rod_height+linear_bearing_center+two_by_four_height+x_axis_side_width+y_support_width+x_axis_bottom_buffer;

//Z Axis Adjustments
z_support_width= y_support_width;
z_axis_width=z_support_width-linear_rod_base_width+linear_bearing_width;

//Cutting Surface Slats
cutting_surface_number_of_slats=4;
cutting_surface_slat_trim_angle=t_nut_angle;
cutting_surface_gaps=t_nut_width_top;
cutting_surface_slat_width=(cutting_width-((cutting_surface_number_of_slats-1)*cutting_surface_gaps))/cutting_surface_number_of_slats;
cutting_surface_slat_length=cutting_lenth;
cutting_surface_slat_height=half_inch_plywood;

/////MODULES/////


module linear_rod(length)
{
    cube([length,linear_rod_base_width,linear_rod_base_height]);
    translate([0,linear_rod_base_width/2-linear_rod_support_width/2,0]) cube([length,linear_rod_support_width,linear_rod_support_height]);
    translate([0,linear_rod_base_width/2-linear_rod_support2_width/2,0]) cube([length,linear_rod_support2_width,linear_rod_support2_height]);
    translate([0,linear_rod_base_width/2,linear_rod_height]) rotate([0,90,0]) cylinder(d=linear_rod_diameter, h=length);
}

module bearing_block()
{
    difference()
    {
        cube([linear_bearing_length,linear_bearing_width,linear_bearing_height]);
        union()
        {
            translate([-.1,linear_bearing_width/2,linear_bearing_height-linear_bearing_center]) rotate([0,90,0]) cylinder(d=linear_rod_diameter, h=linear_bearing_length+.2);
            translate([-.01,linear_bearing_width/2-linear_bearing_relief_width/2,-.01]) cube([linear_bearing_length+.2,linear_bearing_relief_width,linear_bearing_relief_height+.01]);
        }
    }
}
