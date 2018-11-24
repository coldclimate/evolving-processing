//Play this then run  convert -loop 0  *.png $(date +%Y_%m_%d).mpg && rm *.png
// ffmpeg -r 60 -f image2 -s 1024x800 -i %04d.png -vcodec libx264 -crf 25  -pix_fmt yuv420p $(date +%Y_%m_%d).mp4 && rm *.png


// Do anything you like below here
float circleWidth = 40;
float majorRadius = 200;


// set to true to not save images whilst working
Boolean DEBUG = true;




void drawMethod() {
  noFill();
  blendMode(ADD);
  strokeWeight(10);
  colorMode(HSB, 100);



  if (frameCount > 312) {
    blendMode(SUBTRACT);
      strokeWeight(10);
  }
  
  for (float p = 0; p < 1; p = p + 0.1) {
    float rando = random(1);
    float rando2 = random(1);
    stroke (25,50,1);
    rect(
      (WIDTH/2)+(majorRadius * sin(TWO_PI*rando)),
      (HEIGHT/2)+(majorRadius * cos(TWO_PI*rando)),
      circleWidth*rando,
      circleWidth*rando
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
