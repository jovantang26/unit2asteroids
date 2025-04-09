class GameObject {
  PVector loc; //location
  PVector vel; //velocity
  int lives;
  float d; //diameter

  GameObject(float lx, float ly, float vx, float vy) { //spaceship
    loc = new PVector(lx, ly);
    vel = new PVector(vx, vy);
    lives = 3;
  }
  
   GameObject(float lx, float ly, float vx, float vy, int lv) { //asteroid
    loc = new PVector(lx, ly);
    vel = new PVector(vx, vy);
    lives = lv;
  }

  GameObject(PVector l, PVector v, int lv) { //bullet
    loc = l;
    vel = v;
    lives = lv;
  }

  void act() {
  }

  void show() {
  }

  void wrapAround() {
    if (loc.x > width + d) { //wraps around
      loc.x = 0 - d;
    } else if (loc.x < 0 - d) {
      loc.x = width + d;
    }
    if (loc.y > height + d) {
      loc.y = 0 - d;
    } else if (loc.y < 0 - d) {
      loc.y = height + d;
    }
  }
}
