class Bullet {
  PVector loc; //location
  PVector vel; //velocity
  
  
  Bullet() {
    loc = new PVector(ship.loc.x, ship.loc.y);
    vel = ship.dir.copy(); 
    vel.setMag(10); 
  }
  
  void show() {
    fill(yellow); 
    noStroke(); 
    ellipse(loc.x, loc.y, 2, 10); 
  }

  void act() {
    loc.add(vel); 
  }
}
