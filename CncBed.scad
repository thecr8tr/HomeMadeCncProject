//

include <Variables.scad>

module machine_base()
{
    cube([cnc_base_length, cnc_base_width, cnc_base_height]);
}

module cut_slat()
{
    difference()
    {
        cube([cutting_surface_slat_length,cutting_surface_slat_width, cutting_surface_slat_height]);
        union()
        {
            translate([-.1,(-sqrt(2*pow(sqrt(pow(cutting_surface_slat_height,2)/2)*2, 2)))/2,0]) rotate([-45,0,0]) cube([cutting_surface_slat_length+.2,cutting_surface_slat_width, sqrt(pow(cutting_surface_slat_height,2)/2)*2]);
            translate([cutting_surface_slat_length+.1,cutting_surface_slat_width+(sqrt(2*pow(sqrt(pow(cutting_surface_slat_height,2)/2)*2, 2)))/2, 0])rotate([-45,0,180]) cube([cutting_surface_slat_length+.2,cutting_surface_slat_width, sqrt(pow(cutting_surface_slat_height,2)/2)*2]);
        }
    }
}

module machine_base_structure()
{
    union()
    {
        translate([0,0,cnc_base_support_width+cnc_base_height]) machine_base();
        translate([0,cnc_base_support_height,cnc_base_height]) rotate([90,0,0]) cube([cnc_base_support_length, cnc_base_support_width, cnc_base_support_height]);
        translate([0,cnc_base_width,cnc_base_height]) rotate([90,0,0]) cube([ cnc_base_support_length, cnc_base_support_width, cnc_base_support_height]);
        for (i=[1:cnc_base_number_of_supports_y])
        {
        translate([0,cnc_base_support_height/2+i*(cnc_base_width/(cnc_base_number_of_supports_y+1)),cnc_base_height]) rotate([90,0,0]) cube([ cnc_base_support_length, cnc_base_support_width, cnc_base_support_height]);
        }
         machine_base();
    }
}

module machine_base_with_slats()
{
    machine_base_structure();
    translate([cutting_margin_length*2,cutting_margin_width,cnc_base_height*2+cnc_base_support_width]) cut_slat();
    for (i=[1:cutting_surface_number_of_slats-1])
    {
        translate([cutting_margin_length*2,i*cutting_surface_gaps+(i)*cutting_surface_slat_width+cutting_margin_width,cnc_base_height*2+cnc_base_support_width]) cut_slat();
    }

}

module cnc_bed()
{
    machine_base_with_slats();
    translate([two_by_four_width,0,cnc_base_support_width+cnc_base_height*2]) linear_rod(linear_rod_x_length);
    translate([two_by_four_width,cnc_base_width-linear_rod_base_width,cnc_base_support_width+cnc_base_height*2]) linear_rod(linear_rod_x_length);
}

//cnc_bed();
