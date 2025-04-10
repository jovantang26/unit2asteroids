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
  if (key == ESC) escKey = true;
  if (key == ' ') spaceKey = true; 
}

void keyReleased() {
  if (key == 'W' || key == 'w') wKey = false;
  if (key == 'A' || key == 'a') aKey = false;
  if (key == 'S' || key == 's') sKey = false;
  if (key == 'D' || key == 'd') dKey = false;
  if (key == ESC) escKey = false;
  if (key == ' ') spaceKey = false; 
}
