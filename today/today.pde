
float[][] points;
int pointsCount=400;

void setup() {
  
  size(400, 400);
  background(0);
  blendMode(ADD);
  frameRate(300);
  colorMode(HSB, 100);
  
}

void update() {
  if(frameCount==1000){exit();}
}

void draw() {
  background(0);
  float progress = ((float)(frameCount))/1000;
  
   }
     

  saveFrame("####.png");
  update();
}
