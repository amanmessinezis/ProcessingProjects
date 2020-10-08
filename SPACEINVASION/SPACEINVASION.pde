import processing.sound.*;
SoundFile mainmenu, pew;
PImage stars;
UFO[] ufos; // declares an array of ufo objects called ufos 
boolean startup; // declares a boolean value called startup, used to check if the main menu should be displayed
float[] xps, yps; // declares an array of float values called xps and yps, used as (x,y) coordinates
ArrayList <Float> xCoordinates = new ArrayList <Float> ();
ArrayList <Float> yCoordinates = new ArrayList <Float> ();
Float[] xCoordinatesArray;
Float[] yCoordinatesArray;
float x, y;
int numberOfufos;
int score;

/*
the setup method initialises all the variables declared
 setupStars() and setupOpps() are their own methods because they're more manageable to work with and reduces the lines of code in the setup() method
 */
void setup() {
  mainmenu = new SoundFile(this, "mainmenu.wav");
  pew = new SoundFile(this, "pew.wav");
  score = 0;
  stars = loadImage("stars.jpg");
  size(500, 500); // CHANGE SIZE OF SCREEN
  numberOfufos = 100; // HOW MANY SPACESHIPS DO YOU WANT
  ufos = new UFO[numberOfufos]; 
  setrandomX();
  setrandomY();
  for (int i=0; i<ufos.length; i++) {
    x = xCoordinatesArray[i];
    y = yCoordinatesArray[i];
    ufos[i] = new UFO(x, y);
  }
  mainmenu.play();
  startup = true;
}

void draw() {
  image(stars, 0, 0, width, height);
  if (startup) {
    startup();
  } else {
    mainmenu.stop();
    for (int i=0; i<ufos.length; i++) {
      ufos[i].draw();
      ufos[i].move();
    }
    textSize(40);
    text(score, 20, height-10);
  }
}

void startup() {
  textAlign(CENTER);
  textSize(60);
  text("SPACE INVASION", width/2, height/2);
  textSize(20);
  text("press spacebar to play", width/2, (height/2) + 50);
  textSize(15);
  text("click to shoot the UFOs!", width/2, (height/2) + 80);
}

void setrandomX() { // set random x values to an array of x values called xCoordinates
  for (int i=0; i<ufos.length; i++) {
    x = random(-(numberOfufos*50), -100); // RANGE OF X VALUES
    xCoordinates.add(x);
  }
  xCoordinatesArray = xCoordinates.toArray(new Float[xCoordinates.size()]);
}

void setrandomY() { // set random y values to an array of y values called yCoordinates
  for (int i=0; i<ufos.length; i++) {
    y = random(10, height-150); // RANGE OF Y VALUES
    yCoordinates.add(y);
  }
  yCoordinatesArray = yCoordinates.toArray(new Float[yCoordinates.size()]);
}

void keyPressed() {
  if (key==' ') {
    startup = false;
  }
}

void mousePressed() {
  for (int i=0; i<ufos.length; i++) {
    if (dist(mouseX, mouseY, ufos[i].x, ufos[i].y)<ufos[i].h) {
      pew.play();
      ufos[i].hit();
      score++;
    }
  }
}
