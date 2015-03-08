// Title: rainDROPS
// Author: André daCosta -- MOME Animation / Media Design
// Pixel Processing MOME 2010 Autumn Workshop
//
// Description: Fallin pixels, just like rain.
// Interaction: use number keys to control velocity of the rain. 1-9 and 0 to freeze everything
// Parameters: Just by changing the variable "tp" u can create a lot of diferente effects. inside the "void Draw" there's a calculation, 
//             and in the rain class there's another possibility, if you use them, you'll get a effect like "the Matrix".
// Commment: If we go further with this project, it's possible we can get interaction with the movement, and try to create differences 
//           between the diferent planes (in the Perspective way)
//
// END OF HEADER 

//
// use the 4 variables below to set the display and video /image sizes


// This is video, so we have to import the lib

import processing.video.*;

// Name the capture and the rain
Capture cam;
Rain rl;

//here is where we create all the different variables for later use
color c;
int tp; //color of each drop
int numDrops = 4000; // number of drops that are showned on the screen
int videoScale = 1;
int vl = 0; // vl for velocity (of the rain drops)
Rain[] drops = new Rain[numDrops]; // Declare and create the array


int w = 640, h = 480;         // variables to define the DISPLAY size, in setup give them values
int cw = 1280, ch = 960;       // varaibles to define the capture size, in setup give them  values

PFont font;


// Here we create the set.
// The size of the capture and some more details about the rain drops
void setup() {

  size(cw,ch);
  String[] cameras = Capture.list();
  cam = new Capture(this,cw,ch,40);
  cam.start();
  background(0);
  smooth();
  noStroke();
  for (int i = 0; i < drops.length; i++) {
    drops[i] = new Rain();
    rl = new Rain();
  }
}

void draw() {
  if (cam.available()) {
    cam.read();
    //image(video,0,0);
  }

  
  fill(0,5);
  rect(0,0,cw,ch);
  for (int i = 0; i < drops.length; i++) {


    int x = (int) drops[i].x*videoScale;
    int y = (int) drops[i].y*videoScale;

    int loc = (cam.width - x - 1) + y*cam.width;
    color c = (int) cam.pixels[loc];
    //tp = (int) (brightness(c)*1.95)+60;
    tp = c;
    drops[i].fall();

  }
  font = loadFont("ArialMT-48.vlw");
  textFont(font,16);
  fill (255); 
  text("raindDROPS by André daCosta -- MOME", 5, height - 10);


}


class Rain {
  float x = random (cw);
  float y = random (height);

  void fall() {
    y = y + vl;
    fill (tp);
    //fill (0,tp,0);
    ellipse(x, y, 1, 3);
    if( y > height) {
      y = random (-1);
    }
  }
}


void mousePressed()
{
  saveFrame("screenshot##.jpg");
}

void keyPressed() {
  if ( key == '1') {
    vl = 1;
  }
  if ( key == '2') {
    vl = 2;
  }
  if ( key == '3') {
    vl = 3;
  }
  if ( key == '4') {
    vl = 4;
  }
  if ( key == '5') {
    vl = 5;
  }
  if ( key == '6') {
    vl = 6;
  }
  if ( key == '7') {
    vl = 7;
  }
  if ( key == '8') {
    vl = 8;
  }
  if ( key == '9') {
    vl = 9;
  }
  if ( key == '0') {
    vl = 0;
  }
}

