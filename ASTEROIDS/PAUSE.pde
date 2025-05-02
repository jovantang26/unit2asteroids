void pause() {
  noStroke(); 
  image(pauseScreenshot,0,0);
  fill(black, 150); 
  rect(width/2, height/2, width, height); 
}

void pauseClicks() {
  mode = GAMEOVER; 
}
