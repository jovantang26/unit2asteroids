class Pulse extends GameObject { //<>//
  int timer;
  int randomColor;

  Pulse(PVector newLoc, PVector dir) {
    super(newLoc, 1);
    
    timer = 120;
    randomColor = int(random(1, 3));
    vel = dir.copy();
    vel.setMag(10);
    vel.add(ship.vel); 
  }

  void show() {
    strokeWeight(4);
    if (randomColor == 1) stroke(red);
    else if (randomColor == 2) stroke(orange);
    else if (randomColor == 3) stroke(yellow);
    pushMatrix();
    translate(loc.x, loc.y);
    circle(0, 0, 1);
    popMatrix();
  }

  void act() {
    loc.add(vel);

    timer--; 
    if (timer == 0) lives = 0; 
  }
}
