
float[][] points;
int howMany=200;
int spacer = 80;
float wind = 0;


void setup() {
  background(0);
 // blendMode(ADD);

  size(400, 400);
  frameRate(200);
  colorMode(RGB, 100);
  
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

void drawPenguin(float x, float y){
 // draw penguin
  strokeWeight(1);
  //black body
  fill(0);
  stroke(0);
  ellipse(x, y, 50, 50);
  
  //white belly
  fill(100);
  stroke(100);
  ellipse(x, y+10, 30, 30);
  
  //eyes
  ellipse(x+10, y-10, 10, 10);
  ellipse(x-10, y-10, 10, 10);
  
  //pupils
  fill(0,0,0);
  stroke(0,0,0);
  ellipse(x+10, y-10, 5, 5);
  ellipse(x-10, y-10, 5, 5);
  
  //feets and nose!
  fill(100,80,0);
  stroke(100,80,0);
  ellipse(x+10, y+30, 5, 5);
  ellipse(x-10, y+30, 5, 5);
  ellipse(x, y-5, 5, 5);
}


void drawTree(float x, float y, float size,float cycle){
  // trunk
  fill(27,18,5);
  stroke(27,18,5);
  rect(x,y+(3*size),size*0.3,2*size);
  
  // tree
  fill(0,39,0);
  stroke(0,39,0);
  triangle(x, y, x+size, y+size, x-size, y+size);
  triangle(x, y+size, x+(1.5*size), y+(2*size), x-(1.5*size), y+(2*size));
  triangle(x, y+(2*size), x+(2*size), y+(3*size), x-(2*size), y+(3*size));
  
}

void draw() {
  background(30);
  float progress = ((float)(frameCount))/100;
  wind = sin(progress);
  
  
  
   for(int row=0;row<howMany;row++){
      stroke(100,100,100);
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
  fill(100,100,100);
  stroke(100,100,100);  
  rect(200,400,400,50);
  
  //draw the tree
  drawTree(100,250,30,progress);
  drawTree(50,200,30,progress);
  drawTree(150,250,30,progress);
  drawTree(200,200,30,progress);
  drawTree(250,250,30,progress);
  drawTree(300,250,30,progress);
  drawTree(350,200,30,progress);
  drawTree(400,250,30,progress);
  
    // draw the penguin
  drawPenguin(200+(wind*200),350);
  
  // draw the closer snow
  for(int row=0;row<howMany;row++){
      stroke(100,100,100);
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
