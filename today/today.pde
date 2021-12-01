
float[][] points;
int howMany=200;
int spacer = 80;


void setup() {
  background(0);
 // blendMode(ADD);

  size(400, 400);
  frameRate(300);
  colorMode(HSB, 100);
  
  rectMode(CENTER);
  
  points = new float[howMany][3];
  
  for(int row=0;row<howMany;row++){
    points[row][0] = random(400);
    points[row][1] = random(400);
    points[row][2] = random(PI);
  }
}

void update() {
  if (frameCount==1000) {
    exit();
  }
 
}

void draw() {
  background(0);
  float progress = ((float)(frameCount))/100;


   for(int row=0;row<howMany;row++){
      stroke(100,0,100);
      noFill();
      strokeWeight(points[row][2]*3);
      point(points[row][0], points[row][1]);
      
      points[row][1] = (points[row][1]+points[row][2]) % height;

  }
  
  saveFrame("####.png");
  update();
}
