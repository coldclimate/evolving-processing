//Play this then run  convert -loop 0  *.png $(date +%Y_%m_%d).mpg && rm *.png
// ffmpeg -r 60 -f image2 -s 1024x800 -i %04d.png -vcodec libx264 -crf 25  -pix_fmt yuv420p $(date +%Y_%m_%d).mp4 && rm *.png



// Do anything you like below here
float majorDiameter = 100;
float minorDiameter = 50;
float ticker = 0;

// set to true to not save images whilst working
Boolean DEBUG = false;

// (WIDTH/2) + (sin(ticker)*majorDiameter)

void drawMethod(){  
 // stroke(90,80);
 
 
  strokeWeight(1);
  float colourR = random(1); 
  stroke(20,20,100,10);
  noFill();
  //fill(rando,rando, rando, 1);
  for (float i=0; i<1.1;i=i+0.2){
  float rando=random(1);
  float rando2=random(1);
  float rando3=random(1);
  float scale = ticker/FRAMELIMIT;
  triangle(
    (WIDTH*0.5)  +  (sin(TWO_PI*rando) * WIDTH * 0.3  * rando3),
    (HEIGHT*0.5)  + (cos(TWO_PI*rando) * HEIGHT * 0.3 * rando3),
    (WIDTH*0.5)  +  (sin(TWO_PI*rando2) * WIDTH * 0.3 * rando),
    (HEIGHT*0.5)  + (cos(TWO_PI*rando2) * HEIGHT * 0.3 * rando),
    (WIDTH*0.5)  +  (sin(TWO_PI*rando3) * WIDTH * 0.3 * rando2),
    (HEIGHT*0.5)  + (cos(TWO_PI*rando3) * HEIGHT * 0.3 * rando2)
    );
  }
 
 
   
  // do one complete rotation every run
  ticker += 1;
  
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
