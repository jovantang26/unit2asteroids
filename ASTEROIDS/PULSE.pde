class Pulse extends GameObject { //<>//
  int timer; 
  int randomColor; 
  PVector dir; 
  
  Pulse(PVector newLoc) {
    super(newLoc, 1); 
    
    timer = 30; 
    randomColor = int(random(1, 3)); 
    dir = new PVector (0, 0); 
    vel = new PVector (1, 0); 
    vel.setMag(10); 
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
    for (int i = 0; i < 32; i++) {
      dir.rotate(radians(11.25)); 
      objects.add(new Bullet(ship.loc.copy, dir, vel, coloor)); //this
    }
    loc.add(vel);  
  }
  
   
  
  
}
