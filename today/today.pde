//Play this then run  convert -loop 0  *.png $(date +%Y_%m_%d).mpg && rm *.png
// ffmpeg -r 60 -f image2 -s 1024x800 -i %04d.png -vcodec libx264 -crf 25  -pix_fmt yuv420p $(date +%Y_%m_%d).mp4 && rm *.png


// Do anything you like below here
float circleWidth = 10;



// set to true to not save images whilst working
Boolean DEBUG = false;




void drawMethod() {
  noFill();
  blendMode(ADD);
  strokeWeight(10);
  colorMode(HSB, 100);

  float majorRadius = random(500);

  if (frameCount > 312) {
    blendMode(SUBTRACT);
      strokeWeight(10);
  }
  
  for (float p = 0; p < 10; p = p + 0.1) {
    float rando = random(1);
    stroke (25,50,1);
    line(
      WIDTH/2,
      HEIGHT/2,
      (WIDTH/2) + (majorRadius*sin(rando*TWO_PI)),
      (HEIGHT/2)+ (majorRadius*cos(rando*TWO_PI))
    );
  }


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
  background(0, 0, 0);
}


void draw() {
  frameCount++;
  if (!DEBUG) {
    saveFrame("####.png");
  }
  if (frameCount == FRAMELIMIT) {
    exit();
  }
  drawMethod();
}
