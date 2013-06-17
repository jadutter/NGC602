linear_extrude(height=1) union()
{
  translate([20,  0])  moon(14, 12, $fn=40);

  translate([ 0,-10])  dot(2, $fn=20);
  translate([ 0,  0])  dot(4, $fn=20);
  translate([ 0, 10])  dot(4, 2, $fn=30);
  translate([40,  5])  dot(2, $fn=20);
  translate([50, 10])  dot(2, $fn=20);

  translate([13,  0])  star(8, 3.7);
  translate([ 0, 20])  star(5, 2.5);
  translate([48, 19])  star(5, 3, 7);
  translate([42, 45])  difference() { star(8, 4); star(5, 2.5); }
  translate([38, 15])  star(5, 2, 4);
  translate([40, -5])  star(5, 2.5);
  translate([50,  0])  star(4, 2.5, 7);

  translate([20, 32])  saturn(15, 26, 20, $fn=40);
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
