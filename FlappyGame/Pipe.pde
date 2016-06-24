class Pipe {
  float xPos;
  float yPos;
  float objWidth;
  float objHeight;
  boolean counted;
  float xVelocity;
  PImage imag;


  Pipe(int num) {
    imag = loadImage("building.png");

    counted = false;
    objWidth = 50;
    objHeight = 220;
    xPos = width + (num * (width/2));
    yPos = chooseYPos();
    xVelocity = -10;
  }

  // Shows pipe.
  void show() {
    image(imag, xPos, yPos, objWidth, objHeight);
  }

  // Moves pipe across the screen.
  void move() {
    // WRITE METHOD
    xPos = xPos + xVelocity;
    if (xPos + objWidth <= 0) {
      reset();
    }
  }

  // Resets pipe at initial location.
  void reset() {
    // WRITE METHOD
    xPos = width;
    counted = false;
    yPos = chooseYPos();
  }

  // Returns y position for either top pipe or bottom pipe.
  float chooseYPos() {
    int location = (int)random(2);
    if (location == 0) {
      return 0;
    } else {
      return height - objHeight;
    }
    // CONTINUE METHOD
  }
}