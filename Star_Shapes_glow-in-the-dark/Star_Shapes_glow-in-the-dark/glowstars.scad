linear_extrude(height=0.5) union()
{
  translate([ 0, 0])  dot(2, $fn=30);
  translate([ 0,10])  dot(1, $fn=20);
  translate([ 0,20])  dot(2, 1, $fn=30);
  translate([20, 0])  moon(5, 5, $fn=30);
  translate([20,20])  saturn(5, 10, 7, $fn=30);
  translate([10,10])  star(5, 2.5);
  translate([10,30])  star(4, 2.5, 7);
  translate([30,10])  difference() { star(5, 2.5); star(3, 1.5); }
  translate([30,30])  star(4, 1.5, 4);
  translate([10, 0])  star(2, 1);
}



//////////////////////////////////////////////////////////////////////
// star
//    radius1 -- outer radius
//    radius2 -- inner radius
//    arms    -- number of arms
module star(radius1, radius2, arms=5)
{
    arc=360/arms;
    harc=arc/2;
    xcood=radius1*sin(harc);
    ycood=radius1*cos(harc);

    difference()
    {
        circle(radius1);
        for(i=[0:(arms-1)])
        {
            //  weird -- if "i*arc+harc", arms=8 fails
            rotate(i*arc)
                polygon(points=[ [0, -radius2],
                                 [-xcood, -ycood],
                                 [0, -2*radius1], 
                                 [+xcood, -ycood] ],
                        paths=[0:3]);
        }
    }
}

//////////////////////////////////////////////////////////////////////
// simple dot/circle
//    radius -- outer radius
//    thick  -- thickness of circle (0 for filled)
//    $fn    -- smoothness of circle
module dot(radius, thick=0)
{
    difference()
    {
        circle(radius);
        if (thick > 0) circle(radius - thick);
    }
}

//////////////////////////////////////////////////////////////////////
// saturn (dot with ring)
//    radius -- outer radius of planet
//    ring1  -- outer radius of ring
//    ring2  -- inner radius of ring
//    $fn    -- smoothness of circle
module saturn(radius, ring1, ring2)
{
    union()
    {
        circle(radius);
        difference()
        {
            scale([1, 0.2]) circle(ring1);
            translate([0, -0.03*ring2]) scale([1, 0.2])
                circle(ring2);
        }
    }
}

//////////////////////////////////////////////////////////////////////
// "classic" moon shape
//    radius1 -- outer radius of circle
//    radius2 -- radius of cutout circle
//    skew    -- offset factor of cutout
//    $fn     -- smoothness of circles
module moon(radius1, radius2, skew=0.75)
{
    difference()
    {
        circle(radius1);
        translate([-radius2*skew,0]) circle(radius2);
    }
}
