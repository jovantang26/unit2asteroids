class Bullet extends GameObject {
  
  int timer;
  color colour; 
  
  Bullet(PVector loc, PVector dir, PVector velAdd, int Estcolour) {
    super(loc, dir, 1);
    vel.setMag(20);
    timer = 60; 
    d = 4; 
    vel.add(velAdd);
    colour = Estcolour;
  }
  
  

  void show() {
    fill(colour);
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
