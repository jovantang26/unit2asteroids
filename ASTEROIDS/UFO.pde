class Ufo extends GameObject { //issues on not spawning
  PVector dir;
  int spawnTimer; 
  int shootCooldown;
  int iFrames;
  boolean collision;

  Ufo() {
    super(random(0, width), random(height+100, height+600), 0, 0);
    shootCooldown = 10;
    spawnTimer = 180; 
    vel = new PVector(0, -1);
    lives = 2;
    iFrames = 120;
    d = 100;
    collision = false;
  }

  void ship() {
    stroke(red);
    fill(black);
    circle(0, 0, 10);
    rect(0, 0, 30, 40);
    fill(black);
    strokeWeight(3);
    quad(0, 25, -15, 0, -0, -50, 15, 0);
    stroke(orange);
    triangle(0, 10, 5, 0, -5, 0);
    hitbox(0, -15);
  }

  void hitbox(int x, int y) {
    noStroke();

    if (lives > 0) {
      if (collision == true) {
        fill(blue, map(iFrames, 0, 120, 0, 100));
        iFrames--;
        if (iFrames <= 0) collision = false;
      }
      if (collision == false) {
        fill(white, 0);
      }
      circle(x, y, d);
    }
  }

  void act() {
    dir = new PVector(ship.loc.x - loc.x, ship.loc.y - loc.y);
      move();
      ufoShoot();
      checkForCollision();
   
    if (loc.y < -30) {
     lives = 0; 
    }
  }

  void move() {
    vel.setMag(4);
    loc.add(vel);
  }

  void ufoShoot() {
    shootCooldown--;
    if (shootCooldown <= 0) {
      //objects.add(new Bullet(loc.copy(), dir.copy(), ufo.vel, red));
      objects.add(new Bullet(loc.copy(), dir.copy(), new PVector(0,0), red));
      shootCooldown = 10;
    }
  }

  void checkForCollision() {
    int i = 0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i);
      if (obj instanceof Bullet) {
        if (obj.Estcolour == white) {
          if (dist(loc.x, loc.y-15, obj.loc.x, obj.loc.y) < d/2 + obj.d/2 && collision == false) {
            println("TRUE");
            collision = true;
            iFrames = 120;
            lives--;
          }
        }
      }
      i++;
    }
  }

  void show() {
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(dir.heading()+ PI/2);
    ship();
    popMatrix();
  }
}
