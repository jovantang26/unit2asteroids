void mousePressed() {
  if (mode == INTRO) {
    introClicks();
  } else if (mode == GAME) {
    gameClicks();
  } else if (mode == PAUSE) {
    pauseClicks();
  } else {
    gameoverClicks();
  }
}

void keyPressed() {
  if (key == 'W' || key == 'w') wKey = true;
  if (key == 'A' || key == 'a') aKey = true;
  if (key == 'S' || key == 's') sKey = true;
  if (key == 'D' || key == 'd') dKey = true;
  if (key == 'Z' || key == 'z') zKey = true;
  if (key == 'R' || key == 'r') rKey = true;
  if (key == 'X' || key == 'x') xKey = true;
  if (key == ' ') spaceKey = true;
}


void keyReleased() {
  if (key == 'W' || key == 'w') wKey = false;
  if (key == 'A' || key == 'a') aKey = false;
  if (key == 'S' || key == 's') sKey = false;
  if (key == 'D' || key == 'd') dKey = false;
  if (key == 'Z' || key == 'z') zKey = false;
  if (key == 'R' || key == 'r') rKey = false;
  if (key == 'X' || key == 'x') xKey = false;
  if (key == 'P' || key == 'p') {
    if (mode == GAME) {
      pauseScreenshot = get(0, 0, width, height);
      mode = PAUSE;
    } else {
      mode = GAME;
    }
  }
  if (key == ' ') spaceKey = false;
}
