class Ufo extends GameObject { //issues on not spawning
  PVector dir;
  int spawnTimer;
  int shootCooldown;

  Ufo() {
    super(random(0, width), random(height+100, height+400), 0, 0);
    spawnTimer = 180;
    shootCooldown = 120;
    vel = new PVector(0, -1);
    lives = 1;
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
  }

  void act() {
    dir = new PVector(ship.loc.x - loc.x, ship.loc.y - loc.y);
   
    spawnTimer--;
    println(spawnTimer); 
    if (spawnTimer <= 0) {
       move();
      ufoShoot();
      //spawnTimer = 180; 
    }
  }

  void move() {
    vel.setMag(4);
    loc.add(vel);
  }

  void ufoShoot() {
    shootCooldown--;
  }

  void show() {
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(dir.heading()+ PI/2);
    ship();
    popMatrix();
  }
}
