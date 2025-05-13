
import java.util.ArrayList;

//Jovan Tang
//March 31st 2025

//Unit 2 Project
//Asteroids

PImage pauseScreenshot;

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
boolean wKey, aKey, sKey, dKey, zKey, rKey, tKey, spaceKey;

//Game Objects
Spaceship ship;
Ufo ufo; 
Bullet bullet; 
ArrayList<GameObject> objects;
ArrayList<Particle> particle; 

//Game Settings
int startAsteroids = 1; //start/new round
int countAsteroids; //track asteroid count
int newWaveTimer = 300; //timer before starting new wave
int gameoverTimer = 180;
int gameoverFadeIn;
boolean gameover = false;
boolean waveClear = false;

void setup() {
  size(1500, 1000);

  textAlign(CENTER);
  rectMode(CENTER);

  gameFont = createFont("Game Of Squids.ttf", 100);
  textFont(gameFont);
  reset();
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

void reset() {
  startAsteroids = 1;
  newWaveTimer = 300;
  gameoverTimer = 180;
  countAsteroids = 0;
  gameoverFadeIn = 0;
  gameover = false;
  waveClear = false;

  objects = new ArrayList();
  ship = new Spaceship();
  ufo = new Ufo(); 
  
  objects.add(ship);
  objects.add(ufo); 
  int n = 0;
  while (n < startAsteroids) { //startAsteroids
    objects.add(new Asteroid());
    n++;
  }
}
