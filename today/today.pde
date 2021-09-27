
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
    points[i][2]=(int)(random(5)+1);  //speed
    println(points[i][2]);
  }
  
}

void update() {
  if(frameCount==1000){exit();}
  
  
 /* for(int i=0; i<pointsCount;i++){
    //move
    
    // framecount runs from 0 to 1000
    float temp = (float)(frameCount);
    
    points[i][0]+= sin((temp/1000)*2*PI)*points[i][2];
    points[i][1]+= cos((temp/1000)*2*PI)*points[i][2];

    //wrapround world
    if(points[i][0] <0){points[i][0] = width;}
    if(points[i][0] > width){points[i][0] = 0;}
    if(points[i][1] <0 ){points[i][1] = height;}
    if(points[i][1] >height){points[i][1] = 0;}
  } */
  

  
}

void draw() {
  //background(0);

noFill();
  for(int i=0; i<pointsCount;i++){
    
    float mysteriousValue=(50*points[i][2]*sin(2*PI*(float)(frameCount)/500));
    stroke(mysteriousValue,points[i][2]*50,mysteriousValue,5);
    rect(points[i][0]-(0.5*mysteriousValue), points[i][1]-(0.5*mysteriousValue), mysteriousValue,mysteriousValue);
  }
  saveFrame("####.png");
  update();
}
