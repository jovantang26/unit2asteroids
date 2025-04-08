class GameObject {
  PVector loc; //location
  PVector vel; //velocity
  int lives; 
  
  GameObject(float lx, float ly, float vx, float vy) { //spaceship
    loc = new PVector(lx, ly); 
    vel = new PVector(vx, vy); 
    lives = 3; 
  }
  
  GameObject(PVector l, PVector v) { //bullet
    loc = l; 
    vel = v; 
    lives = 1; 
  }
  
  void act() {
    
  }
  
  void show() {
    
  }
}
