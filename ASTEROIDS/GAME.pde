

void game() {
  background(black);

  int i = 0;
  while (i < objects.size()) {
    GameObject currentObject = objects.get(i);
    currentObject.act();
    currentObject.show();

    if (currentObject.lives == 0) {
      objects.remove(i);
    } else {
      i++;
    }
  }

  reload();
  gameOver(); 
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

void gameClicks() {
  
}
