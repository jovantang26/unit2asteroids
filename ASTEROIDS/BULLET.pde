class Bullet extends GameObject {
  
  int timer; 
  
  Bullet() {
    super(ship.loc.copy(), ship.dir.copy(), 1);
    vel.setMag(20);
    timer = 60; 
    d = 4; 
    vel.add(ship.vel);
  }

  void show() {
    fill(white);
    noStroke();
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(vel.heading());
    ellipse(0, 0, 3, 6);
    popMatrix();
  }

  void act() {
    loc.add(vel);
    wrapAround(); 
    timer--; 
    if (timer == 0) lives = 0; 
  }
}
