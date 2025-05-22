void game() {
  background(black);
  //hideParticles();

  int i = 0;
  while (i < objects.size()) {
    GameObject currentObject = objects.get(i);
    currentObject.act();
    currentObject.show();

    if (currentObject.lives <= 0) {
      objects.remove(i);
    } else {
      i++;
    }
    if (mode == GAMEOVER) {
      objects.remove(i);
    }
  }

  gameControls(); 
  reload();
  gameOver();
   
  if (frameCount % 280 == 0) objects.add(new Ufo());
}

void reload() {
  fill(white);
  textAlign(CORNER);
  if (waveClear == false) {
    textSize(32);
    text("Wave" +startAsteroids, width*0.02, height*0.98); //startAsteroids = wave #
  } else {
    textSize(48);
    text("Wave" +startAsteroids+ "  Clear!", width*0.02, height*0.98);
  }
  textAlign(CENTER);
  if (countAsteroids == startAsteroids + startAsteroids*4 + startAsteroids*16) {
    waveClear = true;
  }
  if (waveClear == true) {
    newWaveTimer--;
  }
  if (newWaveTimer <= 0) {
    startAsteroids++;
    int i = 0;
    while (i < startAsteroids) {
      objects.add(new Asteroid());
      i++;
    }
    waveClear = false;
    countAsteroids = 0;
    newWaveTimer = 300;
  }
}

void gameOver() {
  if (gameover == true) {
    gameoverTimer--;
    if (gameoverTimer < 0) mode = GAMEOVER;
  }
}

void gameControls() {
  fill(white); 
  textSize(32);
  text("P to pause", width*0.9, height*0.91);
  text("R to reload", width*0.9, height*0.95);
  text("T to teleport", width*0.9, height*0.99);
}

//void hideParticles() {
//  int i = 0;
//  while (i < particle.size()) {
//    Particle curPar = particle.get(i);
//    curPar.act();
//    curPar.show();
//    i++; 
//  }
//}

void gameClicks() {
}
