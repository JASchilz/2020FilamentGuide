fobbit_height = 2;
fobbit_width = 6;
guide_height = 20;

outer_filament_diameter = 12;
inner_filament_diameter = 2;

rotate([90, 0, 0]) {
difference() {
    union() {
        // The body of the guide
        cube(size=[20, 20, guide_height], center=true);
        
        // The fobbit on the bottom of the guide
        translate([0, 0, guide_height/2 + fobbit_height/2]) {
            cube(size=[fobbit_width, 20, fobbit_height], center=true);
        }
    }
    
    // The screw hole
    cylinder(d=4.8, h=100, $fn=100, center=true);
    
    // The wider shaft through the middle to accomodate the screw head
    translate([0, 0, -2]) {
        cylinder(d=8, h=guide_height, $fn=100, center=true);
    }
    
    // The two intersecting filament guide paths
    for (rotation = [[0, 90, 0], [90, 0, 0]]) {
        rotate(rotation) {
            translate([0, 0, 5 + .1]) {
                cylinder(
                    d1=inner_filament_diameter,
                    d2=outer_filament_diameter,
                    h=10,
                    $fn=100,
                    center=true
                );
            }
            translate([0, 0, -5 - .1]) {
                cylinder(
                    d1=outer_filament_diameter,
                    d2=inner_filament_diameter,
                    h=10,
                    $fn=100,
                    center=true
                );
            }
            cylinder(
                d=inner_filament_diameter,
                h=100,
                $fn=100,
                center=true
            );
        }
    }
}
}