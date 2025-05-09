class Particle extends GameObject {
  int particleShape;
  int colorSelector;
  int trans;
  int dir;


  Particle(float rot, int lives) { //drive
    super(ship.loc.copy(), ship.dir.copy(), lives);
    vel.rotate(random(PI-rot, PI+rot));
    vel.setMag(3);

    d = 10;
  }

  Particle() { //impact
    super(bullet.loc.copy(), 255);
    vel = new PVector (random(0, 10), random(0, 10));
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
