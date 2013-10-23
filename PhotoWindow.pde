
//new window as class using giCentre.utils.multisketch library

class PhotoWindow extends EmbeddedSketch
{
  // -------------------- Sketch-wide variables -----------------------

  float textScale;
  String[] choice = {"toronto-sm.jpg", "hallgrimskirkja-sm.jpg", "reykjavik-sm.jpg", "yorkville-sm.jpg"};
  PImage img;
  int g;

  // ----------------------- Initialisation ---------------------------

  // Initialises the sketch ready to display some animated text.
  void setup()
  {
    size(531,800);
    background(0);
    //rect(0,0,800,800);
  }

  // ----------------------- Processing draw --------------------------

  // Displays some text and animates a change in size.
  void draw()
  {
    super.draw();   // Should be the first line of draw().
    //background(200,255,200);
    rect(10, 10, 30, 30);
    
    //pull variable from the main sketch, identifying in which third the recognized face is located
    g=facelocate;
    img = loadImage(choice[g]);
    image(img, 0, 0, 800, 800);
    
    //copy the pallate from VoteWindow and draw a corresponding circle over the image
    int[] circleFill = {#000000, #A08F00, #4B8199, #683261};
    noStroke();
    ellipseMode(CENTER);
    
    fill(circleFill[g]);  
    ellipse(720, 720, 50, 50);

    //innumerate the images for clarity
    textSize(75);
    text(g, 700, 700);

  }
}

