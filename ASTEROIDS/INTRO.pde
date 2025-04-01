void intro() {
  background(black);

  //Background Design
  noFill(); 
  stroke(white); 
  rectMode(CENTER);
  square(width/2, height/2, 500);

  //text
  text("A S T E R O I D S", width/2, height/2);
}

void introClicks() {
  mode = GAME;
}
