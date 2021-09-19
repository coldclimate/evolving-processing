
int[][] points;
int pointsCount=60;

void setup() {
  size(400, 400);
  background(0);
  blendMode(ADD);
  frameRate(300);
  
  points = new int[pointsCount][3];
  for(int i=0;i<pointsCount;i++){
    points[i][0]=(int)(random(1)*width); //x
    points[i][1]=(int)(random(1)*height); //y
    points[i][2]=(int)(0.1+random(1)*30);  //strange
  }
  
}

void update() {
  if(frameCount==1000){exit();}
  for(int i=0; i<pointsCount;i++){
    points[i][0]+= sin(frameCount)*points[i][2];
    points[i][1]+= cos(frameCount)*points[i][2];
  }
  
}

void draw() {
  //background(0);
  fill(255,12,100);
  for(int i=0; i<pointsCount;i++){
    ellipse(points[i][0], points[i][1], 10,10);
  }
  saveFrame("####.png");
  update();
}
