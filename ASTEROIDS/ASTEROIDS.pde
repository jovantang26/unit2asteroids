import java.util.ArrayList;

//Jovan Tang
//March 31st 2025

//Unit 2 Project
//Asteroids

//Font
PFont gameFont;

//Color Pallette
color black = #000000;
color white = #ffffff;
color red = #ff0000;
color orange = #ffa500;
color yellow = #ffff00;
color pink = #ffc0cb;
color blue = #aee4ed;

//Mode Framework
int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;

//Keyboard Controls
boolean wKey, aKey, sKey, dKey, escKey, spaceKey;

//Game Objects
Spaceship ship;
ArrayList<GameObject> objects;

void setup() {
  size(1500, 1000);

  textAlign(CENTER);
  rectMode(CENTER);

  gameFont = createFont("Game Of Squids.ttf", 100);
  textFont(gameFont);
  objects = new ArrayList();
  ship = new Spaceship();
  objects.add(ship);

  objects.add(new Asteroid());
  objects.add(new Asteroid());
  objects.add(new Asteroid());
  objects.add(new Asteroid());
  objects.add(new Asteroid());
}

void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else {
    gameover();
  }
}
