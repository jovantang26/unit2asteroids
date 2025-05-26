class Spaceship extends GameObject {
  PVector dir; //direction
  PVector tempLoc; //temporary location
  int cooldown;
  int pulseCooldown;
  int iFrames;
  int bullet;
  int reloadTime;
  int teleCooldown;
  boolean reload;
  boolean reverse;
  boolean collision;

  int f;
  boolean pulseOn;
  boolean activate;
  PVector pulseAiming;

  Spaceship() {
    super(width/2, height/2, 0, 0);
    dir = new PVector(0.5, 0);

    cooldown = 0;
    pulseCooldown = 0;
    d = 100;
    lives = 50;
    bullet = 500;
    iFrames = 0;
    reloadTime = 300;
    teleCooldown = 90;

    reload = false;
    reverse = false;
    collision = false;
  }

  void ship() {
    stroke(white);
    fill(black);
    circle(0, 0, 10);
    rect(0, 0, 30, 40);
    fill(black);
    strokeWeight(3);
    quad(0, 25, -15, 0, -0, -50, 15, 0);
    stroke(blue);
    triangle(0, 10, 5, 0, -5, 0);

    hitbox(0, -15);
  }

  void hitbox(int x, int y) {
    noStroke();

    if (lives > 0) {
      if (collision == true) {
        fill(blue, map(iFrames, 0, 300, 0, 100));
        iFrames--;
        if (iFrames <= 0) collision = false;
      }
      if (collision == false) {
        fill(white, 0);
      }
      circle(x, y, d);
    }
  }

  void show() {
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(dir.heading()+ PI/2); //PI/2 is to shift by 90 degreesaaaaaaaaaa
    ship();
    popMatrix();

    healthbar();
    bulletCountDisplay();
  }

  void act() {
    move();
    shoot();
    pulse();
    checkForCollisions();
    wrapAround();
    pulseTimer();
    pulseS();
    teleCooldown--;
    if (tKey && teleCooldown <= 0) teleport();
    if (lives <= 0) {
      lives = 0;
      gameover = true;
    }
    reset();
  }

  void move() {
    loc.add(vel);
    vel.setMag(min(vel.mag(), 12)); //set limit

    if (wKey && vel.mag() >= 0) {
      reverse = false;
      vel.add(dir); //go front
      objects.add(new Particle(1.2, 255));
      objects.add(new Particle(0.7, 255));
    } else {
      vel.setMag(vel.mag()*0.999); //slightly slows down
    }
    if (sKey && vel.mag() >= 0) {
      vel.setMag(vel.mag()*0.95); //slows down
      if (vel.mag() < 0.05) {
        reverse = true;
      }
    }
    if (sKey && reverse == true) {
      vel.setMag(min(vel.mag(), 3));
      vel.sub(dir); //reverse
      objects.add(new Particle(0.7, 325));
    }
    if (aKey) dir.rotate(-radians(3));
    if (dKey) dir.rotate(radians(3));
  }

  void shoot() {
    cooldown--;
    if (spaceKey && cooldown <= 0 && bullet > 0 && reload == false) {
      objects.add(new Bullet(ship.loc.copy(), ship.dir.copy(), ship.vel, white));
      cooldown = 10; //1 second is 60 cuz 60 fps
      bullet--;
    }
    if (rKey) reload = true;
    if (reload == true) reloadTime--;
    if (reloadTime <= 0) {
      bullet = 500;
      reloadTime = 300;
      reload = false;
    }
  }


  void pulse() {
    pulseAiming = new PVector(1, 0);
    pulseCooldown--;
    pulseOn = false;
    if (zKey && pulseCooldown <= 0) {
      f = 0;
      activate = true;
      pulseCooldown = 600; //3600
    }
  }

  void pulseS() {
    if (activate) {
      if (frameCount % 2 == 0) f++;
      if (f < 3) pulseOn = true;
      if (f > 3) activate = false;
      if (pulseOn) {
        for (int i = 0; i <32; i++) {
          pulseAiming.rotate(radians(11.25*i));
          objects.add(new Pulse(loc.copy(), pulseAiming));
        }
        pulseOn = false;
      }
      println(f);
    }
  }

  void pulseTimer() {
    fill(white);
    textSize(32);
    if (pulseCooldown > 0) {
      text("PULSE AVALIABLE IN  " + pulseCooldown/60 + "s", width/2, 50);
    } else {
      text("PULSE IS AVALIABLE    PRESS Z TO ACTIVATE", width/2, 50);
    }
  }

  void healthbar() {
    noFill();
    stroke(white);
    strokeWeight(2.5);
    rect(loc.x, loc.y+65, 100, 10);

    noStroke();
    fill(red);
    rectMode(CORNER);
    rect(loc.x-50, loc.y+60, lives*2, 10);
    rectMode(CENTER);

    textSize(32);
    if (collision) text(" " +lives+ " (i)", loc.x+100, loc.y+75); //lives display
    else text(" " +lives, loc.x+75, loc.y+75);
  }

  void bulletCountDisplay() {
    fill(white);
    textSize(16);
    if (reload == true) {
      text("R", loc.x-85, loc.y+70);
    } else {
      text(" " + bullet, loc.x-85, loc.y+70);
    }
  }

  void checkForCollisions() {
    int i = 0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i);
      if (obj instanceof Asteroid) {
        if (dist(loc.x, loc.y-15, obj.loc.x, obj.loc.y) < d/2 + obj.d/2 && collision == false) {
          collision = true;
          iFrames = 300;
          if (obj.lives == 3) lives = lives - 3;
          if (obj.lives == 2) lives = lives - 2;
          if (obj.lives == 1) lives--;
        }
      } else if (obj instanceof Bullet) {
        if (obj.Estcolour == red) {
          if (dist(loc.x, loc.y-15, obj.loc.x, obj.loc.y) < d/2 + obj.d/2 && collision == false) {
            collision = true;
            iFrames = 300;
            lives--;
          }
        }
      }
      i++;
    }
  }

  void teleport() {
    int i = 0;
    boolean safe = true;
    tempLoc = new PVector(random(0, width), random(0, height));
    while (i < objects.size()) {
      GameObject obj = objects.get(i);
      if (obj instanceof Asteroid) {
        if (dist(tempLoc.x, tempLoc.y, obj.loc.x, obj.loc.y) < d/2 + obj.d/2 + 75) {
          safe = false;
          tempLoc = new PVector(random(0, width), random(0, height));
        }
      }
      i++;
    }
    if (safe == true) {
      loc.x = tempLoc.x;
      loc.y = tempLoc.y;
      teleCooldown = 60;
    }
  }

  void reset() {
  }
}
