//Play this then run  convert -loop 0  *.png $(date +%Y_%m_%d).mpg && rm *.png
// ffmpeg -r 60 -f image2 -s 1024x800 -i %04d.png -vcodec libx264 -crf 25  -pix_fmt yuv420p $(date +%Y_%m_%d).mp4 && rm *.png



// Do anything you like below here
float majorDiameter = 100;
float minorDiameter = 50;
float ticker = 0;

// set to true to not save images whilst working
Boolean DEBUG = true;



void drawMethod(){  
  noFill();
 // stroke(90,80);
  strokeWeight(2);
  stroke(100*sin(ticker*4),10, 255, 10);
  line(
 // WIDTH*float(frameCount)/float(FRAMELIMIT),(sin(ticker*8)*majorDiameter*0.75),
    (WIDTH/2) + (sin(ticker)*majorDiameter) + (sin(ticker*8)*majorDiameter*0.75), 
    (HEIGHT/2) + (cos(ticker)*majorDiameter) + (cos(ticker*8)*majorDiameter*0.75),
    (sin(ticker)*majorDiameter), 
    (cos(ticker)*majorDiameter)

    );
    
    
  stroke(255, 100*sin(ticker*4), 10, 10);
  strokeWeight(2);
  noFill();
 // fill(100*sin(ticker*4),10, 255, 80);
  line(
    //WIDTH*float(frameCount)/float(FRAMELIMIT),HEIGHT-(sin(ticker*8)*majorDiameter*0.75),
    (WIDTH/2) + (sin(ticker)*majorDiameter) + (sin(ticker*8)*majorDiameter*0.75) + (sin(ticker*128)*majorDiameter*0.1), 
    (HEIGHT/2) + (cos(ticker)*majorDiameter) + (cos(ticker*8)*majorDiameter*0.75) + (cos(ticker*128)*majorDiameter*0.1),
    WIDTH-(sin(ticker)*majorDiameter), 
    HEIGHT-(cos(ticker)*majorDiameter)
    );
   
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
