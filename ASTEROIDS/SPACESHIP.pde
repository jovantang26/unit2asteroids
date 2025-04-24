class Spaceship extends GameObject {
  PVector dir; //direction
  int cooldown;
  int pulseCooldown;
  int collisionCooldown;
  int iFrames; 
  boolean reverse;
  boolean collision;

  Spaceship() {
    super(width/2, height/2, 0, 0);
    dir = new PVector(0.5, 0);

    cooldown = 0;
    pulseCooldown = 660;
    collisionCooldown = 0;
    d = 100;
    lives = 50;
    iFrames = 0; 

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
    if (collision == true) {
        fill(blue, map(iFrames, 0, 600, 0, 100));
      iFrames--; 
      if (iFrames <= 0) collision = false; 
    } if (collision == false) {
      fill(white, 0);
    }
    circle(x, y, d);
  }

  void show() {
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(dir.heading()+ PI/2); //PI/2 is to shift by 90 degreesaaaaaaaaaa
    ship();
    popMatrix();

    healthbar();
  }

  void act() {
    move();
    shoot();
    pulse();
    checkForCollisions();
    wrapAround();
    pulseTimer();
  }

  void move() {
    loc.add(vel);
    vel.setMag(min(vel.mag(), 12)); //set limit

    if (wKey && vel.mag() >= 0) {
      reverse = false;
      vel.add(dir); //go front
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
    }
    if (aKey) dir.rotate(-radians(3));
    if (dKey) dir.rotate(radians(3));
  }

  void shoot() {
    cooldown--;
    if (spaceKey && cooldown <= 0) {
      objects.add(new Bullet());
      cooldown = 10; //1 second is 60 cuz 60 fps
    }
  }

  void pulse() {
    pulseCooldown--;
    if (zKey && pulseCooldown <= 0) {
      objects.add(new Pulse(loc.copy()));
      pulseCooldown = 3600;
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
    
    if (collision) text(" " +lives+ " (i)", loc.x+100, loc.y+75); 
    else text(" " +lives, loc.x+75, loc.y+75); 
  }

  void checkForCollisions() {
    int i = 0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i);
      if (obj instanceof Asteroid) {
        if (dist(loc.x, loc.y-15, obj.loc.x, obj.loc.y) < d/2 + obj.d/2 && collisionCooldown <= 0 && collision == false) {
          collision = true;
          iFrames = 600; 
          if (obj.lives == 3) lives = lives - 3;
          if (obj.lives == 2) lives = lives - 2;
          if (obj.lives == 1) lives--;
          collisionCooldown = 600;
        }
      }
      i++;
    }
    collisionCooldown--;
  }
}
