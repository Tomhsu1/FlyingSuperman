PImage imags;
int score;
import processing.sound.*;
int gameState; // 0 = start, 1 = running, 2 = over
Player tom;
Pipe pipeOne, pipeTwo;
SoundFile bgMusic;
SoundFile scoreMusic;
SoundFile dyingMusic;

void setup() {
  size(500, 500);
  score = 0;
  gameState = 0;
  tom = new Player();
  textAlign(CENTER);
  pipeOne = new Pipe(1);
  imags = loadImage("sky.png");
  frameRate(100);
  bgMusic = new SoundFile(this, "finalCountdown.mp3");
  bgMusic.loop();
  scoreMusic = new SoundFile(this, "coinCollect.mp3");
  dyingMusic = new SoundFile(this, "Man of steel scream.mp3");
}

void draw() {
  //dyingMusic.stop();
  image(imags, 0, 0, width, height);
  if (gameState == 0) {
    tom.show();
    pipeOne.show();
    textSize(25);
    fill(255, 100, 150);
    text("Flappy Game", width/2, height/5);
    fill(100, 180, 190);
    text("Press the SpaceBar to play", width/2, height/3.5);
  } else if (gameState == 1) {
    tom.show();
    tom.move();
    pipeOne.show();
    pipeOne.move();
    if (tom.yPos >= width || tom.yPos <= 0 || tom.yPos + tom.objHeight >= width) {
      gameState = 2;
    }
    fill(255, 0, 0);
    text(score, width/2, 60); 
    if (tom.xPos < pipeOne.xPos + pipeOne.objWidth
    && tom.xPos + tom.objWidth > pipeOne.xPos
    && tom.yPos < pipeOne.yPos + pipeOne.objHeight
    && tom.yPos + tom.objHeight > pipeOne.yPos) {
      gameState = 2;
    }
    if (pipeOne.counted == false && tom.xPos + tom.objWidth > pipeOne.xPos + pipeOne.objWidth) {
      score = score + 1;
      pipeOne.counted = true;
      scoreMusic.play();
    }
  } else { // gameState == 2
    // game over
    dyingMusic.play();
    fill(255, 0, 0);
    text(score, width/2, 60);
    fill (0, 255, 0);
    text("Game Over", width/2, height/2.5);
    text("Press the SpaceBar to restart", width/2, height/2.2);
    tom.gravity = 0;
    tom.yVelocity = 0;
    tom.show();
    pipeOne.show();
  }
  println(gameState);
}

void keyPressed() {
  if (key == ' ' && gameState == 0) {
    gameState = 1;
  }
  if (key == ' ' && gameState == 1) {
    tom.jump();
  }
  if (key == ' ' && gameState == 2) {
  gameState = 1;
  score = 0;
  tom = new Player();
  pipeOne = new Pipe(1);
  tom.jump();
  }
}

void mousePressed() {
  if (gameState == 1) {
    tom.jump();
  }
  //if (gameState == 2) {
  //   dyingMusic.stop();
  //}
}