

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
}

void reload() {
  fill(white);
  if (waveClear == false) {
    textSize(32); 
    text("Wave" +startAsteroids, width/2, height/8); //startAsteroids = wave #
  } else {
    textSize(48); 
    text("Wave" +startAsteroids+ "  Clear!", width/2, height/8);
  }
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

void gameClicks() {
  mode = PAUSE;
}
