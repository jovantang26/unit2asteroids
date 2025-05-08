void gameover() {
  gameoverFadeIn++;
    if (gameoverFadeIn < 60) {
    fill(black, 15);
  } else {
    fill(black, 150);
  }
  noStroke(); 
  rect(width/2, height/2, width, height);
  textSize(192);
if (gameoverFadeIn < 60) {
    fill(white, 15);
  } else {
    fill(white, 150);
  }
  text("GAMEOVER", width/2, height/2);
  textSize(48); 
  text("YOU MADE IT TO WAVE " + startAsteroids, width/2, height*3/4); 
}

void gameoverClicks() {
  mode = INTRO;
  reset(); 
}
