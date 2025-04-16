class Spaceship extends GameObject {
  PVector dir; //direction
  int cooldown;
  int pulseCooldown;
  int lives;

  Spaceship() {
    super(width/2, height/2, 0, 0);
    dir = new PVector(1, 0);

    cooldown = 0;
    pulseCooldown = 660;
    lives = 60;
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

    hitbox(0, 0, 50);
  }

  void hitbox(int x, int y, int d) {
    noStroke();
    fill(white, 0);
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
    cooldown--;
    if (spaceKey && cooldown <= 0) {
      objects.add(new Bullet());
      cooldown = 15; //1 second is 60 cuz 60 fps
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
    strokeWeight(5);
    rect(loc.x, loc.y+65, 100, 10);

    noStroke();
    fill(red);
    rect(loc.x, loc.y+65, 100, 10);
  }

  void checkForCollisions() {
    if(dist(hitbox.x, hitbox.y, obj.loc.x, obj.loc.y < hitbox.d/2 + obj.d/2));
    println(dist(hitbox.x, hitbox.y, obj.loc.x, obj.loc.y < hitbox.d/2 + obj.d/2)); 
  }
}
