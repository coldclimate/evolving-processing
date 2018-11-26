//Play this then run  convert -loop 0  *.png $(date +%Y_%m_%d).mpg && rm *.png
// ffmpeg -r 60 -f image2 -s 1024x800 -i %04d.png -vcodec libx264 -crf 25  -pix_fmt yuv420p $(date +%Y_%m_%d).mp4 && rm *.png


// set to true to not save images whilst working
Boolean DEBUG = false;
float x = 400;
float y = 300;




void drawMethod() {
blendMode(ADD);
  for (float i=0;i<1.1;i=i+0.0001){
    
  stroke(lerpColor(color(255, 0, 128, 20), color(36, 248, 229,20), i));  
  point(x,y);
  x = x + random(4) -2;
  y = y + random(4) -2;
  x = x % WIDTH;
  y = y % HEIGHT;
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
