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

  if (frameCount % 2000 == 0) objects.add(new Ufo());
}

void reload() {
  if (frameCount % 1560 == 0) {
    frame = 1560;
    startAsteroids++;
    int i = 0;
    while (i < startAsteroids) {
      objects.add(new Asteroid());
      i++;
    }
    countAsteroids = 0;
  }
  frame--;
  fill(white);
  textAlign(CORNER);
  textSize(32);
  text("Wave" +startAsteroids+"  "+frame/60+"sec", width*0.02, height*0.98); //startAsteroids = wave #
  textAlign(CENTER);
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
