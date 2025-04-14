class Asteroid extends GameObject {
  int rotSpeed;

  Asteroid() {
    super(random(width), random(height), 1, 1, 3);
    vel.setMag(random(1, 3));
    vel.rotate(random(2*PI));
    d = lives*70;

    rotSpeed = 0;
  }

  Asteroid(PVector newLoc, int newLives) {
    super(newLoc.x, newLoc.y, 3, 3, newLives);
    vel.rotate(random(2*PI));
    d = lives*70;

    rotSpeed = 0;
  }

  void show() {
    rotSpeed++;

    fill(black);
    stroke(white);
    strokeWeight(3);
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(radians(rotSpeed));

    if (lives == 3) {
      //3 lives
      circle(0, 0, d);
      square(0, 0, sqrt(2)*d/2);
    } else if (lives == 2) {
      //2 lives
      circle(0, 0, d);
      triangle(30, 60, -65, 0, 45, -50); 
      
    } else if (lives == 1) {
      //1 lives
      circle(0, 0, d);
      circle(0, 0, d/2);
    }
    popMatrix();
  }

  void act() {
    loc.add(vel);
    wrapAround();
    checkForCollisions();
  }

  void checkForCollisions() {
    int i = 0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i);
      if (obj instanceof Bullet) {
        if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) < d/2 + obj.d/2) {
          int n = 0;
          while (n < 4) {
            objects.add(new Asteroid(loc.copy(), lives-1));
            n++;
          }
          lives = 0;
          obj.lives = 0;
        }
      }
      i++;
    }
  }
}
