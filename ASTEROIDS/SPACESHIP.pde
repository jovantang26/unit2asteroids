class Spaceship extends GameObject {
  PVector dir; //direction

  Spaceship() {
    super(width/2, height/2, 0, 0);
    dir = new PVector(1, 0);
  }

  void ship() {
    noFill();
    stroke(white);
    fill(255, 0, 0);
    circle(0, 0, 10);
    noFill();
    rect(0, 0, 30, 40);
    fill(black);
    strokeWeight(3);
    quad(0, 25, -15, 0, -0, -50, 15, 0);
    stroke(blue);
    triangle(0, 10, 5, 0, -5, 0);
  }

  void show() {
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(dir.heading()+ PI/2); //PI/2 is to shift by 90 degreesaaaaaaaaaa
    ship();
    popMatrix();
  }

  void act() {
    move();
    shoot();
    checkForCollisions();
  }

  void move() {
    loc.add(vel);
    if (loc.x > width) { //wraps around
      loc.x = 0;
    } else if (loc.x < 0) {
      loc.x = width;
    }
    if (loc.y > height) {
      loc.y = 0;
    } else if (loc.y < 0) {
      loc.y = height;
    }

    vel.setMag(min(vel.mag(), 12)); //set limit

    if (wKey) {
      vel.add(dir);
    } else {
      vel.setMag(vel.mag()*0.999); //slightly slows down
    }
    if (sKey) vel.setMag(vel.mag()*0.95); //slows down
    if (aKey) dir.rotate(-radians(3));
    if (dKey) dir.rotate(radians(3));
  }

  void shoot() {
    if (spaceKey) objects.add(new Bullet());
  }

  void checkForCollisions() {
  }
}
