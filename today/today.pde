//Play this then run  convert -loop 0  *.png $(date +%Y_%m_%d).mpg && rm *.png
// ffmpeg -r 60 -f image2 -s 1024x800 -i %04d.png -vcodec libx264 -crf 25  -pix_fmt yuv420p $(date +%Y_%m_%d).mp4 && rm *.png



// Do anything you like below here
float majorDiameter = 100;
float minorDiameter = 50;
float ticker = 0;

// set to true to not save images whilst working
Boolean DEBUG = true;

// (WIDTH/2) + (sin(ticker)*majorDiameter)

void drawMethod(){  
  noFill();
 // stroke(90,80);
 
 
 for (float j=0; j<1.1;j=j+0.1){
 for (float i=0; i<1.1;i=i+0.1){
  strokeWeight(1);
  float rando=random(1);
  stroke(rando,10, 255, 5);
  
  rect(
    i*WIDTH - ( (rando*WIDTH*0.10) * 0.5 ),
    j*WIDTH - ( (rando*WIDTH*0.10) * 0.5 ),
    (rando*WIDTH*0.1),
    (rando*WIDTH*0.1)
    );
 }
 }
 
 
   
  // do one complete rotation every run
  ticker += (TWO_PI/FRAMELIMIT);
  
}



// until here - no cheating, everything below this line is sacrosanct

//some constants to make maths easier
int FRAMELIMIT = 1024;
int WIDTH = 800;
int HEIGHT = 600;


int frameCount = 0;

void setup() {
// ironically you can't use variables in size, so these are duplicated
  size(800, 600);
  background(255, 255, 255);
}


void draw() {
  frameCount++;
  if (!DEBUG){
    saveFrame("####.png");
  }
  if (frameCount == FRAMELIMIT) {
    exit();
  }
  drawMethod();
}
