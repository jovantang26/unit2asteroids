void pause() {
  noStroke(); 
  image(pauseScreenshot,0,0);
  fill(black, 150); 
  rect(width/2, height/2, width, height); 
  textSize(192); 
  fill(white); 
  text("PAUSE", width/2, height/2);
}



void pauseClicks() {
  mode = GAMEOVER; 
}
