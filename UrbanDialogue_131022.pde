import hypermedia.video.*;
import java.awt.Rectangle;
import org.gicentre.utils.multisketch.*; 

OpenCV opencv;

// contrast/brightness values
int contrast_value    = 0;
int brightness_value  = 0;

//These variables hold the x and y location for the middle of the detected face.
int midFaceY=0;
int midFaceX=0;
//The variables correspond to the middle of the screen, and will be compared to the midFace values
int midScreenY = (height/2);
int midScreenX = (width/2);
int midScreenWindow = 10;  //This is the acceptable 'error' for the center of the screen.
int facelocate = 0;

//-----------------------
void setup() {

  size( 640, 480 );
  
  //create new sketchWindow with giCentre.Utils.mutisketch library
  PopupWindow win1 = new PopupWindow(this, new PhotoWindow());
  win1.setVisible(true);

  PopupWindow win3 = new PopupWindow(this, new VoteWindow());
  win3.setVisible(true);

  //setup OpenCV facial recognition library
  opencv = new OpenCV( this );
  opencv.capture( width, height );                   // open video stream
  opencv.cascade( OpenCV.CASCADE_FRONTALFACE_ALT );  // load detection description, here-> front face detection : "haarcascade_frontalface_alt.xml"
}


//-----------------------
void draw() {

  // grab a new frame
  // and convert to gray
  opencv.read();
  opencv.convert( GRAY );
  opencv.contrast( contrast_value );
  opencv.brightness( brightness_value );

  // proceed detection
  Rectangle[] faces = opencv.detect( 1.2, 2, OpenCV.HAAR_DO_CANNY_PRUNING, 40, 40 );

  // display the image
  image( opencv.image(), 0, 0 );

  //draw the grid on top
  line(width/3, 0, width/3, height);
  line(width/3*2, 0, width/3*2, height);

  // draw face area(s)
  noFill();
  //stroke(255);
  println(facelocate);
  for ( int i=0; i<faces.length; i++ ) {
    ellipseMode(CORNER);

    rect( faces[i].x, faces[i].y, faces[i].width, faces[i].height ); 

    ellipse(((faces[i].x+(faces[i].x+faces[i].width))/2), ((faces[i].y+(faces[i].y+faces[i].height))/2), 20, 20);

    //do something different depending where the centre of the face is found
    //in the bottom third
    if (((faces[i].x+(faces[i].x+faces[i].width))/2) > width/3) {
      stroke(0, 0, 255);
      facelocate = 2;
      //text("2", 150, 200);

      
      //in the middle third
      if (((faces[i].x+(faces[i].x+faces[i].width))/2) > (width/3*2)) 
       // stroke(255, 0, 0);
        facelocate = 3;
    
    //in the top third
    } else {
      stroke(0, 0, 255);
      facelocate = 1;
    }
  }
}



