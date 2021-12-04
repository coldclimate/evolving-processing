
float[][] points;
int howMany=200;
int spacer = 80;
float wind = 0;


void setup() {
  background(0);
 // blendMode(ADD);

  size(400, 400);
  frameRate(200);
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

  wind = sin(progress);
  
   for(int row=0;row<howMany;row++){
      stroke(100,0,100);
      noFill();
      strokeWeight(points[row][2]*3);
      point(points[row][0], points[row][1]);
      
      points[row][0] = (points[row][0]+(wind * points[row][2])) % width;
      if (points[row][0]<0){points[row][0]=width;}
      points[row][1] = (points[row][1]+points[row][2]) % height;

  }
  
  saveFrame("####.png");
  update();
}
