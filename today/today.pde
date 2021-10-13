
int[][] points;
int pointsCount=60;
int eyeheight;

void setup() {
  size(400, 400, P3D);
  lights();
  background(0);
  blendMode(ADD);
  frameRate(300);
  colorMode(HSB, 100);
  eyeheight = 600;
  
  points = new int[pointsCount][3];
  for(int i=0;i<pointsCount;i++){
    points[i][0]=(int)(random(1)*width); //x
    points[i][1]=(int)(random(1)*height); //y
    points[i][2]=(int)(random(5)+1);  //speed
  }
  
}

void update() {
  if(frameCount==1000){exit();}
  eyeheight--;
  
  
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
  background(0);

noFill();
//camera(eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ)

camera(
  width/2.0, height/2.0, eyeheight,
  width/2.0, height/2.0, 0,
  0, 1, 0
  );

  for(int i=0; i<5;i++){
    float r = random(1);
    float xcircle = sin(r * 2 * PI);
    float ycircle = cos(r * 2 * PI);
    
    float smallRandom=random(20);
    float largeRandom=50+random(50);
    pushMatrix();
    strokeWeight(smallRandom/4);
    stroke(r*100,largeRandom,10);
    translate(
      (width/2)+(xcircle*largeRandom),
      (height/2)+(ycircle*largeRandom),
      largeRandom*3
      );

    box(smallRandom);
  //  rect( (width/2)+(xcircle*largeRandom),
  //        (height/2)+(ycircle*largeRandom),
  //       5,
  //       smallRandom
  //        );
    popMatrix();
   // print(xcircle);
    
  }
  saveFrame("####.png");
  update();
}
