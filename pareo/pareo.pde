//Code by Adri @cybershoujo/@cybershoujo_art on twitter.
//2019-09-27
int Y_AXIS = 1;
int X_AXIS = 2;
PImage bg, base, top, hair1, hair2, sliderImg, sliderImg2;
int oner, oneg, oneb, twor, twog, twob;
int dragging = 0;
int sliderX = 230;
int sliderY = 230;
float rand;

void setup() {
 size(600, 600); 
 bg = loadImage("background.png");
 base = loadImage("pareo1.png");
 top = loadImage("pareo2.png");
 hair1 = loadImage("pareohair1.png");
 hair2 = loadImage("pareohair2.png");
 sliderImg = loadImage("slider.png");
 sliderImg2 = loadImage("slider2.png");
 
 rand = random(1.0);
 
 if (rand < 0.34) {
   oner = 246;
   oneg = 189;
   oneb = 233;
   twor = 180;
   twog = 239;
   twob = 247;
 } else if (rand < 0.67) {
   oner = 251;
   oneg = 231;
   oneb = 172;
   twor = 246;
   twog = 189;
   twob = 233;
 } else {
   oner = 57;
   oneg = 62;
   oneb = 66;
   twor = 233;
   twog = 233;
   twob = 233;
 }
}

void draw() {
  
  //draws base
  image(bg, 0, 0);
  image(base, 160, 160);
  
  //draws sliders
  
  //hair 1
  //red
  setGradient(sliderX, 25, 255, 25, color(0, oneg, oneb), color(255, oneg, oneb), X_AXIS);
  //green
  setGradient(sliderX, 65, 255, 25, color(oner, 0, oneb), color(oner, 255, oneb), X_AXIS);
  //blue
  setGradient(sliderX, 105, 255, 25, color(oner, oneg, 0), color(oner, oneg, 255), X_AXIS);
  
  //hair 2
  //red
  setGradient(25, sliderY, 25, 255, color(0, twog, twob), color(255, twog, twob), Y_AXIS);
  //green
  setGradient(65, sliderY, 25, 255, color(twor, 0, twob), color(twor, 255, twob), Y_AXIS);
  //blue
  setGradient(105, sliderY, 25, 255, color(twor, twog, 0), color(twor, twog, 255), Y_AXIS);
  
  if (dragging == 1) {
    oner = followX(sliderX, sliderX+255)-sliderX;
  } else if (dragging == 2) {
    oneg = followX(sliderX, sliderX+255)-sliderX;
  } else if (dragging == 3) {
    oneb = followX(sliderX, sliderX+255)-sliderX;
  }
  else if (dragging == 4) {
    twor = followY(sliderY, sliderY+255)-sliderY;
  } else if (dragging == 5) {
    twog = followY(sliderY, sliderY+255)-sliderY;
  } else if (dragging == 6) {
    twob = followY(sliderY, sliderY+255)-sliderY;
  }
  
  image(sliderImg, sliderX+oner-9, 20);
  image(sliderImg, sliderX+oneg-9, 60);
  image(sliderImg, sliderX+oneb-9, 100);
  
  image(sliderImg2, 20, sliderY+twor-9);
  image(sliderImg2, 60, sliderY+twog-9);
  image(sliderImg2, 100, sliderY+twob-9);
  
  //draws hair + accessories
  tint(oner, oneg, oneb);
  image(hair1, 160, 160);
  tint(twor, twog, twob);
  image(hair2, 160, 160);
  noTint();
  image(top, 160, 160);
}

int followX(int a, int b) {
  if (mouseX <= a) {return a;}
  else if (mouseX < b) {return mouseX;}
  else {return b;}
}

int followY(int a, int b) {
  if (mouseY <= a) {return a;}
  else if (mouseY < b) {return mouseY;}
  else {return b;}
}

boolean mouseIn(int x1, int y1, int x2, int y2) {
  return mouseX >= x1 && mouseY >= y1 && mouseX <= x2 && mouseY <= y2;
}


//Code taken from processing.org
void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {

  noFill();

  if (axis == Y_AXIS) {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }  
  else if (axis == X_AXIS) {  // Left to right gradient
    for (int i = x; i <= x+w; i++) {
      float inter = map(i, x, x+w, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, y, i, y+h);
    }
  }
}

void mousePressed() {
  //formula for bounds of slider
  //slider dimensions are x=18, y=31
  if (mouseIn(sliderX+oner-9, 20, sliderX+oner-9+18, 20+31)) {
    dragging = 1;
  } else if (mouseIn (sliderX+oneg-9, 60, sliderX+oneg-9+18, 60+31)) {
    dragging = 2;
  } else if (mouseIn (sliderX+oneb-9, 100, sliderX+oneb-9+18, 100+31)) {
    dragging = 3;
  } else if (mouseIn (20, sliderY+twor-9, 20+31, sliderY+twor-9+18)) {
    dragging = 4;
  } else if (mouseIn (60, sliderY+twog-9, 60+31, sliderY+twog-9+18)) {
    dragging = 5;
  } else if (mouseIn (100, sliderY+twob-9, 100+31, sliderY+twob-9+18)) {
    dragging = 6;
  }
}

void mouseReleased() {
  dragging = 0;
}
