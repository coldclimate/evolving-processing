
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
  background(30);
  float progress = ((float)(frameCount))/100;
  wind = sin(progress);
  
  
  
   for(int row=0;row<howMany;row++){
      stroke(100,0,100);
      noFill();
      strokeWeight(points[row][2]*3);
      
      // only draw the small snow
      if (points[row][2] <2) {
      point(points[row][0], points[row][1]);
      }
      
      points[row][0] = (points[row][0]+(wind * points[row][2])) % width;
      if (points[row][0]<0){points[row][0]=width;}
      points[row][1] = (points[row][1]+points[row][2]) % height;
  }
  
  // snow
  fill(100,0,100);
  stroke(100,0,100);
  
  rect(200,400,400,50);
  
  // draw penguin
  strokeWeight(1);
  //black body
  fill(0);
  stroke(0,0,0);
  ellipse(350, 350, 50, 50);
  
  //white belly
  fill(100,0,100);
  stroke(100,0,100);
  ellipse(350, 360, 30, 30);
  
  //eyes
  ellipse(360, 340, 10, 10);
  ellipse(340, 340, 10, 10);
  
  //pupils
  fill(0,0,0);
  stroke(0,0,0);
  ellipse(360, 340, 5, 5);
  ellipse(340, 340, 5, 5);
  
  //feetsand nose!
  fill(10,100,100);
  stroke(10,100,100);
  ellipse(360, 380, 5, 5);
  ellipse(340, 380, 5, 5);
  ellipse(350, 345, 5, 5);
  
  // draw the closer snow
  for(int row=0;row<howMany;row++){
      stroke(100,0,100);
      noFill();
      strokeWeight(points[row][2]*3);
      
      // only draw the small snow
      if (points[row][2] >2) {
      point(points[row][0], points[row][1]);
      }
      
      points[row][0] = (points[row][0]+(wind * points[row][2])) % width;
      if (points[row][0]<0){points[row][0]=width;}
      points[row][1] = (points[row][1]+points[row][2]) % height;
  }
  saveFrame("####.png");
  update();
}
