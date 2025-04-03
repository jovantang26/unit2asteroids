class Spaceship {
  PVector loc; //location
  PVector vel; //velocity

  Spaceship() {
    loc = new PVector (width/2, height/2);
    vel = new PVector (5, 0); 
  }

  void ship(float x, float y) {
    pushMatrix();
    translate(loc.x, loc.y);

    noFill();
    stroke(white); 
    rect(23, 20, 10, 40);
    rect(7, 20, 10, 40);
    fill(black);
    strokeWeight(1);
    quad(15, 45, 0, 30, 15, -15, 30, 30);
    stroke(blue);
    triangle(20, 25, 10, 25, 15, 15); 


    popMatrix();
  }

  void show() {
    ship(loc.x, loc.y);
  }

  void act() {
    loc.add(vel); 
  }
}
