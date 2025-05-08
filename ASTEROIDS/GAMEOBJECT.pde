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

  GameObject(PVector l, PVector v, int lv) { //bullet/particle
    loc = l;
    vel = v;
    lives = lv;
  }

  GameObject(PVector l, int lv) { //pulse
    loc = l;
    lives = lv;
  }

  void show() {
  }

  void act() {
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
