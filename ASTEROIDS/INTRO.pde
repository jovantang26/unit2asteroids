void intro() {
  background(black);

  //Background Design
  noFill();
  stroke(white);
  rectMode(CENTER);
  square(width/2, height/2, 500);
  circle(width/2, height/2, 500);
  triangle(565, 667, 688, 258, 988, 577);

  //square background
  noStroke();
  fill(black);
  rect(width/2, (height/2)-30, width, height/7);

  //text
  fill(white);
  textSize(96);
  text("A S T E R O I D S", width/2, height/2);

  idleAnimation();
}

void introClicks() {
  mode = GAME;
  objects = new ArrayList();
  ship = new Spaceship();
  objects.add(ship);
  int n = 0;
  while (n < startAsteroids) {
    objects.add(new Asteroid());
    n++;
  }
}

void idleAnimation() {
}
