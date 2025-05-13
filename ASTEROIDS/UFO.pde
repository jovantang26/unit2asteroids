class Ufo extends GameObject { //issues on not spawning
  PVector dir;
  PVector aim;
  int spawnTimer;
  int shootCooldown; 

  Ufo() {
    super(random(0, width), random(-600, 100), 0, 0);
    spawnTimer = 360;
    shootCooldown = 120; 
    vel = new PVector(0, 0);
  }

  void ufo() {
    stroke(red);
    fill(black);
    circle(0, 0, 10);
    rect(0, 0, 30, 40);
    fill(black);
    strokeWeight(3);
    quad(0, 25, -15, 0, -0, -50, 15, 0);
    stroke(orange);
    triangle(0, 10, 5, 0, -5, 0);
  }

  void act() {
    println("spawmned");
    spawnTimer--;
    print(spawnTimer);
    if (spawnTimer <= 0) {
      move();
      shoot();
    }
    spawnTimer = 1000;
  }

  void move() {
    vel.setMag(10);
    loc.add(vel);
  }

  void shoot() {
    shootCooldown--; 
    dir = new PVector(ship.loc.x - loc.x, ship.loc.y - loc.y);
  }

  void show() {
    ufo();
  }
}
