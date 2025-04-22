class Pulse extends GameObject { //<>//
  int timer; 
  int randomColor; 
  
  Pulse(PVector newLoc) {
    super(newLoc, 1, 0, 1); 
    vel.setMag(5); 
    
    timer = 30; 
    randomColor = int(random(1, 3)); 
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
  }
  
   
  
  
}
