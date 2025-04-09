class Asteroid extends GameObject {
  Asteroid() {
    super(random(width), random(height), 1, 1, 3);
    vel.setMag(random(1, 3));
    vel.rotate(random(2*PI));
    d = lives*50;
  }

  void show() {
    fill(black);
    stroke(white);
    strokeWeight(3);
    circle(loc.x, loc.y, d);
    square(loc.x, loc.y, sqrt(2)*d/2);
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
          lives--;
          obj.lives = 0;
        }
      }
      i++;
    }
  }
}
