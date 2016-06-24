PImage img;

class Player {
  float xPos;
  float yPos;
  float objWidth;
  float objHeight;
  float jumpImpulse;
  float gravity;
  float yVelocity;
  float xVelocity;

  Player() {
    jumpImpulse = -9;
    gravity = 0.8;
    objWidth = 90;
    objHeight = 50;
    xPos = 50;
    yPos = (height/2) - objHeight;
    yVelocity = 0;
    img = loadImage("flyingsuperman2.png");
  }

  // Shows player.
  void show() {
    image(img, xPos, yPos, objWidth, objHeight);
}

 //   // Moves player down.
    void move() {
      yVelocity = yVelocity + gravity;
      yPos = yPos + yVelocity;
       //if (yPos >= width || yPos <= 0 || yPos + objHeight >= width) {
      //text("Game Over", width/2, height/2);
      //text("Press 'T' to play again", width/2, height/1.5);
      //yVelocity = 0;
      //gravity = 0;
       //}
    }

    // Moves player up.
    void jump() {
      // WRITE METHOD
      yVelocity = jumpImpulse;
    }
  }