class Particle extends GameObject {
  int particleShape;
  int colorSelector;
  int trans; 


  Particle() {
    super(ship.loc.copy(), ship.dir.copy(), 255);
    vel.rotate(random(PI-0.5, PI+0.5)); 
    vel.setMag(3);
  
    d = 10;
  }

  void act() {
     loc.add(vel);
     lives = lives - 7;
  }

  void show() {
    particleShape = int(random(1, 4));
    colorSelector = int(random(1, 4));

    noFill();
    strokeWeight(2);
    //color
    if (colorSelector == 1) {
      stroke(red, lives);
    } else if (colorSelector == 2) {
      stroke(orange, lives);
    } else {
      stroke(yellow, lives);
    }
    //shape
    pushMatrix();
    translate(loc.x, loc.y);
    if (particleShape == 1) {
      circle(0, 0, d); 
    } else if (particleShape == 2) {
      square(0, 0, d); 
    } else {
      triangle(0, 0, 0, d, d, d/2); 
    }
    popMatrix();
  }
}
