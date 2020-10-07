PImage stars;
UFO[] ufos; // declares and array of Opp objects called opps (opposition)
boolean startup; // declares a boolean value called startup, used to check if the main menu should be displayed
float[] xps, yps; // declares an array of float values called xps and yps, used as (x,y) coordinates
float random; // declares a float value called random, used to determine the random 
int radius;
ArrayList <Float> xCoordinates = new ArrayList <Float> ();
ArrayList <Float> yCoordinates = new ArrayList <Float> ();
Float[] xCoordinatesArray;
Float[] yCoordinatesArray;
float x, y;
int numberOfufos;

/*
the setup method initialises all the variables declared
 setupStars() and setupOpps() are their own methods because they're more manageable to work with and reduces the lines of code in the setup() method
 */
void setup() {
  stars = loadImage("stars.jpg");
  size(500, 500); // CHANGE SIZE OF SCREEN
  numberOfufos = 30; // HOW MANY SPACESHIPS DO YOU WANT
  ufos = new UFO[numberOfufos]; 
  setrandomX();
  setrandomY();
  for (int i=0; i<ufos.length; i++) {
    x = xCoordinatesArray[i];
    y = yCoordinatesArray[i];
    ufos[i] = new UFO(x, y);
  }
  startup = true;
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

void draw() {
  image(stars,0,0,width,height);
  if (startup) {
    startup();
  } else {
    for (int i=0; i<ufos.length; i++) {
      ufos[i].draw();
      ufos[i].move();
    }
  }
}

void startup() {
  textAlign(CENTER);
  textSize(60);
  text("SPACE INVASION", width/2, height/2);
  textSize(20);
  text("press spacebar to play", width/2, (height/2) + 50);
}

void keyPressed() {
  if (key==' ') {
    startup = false;
  }
}

void mouseClicked(){
  for(int i=0; i<ufos.length; i++){
    if(dist(mouseX,mouseY,ufos[i].x,ufos[i].y)<ufos[i].h){
      ufos[i].hit();
    }
  }
}
