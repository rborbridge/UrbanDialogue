
//new window as class using giCentre.utils.multisketch library

class VoteWindow extends EmbeddedSketch
{
  // -------------------- Sketch-wide variables -----------------------
int circle1X, circle1Y;  // Position of circle1 button
int circle2X, circle2Y;  // Position of circle2 button
int circle3X, circle3Y;  // Position of circle3 button
int rectSize = 90;     // Diameter of rect
int circleSize = 50;   // Diameter of circle
color circle1Color, circle2Color, circle3Color, baseColor;
color circle1Highlight, circle2Highlight, circle3Highlight;
color currentColor;
boolean circle1Over = false;
boolean circle2Over = false;
boolean circle3Over = false;

PFont f;
int vote1=0;
int vote2=0;
int vote3=0;


  // ----------------------- Initialisation ---------------------------

void setup() {
  size(200, 300);
  
  //setup the palatte for drawing clickable circles
  circle1Color = color(#A08F00);
  circle1Highlight = color(#FFE348);
  circle2Color = color(#4B8199);
  circle2Highlight = color(#A5E9F5);
  circle3Color = color(#683261);
  circle3Highlight = color(#986FE4);
  baseColor = color(102);
  currentColor = baseColor;
 // circle1X = width/2+circleSize/2+10;
 // circle1Y = height/2;
  
  //even spacing of vertical circles
  circle1X = 50;
  circle1Y = height/4*1;
  circle2X = 50;
  circle2Y = height/4*2;
  circle3X = 50;
  circle3Y = height/4*3;

  ellipseMode(CENTER);
}


  // ----------------------- Processing draw --------------------------
void draw() {
 super.draw();   // Should be the first line of draw().
  update(mouseX, mouseY);
  background(currentColor);
  textAlign(LEFT);
  fill(30);
  textSize(36);
  
  //show number of clicks on each circle
  text(vote1, 150, circle1Y);
  text(vote2, 150, circle2Y);
  text(vote3, 150, circle3Y);
  
  //based on update(), highlight the circle the mouse is currently hovering over
  if (circle1Over) {
    fill(circle1Highlight);
  } else {
    fill(circle1Color);
  }
  stroke(0);
  ellipse(circle1X, circle1Y, circleSize, circleSize);


if (circle2Over) {
    fill(circle2Highlight);
  } else {
    fill(circle2Color);
  }
  stroke(0);
  ellipse(circle2X, circle2Y, circleSize, circleSize);

  
  if (circle3Over) {
    fill(circle3Highlight);
  } else {
    fill(circle3Color);
  }
  stroke(0);
  ellipse(circle3X, circle3Y, circleSize, circleSize);

//drawType(width * 0.75);
}
//if the mouse IS over the circles than change the variables to identify which.
void update(int x, int y) {
  if (overCircle(circle1X, circle1Y, circleSize) ) {
    circle1Over = true;
    circle2Over = false;
    circle3Over = false;
  } else if ( overCircle(circle2X, circle2Y, circleSize) ) {
    circle1Over = false;
    circle2Over = true;
    circle3Over = false;  
  } else if ( overCircle(circle3X, circle3Y, circleSize) ) {
    circle1Over = false;
    circle2Over = false;
    circle3Over = true;
  } else {
    circle1Over = circle2Over = circle3Over = false;
  }
}

//update the "vote" variable related for each circle upon click
void mousePressed() {
  if (circle1Over) {
    currentColor = circle1Color;
    vote1++;
  }
  if (circle2Over) {
    currentColor = circle2Color;
    vote2++;
    
  }
  if (circle3Over) {
    currentColor = circle3Color;
    vote3++;

  }

}

//determine if the mouse is over the circle
boolean overCircle(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}
}
